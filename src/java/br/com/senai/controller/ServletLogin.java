/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.senai.controller;

import br.com.senai.model.DAO.AdmDAO;
import br.com.senai.model.DAO.AlunoDAO;
import br.com.senai.model.DAO.ProfessorDAO;
import br.com.senai.model.DAO.UsuarioDAO;
import br.com.senai.model.bean.AlunoBean;
import br.com.senai.model.bean.ProfessorBean;
import br.com.senai.model.bean.UsuarioBean;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TI01N-2
 */
public class ServletLogin extends HttpServlet {

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

        String email = request.getParameter("email").toLowerCase();
        String password = request.getParameter("password");

        UsuarioDAO userD = new UsuarioDAO();
        AdmDAO admD = new AdmDAO();
        ProfessorDAO profD = new ProfessorDAO();
        AlunoDAO alunoD = new AlunoDAO();
        if (userD.logIn(email, password)) {
            System.out.println("CERTO");
            UsuarioBean user = new UsuarioBean(userD.getUserId(email), email, password);            
            if (admD.isAdm(user.getIdUsuario())) {
                
                ArrayList<UsuarioBean> listaAdm = admD.selectUser();
                UsuarioBean adm = null;
                for (UsuarioBean ad : listaAdm){
                    if (ad.getLoginUsuario().equals(user.getLoginUsuario())){
                        adm = ad;
                        break;
                    }
                }
                
                request.setAttribute("adm", adm);
                
                RequestDispatcher rd = request.getRequestDispatcher("ServletGerAluno");
                rd.forward(request, response);
            } else if (profD.isProf(user)) {
                
                ArrayList<ProfessorBean> listaProf = profD.selectProfessor();
                ProfessorBean prof = null;
                for (ProfessorBean pr : listaProf){
                    if (pr.getLoginUsuario().equals(user.getLoginUsuario())){
                        prof = pr;
                        break;
                    }
                }
                
                request.setAttribute("professor", prof);
                RequestDispatcher rd = request.getRequestDispatcher("homeProf.jsp");
                rd.forward(request, response);
            } else {
                
                
                ArrayList<AlunoBean> listaAluno = alunoD.selectAluno();
                AlunoBean aluno = null;
                for (AlunoBean al : listaAluno){
                    if (al.getLoginUsuario().equals(user.getLoginUsuario())){
                        aluno = al;
                        break;
                    }
                }
                request.setAttribute("aluno", aluno);
                RequestDispatcher rd = request.getRequestDispatcher("homeAluno.jsp");
                rd.forward(request, response);
            }
        } else {
            System.out.println("ERRADO");
            request.setAttribute("certo", false);
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

        /*        request.setAttribute("listaAluno", listaAluno);

         RequestDispatcher rd = request.getRequestDispatcher("listaAlunos.jsp");
         rd.forward(request, response);*/
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
