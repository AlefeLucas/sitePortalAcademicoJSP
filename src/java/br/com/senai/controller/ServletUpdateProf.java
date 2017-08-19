
package br.com.senai.controller;

import br.com.senai.model.DAO.ProfessorDAO;
import br.com.senai.model.DAO.UsuarioDAO;
import br.com.senai.model.bean.ProfessorBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletUpdateProf extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        ProfessorDAO profD = new ProfessorDAO();
        
        int id = Integer.parseInt(request.getParameter("idRescue"));
        String email = request.getParameter("email") + "@unibe.edu";
        String nome = request.getParameter("nome");
        String senha = request.getParameter("password");
        String rg = request.getParameter("rg").toUpperCase();
        String cpf = request.getParameter("cpf");        
        double salario = Double.parseDouble(request.getParameter("salario"));        

        UsuarioDAO userD = new UsuarioDAO();

        if (userD.emailExists(email, id)) {
            request.setAttribute("status", "email");
            
        } else if (userD.cpfExists(cpf, id)) {
            request.setAttribute("status", "cpf");
           
        } else if (userD.rgExists(rg, id)) {
            request.setAttribute("status", "rg");
            
        } else {
            request.setAttribute("status", "sucesso");
            
            ProfessorBean prof = new ProfessorBean(salario, id, email, senha, nome, rg, cpf);
            
            profD.updateProfessor(prof);
        }
        
        
        ArrayList<ProfessorBean> listaProf = profD.selectProfessor();

        request.setAttribute("profs", listaProf);

        RequestDispatcher rd = request.getRequestDispatcher("gerProf.jsp");
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
