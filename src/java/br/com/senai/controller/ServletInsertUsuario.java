/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.senai.controller;

import br.com.senai.model.DAO.AdmDAO;
import br.com.senai.model.DAO.AlunoDAO;
import br.com.senai.model.DAO.CursoDAO;
import br.com.senai.model.DAO.ProfessorDAO;
import br.com.senai.model.DAO.UsuarioDAO;
import br.com.senai.model.bean.AdmBean;
import br.com.senai.model.bean.AlunoBean;
import br.com.senai.model.bean.CursoBean;
import br.com.senai.model.bean.ProfessorBean;
import br.com.senai.model.bean.UsuarioBean;
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
 * @author TI01N-2
 */
public class ServletInsertUsuario extends HttpServlet {

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
        
        CursoDAO cursoD = new CursoDAO();
        
        ArrayList<CursoBean> cursos = cursoD.selectCurso();
        
        String [] cursosNome = new String[cursos.size()];
        
        for (int x = 0; x < cursosNome.length; x++){
            cursosNome[x] = cursos.get(x).getNomeCurso();
        }
        
        request.setAttribute("cursos", cursosNome);
        

        String email = request.getParameter("email") + "@unibe.edu";
        String nome = request.getParameter("nome");
        String senha = request.getParameter("password");
        String rg = request.getParameter("rg").toUpperCase();
        String cpf = request.getParameter("cpf");

        UsuarioDAO userD = new UsuarioDAO();

        if (userD.emailExists(email)) {
            request.setAttribute("status", "email");
            RequestDispatcher rd = request.getRequestDispatcher("cadastroUsuario.jsp");
            rd.forward(request, response);
        } else if (userD.cpfExists(cpf)) {
            request.setAttribute("status", "cpf");
            RequestDispatcher rd = request.getRequestDispatcher("cadastroUsuario.jsp");
            rd.forward(request, response);
        } else if (userD.rgExists(rg)) {
            request.setAttribute("status", "rg");
            RequestDispatcher rd = request.getRequestDispatcher("cadastroUsuario.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("status", "sucesso");
            String tipo = String.valueOf(request.getParameter("tipoRescue"));
            System.out.println("tipo");
            if (tipo.equals("aluno")) {
                String curso = request.getParameter("cursoRescue").replaceAll("_", " ");               
                int idCurso = cursoD.getIdCurso(curso);
                AlunoBean aluno = new AlunoBean(idCurso, 0, 0, -999, email, senha, nome, rg, cpf);
                AlunoDAO alunoD = new AlunoDAO();
                alunoD.insertAluno(aluno);
            } else if (tipo.equals("prof")) {
                double salario = Double.parseDouble(request.getParameter("salario"));
                ProfessorBean prof = new ProfessorBean(salario, -999, email, senha, nome, rg, cpf);
                ProfessorDAO profD = new ProfessorDAO();
                profD.insertProfessor(prof);
            } else if (tipo.equals("adm")) {
                AdmBean adm = new AdmBean(0, email, senha, nome, rg, cpf);
                AdmDAO admD = new AdmDAO();
                admD.insertAdm(adm);
            }

            RequestDispatcher rd = request.getRequestDispatcher("cadastroUsuario.jsp");
            rd.forward(request, response);
        }
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
