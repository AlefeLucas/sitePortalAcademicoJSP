
package br.com.senai.controller;

import br.com.senai.model.DAO.AlunoDAO;
import br.com.senai.model.DAO.CursoDAO;
import br.com.senai.model.DAO.UsuarioDAO;
import br.com.senai.model.bean.AlunoBean;
import br.com.senai.model.bean.CursoBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletDeleteUser extends HttpServlet {

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

        String[] cursosNome = new String[cursos.size()];

        for (int x = 0; x < cursosNome.length; x++) {
            cursosNome[x] = cursos.get(x).getNomeCurso();
        }

        request.setAttribute("cursos", cursosNome);
        
        AlunoDAO alunoD = new AlunoDAO();
       

        int id = Integer.parseInt(request.getParameter("idRescue"));
        
        UsuarioDAO userD = new UsuarioDAO();
        
        userD.deleteUser(id);
        
        request.setAttribute("status", "deletado");
        
         ArrayList<AlunoBean> listaAluno = alunoD.selectAluno();
        
        request.setAttribute("alunos", listaAluno);
        
        RequestDispatcher rd = request.getRequestDispatcher("gerAluno.jsp");

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
