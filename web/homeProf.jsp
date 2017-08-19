<%-- 
    Document   : homeProf
    Created on : 29/10/2015, 01:45:48
    Author     : Alefe Lucas
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.senai.model.DAO.ProfessorDAO"%>
<%@page import="br.com.senai.model.bean.ProfessorBean"%>
<%@page import="br.com.senai.model.DAO.CursoDAO"%>
<%@page import="br.com.senai.model.bean.AlunoBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>UNIBE - Portal Acadêmico</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="css/login/style.css" rel="stylesheet" type="text/css">
        <link href="css/login/login.css" rel="stylesheet" type="text/css">        
        <link href="img/16.ico" rel="Shortcut Icon">
        <link href="css/font-awesome-4.4.0/css/font-awesome.css" rel="stylesheet" type="text/css">        
        <link href="css/login/jquery.css" rel="stylesheet" type="text/css">
        <link href="css/login/bootstrap.css" rel="stylesheet">      
        <link type="text/css" rel="stylesheet" href="css/consulta/tabela.css">

        <link  type="text/css" rel="stylesheet" href="css/header.css">

        <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
        <script src="js/jquery.mask.js"></script>        
        <script type="text/javascript" src="js/login/bootstrap.js"></script>        

        <script type="text/javascript" src="js/cadastro/cadastro.js"></script>
        <!--<style>
            *{
                border: 1px solid blue;
            }
        </style>-->

    </head>
    <body style="min-width: 70em; background-color: #FFF; background-image: url('img/backlista.png');
          background-repeat: repeat;">
        <header>
            <a id="logo" href="#">
                <img id="logo" src="img/logo.png" style="height: 3em; "/>
            </a>
            <nav >
                <ul class="menu">
                    <li><a href="index.html">Sair</a></li>

                </ul>
            </nav>
        </header>
        <section>
            <div class="login-wrap animated flipInX" >
                <div class="login-block" >

                    <div class="small-4 small-centered columns" >
                        <div class="loginContainer" style="text-aling: center">
                            <div class="form-group login-input" style="max-height: 40em; overflow: auto">                                   


                                <table class="form-control table consulta" style="height: auto;" >
                                    <tr>
                                        <td colspan="8">Seus Alunos</td>                                            
                                    </tr>
                                    <tr>                        
                                        <td>Curso</td>
                                        <td>ID do Aluno</td>
                                        <td>Aluno</td>
                                        <td>Nota</td>
                                        <td>Faltas</td>                                        
                                    </tr>
                                    <%
                                        ProfessorBean prof = (ProfessorBean) request.getAttribute("professor");

                                        CursoDAO cursoD = new CursoDAO();

                                        ProfessorDAO profD = new ProfessorDAO();
                                        ArrayList<AlunoBean> alunos = profD.getOwnAlunos(prof);

                                        for (int x = 0; x < alunos.size(); x++) {
                                            AlunoBean aluno = alunos.get(x);

                                            String nomeCurso = cursoD.getNomeCurso(aluno.getIdCurso());

                                            out.println("<tr>");

                                            out.println("<td>" + nomeCurso + "</td>");
                                            out.println("<td id=\"idAluno" + x + "\">" + aluno.getIdUsuario() + "</td>");
                                            out.println("<td>" + aluno.getNomeUsuario() + "</td>");
                                            out.println("<td id=\"notaAluno" + x + "\">" + aluno.getNotaAluno() + "</td>");
                                            out.println("<td id=\"faltasAluno" + x + "\">" + aluno.getFaltasAluno() + "</td>");
                                            out.println("</tr>");
                                        }
                                    %>
                                </table>
                            </div>


                            <fieldset>
                                <legend style="text-align: center; border-color: #0c2d4e">Alterar Dados</legend>


                                <form action="ServletProfToAluno"  method="post" id="profToAluno" style="max-width: 51.5em ; margin: auto;">



                                    <div class="form-group login-input">
                                        <%
                                            String status = String.valueOf(request.getAttribute("status"));

                                            String color = null;
                                            String warning = null;

                                            if (status.equals("erro")) {
                                                color = "red";
                                                warning = "Erro ao atualizar";
                                            } else if (status.equals("sucesso")) {
                                                color = "green";
                                                warning = "Dados alterados com sucesso";
                                            }
                                            if (color != null) {
                                                out.println("<div style=\"background-color: " + color + "; width: 50em; border-radius: 5px; text-align: center; color: white;\">" + warning + "</div>");
                                            }
                                        %>
                                    </div>
                                    <script>
                                        function storeAluno() {
                                            var id = document.getElementById("id").value;
                                            document.getElementById("idRescue").value = id;
                                        }
                                    </script>
                                    <div class="form-group login-input" >
                                        <select required onchange="storeAluno()" id="id" class="form-control" style="height: 50px; display: inline-block; width: 50em">
                                            <option value="" disabled selected>Selecione ID</option>
                                            <%
                                                for (AlunoBean aluno : alunos) {
                                                    out.println("<option value=\"" + aluno.getIdUsuario() + "\">" + aluno.getIdUsuario() + "</option>");
                                                }

                                            %>
                                        </select>
                                    </div>                                    

                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-pencil overlay"></i>                                      
                                        <input required onkeyup="verifyNota();" id="nota" name="nota" size="30"  style=" width: 24.85em; display: inline-block" class="form-control text-input" placeholder="Nota" type="text">                                           
                                    </div>

                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-ban overlay"></i>                                      
                                        <input required onkeyup="verifyFaltas();" id="faltas" name="faltas" size="30"  style=" width: 24.85em; display: inline-block" class="form-control text-input" placeholder="Faltas" type="text">                                           
                                    </div>

                                    <div class="row" style="text-align: center;">
                                        <button id="cadastrar" type="submit" style="width: 24.65em; display: inline-block" class="btn btn-success-login  btn-login">Alterar</button>                                          
                                    </div>                                   
                                        
                                    <%                                                
                                       out.println("<input style=\"display: none;\" name=\"emailProf\" id=\"emailProf\" type=\"text\" value=\"" + prof.getLoginUsuario() + "\"/>");
                                    %>  
                                    
                                    
                                    <input style="display: none;" name="idRescue" id= "idRescue" type="text" value="."/>                                    
                                </form>


                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>




        </section>

    </body>
</html>