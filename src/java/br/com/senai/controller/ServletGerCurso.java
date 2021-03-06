/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.senai.controller;

import br.com.senai.model.DAO.CursoDAO;
import br.com.senai.model.DAO.ProfessorDAO;
import br.com.senai.model.bean.CursoBean;
import br.com.senai.model.bean.ProfessorBean;
import java.io.IOException;
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
public class ServletGerCurso extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        CursoDAO cursoD = new CursoDAO();
        ArrayList<CursoBean> cursos = cursoD.selectCurso();
       
        
        ProfessorDAO profD = new ProfessorDAO();
        
        ArrayList<ProfessorBean> profs = profD.selectProfessor();
        
        String [] profsNome = new String[profs.size()];
        
        for (int x = 0; x < profsNome.length; x++){
            profsNome[x] = profs.get(x).getNomeUsuario();
        }              
        
        request.setAttribute("cursos", cursos);
        request.setAttribute("professores", profsNome);
        
        RequestDispatcher rd = request.getRequestDispatcher("gerCurso.jsp");
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
