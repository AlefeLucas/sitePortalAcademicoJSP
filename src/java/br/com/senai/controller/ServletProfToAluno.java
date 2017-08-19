/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.senai.controller;

import br.com.senai.model.DAO.AlunoDAO;
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

/**
 *
 * @author Alefe Lucas
 */
public class ServletProfToAluno extends HttpServlet {

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

        AlunoDAO alunoD = new AlunoDAO();

        int id = Integer.parseInt(request.getParameter("idRescue"));
        double nota = Double.parseDouble(request.getParameter("nota"));
        double faltas = Double.parseDouble(request.getParameter("faltas"));

        alunoD.profUpdateAluno(nota, faltas, id);

        ProfessorDAO profD = new ProfessorDAO();
        
        String login = request.getParameter("emailProf");
        
        ArrayList<ProfessorBean> listaProf = profD.selectProfessor();
        ProfessorBean prof = null;
        for (ProfessorBean pr : listaProf) {
            if (pr.getLoginUsuario().equals(login)) {
                prof = pr;
                break;
            }
        }

        request.setAttribute("professor", prof);
        request.setAttribute("status", "sucesso");

        RequestDispatcher rd = request.getRequestDispatcher("homeProf.jsp");
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
