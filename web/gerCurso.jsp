<%-- 
    Document   : gerAluno
    Created on : 27/10/2015, 18:36:42
    Author     : TI01N-2
--%>

<%@page import="br.com.senai.model.DAO.ProfessorDAO"%>
<%@page import="br.com.senai.model.bean.CursoBean"%>
<%@page import="br.com.senai.model.bean.ProfessorBean"%>
<%@page import="br.com.senai.model.DAO.CursoDAO"%>
<%@page import="br.com.senai.model.bean.AlunoBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
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

        <link  type="text/css" rel="stylesheet" href="css/header.css">
        <link type="text/css" rel="stylesheet" href="css/consulta/tabela.css">

        <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
        <script src="js/jquery.mask.js"></script>        
        <script type="text/javascript" src="js/login/bootstrap.js"></script>        

        <script type="text/javascript" src="js/cadastro/cadastro.js"></script>
        <script type="text/javascript" src="js/cadastro/cadastroCurso.js"></script>
        <script type="text/javascript" src="js/cadastro/gerCurso.js"></script>
        <!--<style>
            *{
                border: 1px solid blue;
            }
        </style>-->

    </head>
    <body  onload="createListaCursos()"style="min-width: 70em; background-color: #FFF; background-image: url('img/backlista.png');
           background-repeat: repeat;">
        <header>
            <a id="logo" href="#">
                <img id="logo" src="img/logo.png" style="height: 3em; "/>
            </a>
            <nav >
                <ul class="menu">
                    <li><a href="ServletCadastro">Cadastro de Usuários</a></li>                    
                    <li><a href="ServletCadastroCurso">Cadastro de Cursos</a></li>
                    <li><a href="#">Gerenciar</a>
                        <ul>
                            <li><a href="ServletGerAluno">Alunos</a></li>                    
                            <li><a href="ServletGerProf">Professores</a></li>
                            <li><a href="ServletGerCurso">Cursos</a></li>                            
                        </ul>
                    </li>
                    <li><a href="index.html">Sair</a></li>
                </ul>
            </nav>
        </header>
        <section>
            <div class="login-wrap animated flipInX" >
                <div class="login-block" >

                    <div class="small-4 small-centered columns" >
                        <div class="loginContainer" style="text-aling: center">
                            <fieldset >
                                <legend style="text-align: center; border-color: #0c2d4e">Gerenciar Cursos</legend>

                                <div class="form-group login-input" style="max-height: 40em; overflow: auto">                                   


                                    <table class="form-control table consulta" style="height: auto;" >
                                        <tr>
                                            <td colspan="8">Cursos</td>                                            
                                        </tr>
                                        <tr>
                                            <td>ID</td>
                                            <td>Nome do Curso</td>
                                            <td>Professor</td>
                                            <td>Carga Horária</td>                                            
                                        </tr>
                                        <%
                                            ArrayList<CursoBean> cursos = (ArrayList<CursoBean>) request.getAttribute("cursos");
                                            ProfessorDAO profD = new ProfessorDAO();

                                            System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                                            
                                            
                                            for (int x = 0; x < cursos.size(); x++) {
                                                CursoBean curso = cursos.get(x);
                                                                                                
                                                String prof = profD.getNomeUsuario(curso.getIdProf());
                                                out.println("<tr>");
                                                out.println("<td id=\"idCurso" + x + "\">" + curso.getIdCurso() + "</td>");
                                                out.println("<td id=\"nomeCurso" + x + "\">" + curso.getNomeCurso() + "</td>");
                                                out.println("<td id=\"professor" + x + "\">" + prof + "</td>");
                                                out.println("<td id=\"cargaHoraria" + x + "\">" + curso.getCargaHoraria() + "</td>");
                                                out.println("</tr>");
                                            }
                                        %>
                                    </table>
                                </div>

                            </fieldset>
                            <%
                                out.println("<input type=\"text\" value=\"" + cursos.size() + "\" id=\"count\" style=\"display: none;\"\\");
                            %>
                            <fieldset>
                                <legend style="text-align: center; border-color: #0c2d4e">Alterar Dados</legend>


                                <form action="ServletUpdateCurso"  method="post" id="updateCurso" style="max-width: 51.5em ; margin: auto;">



                                    <div class="form-group login-input">
                                        <%                                            String status = String.valueOf(request.getAttribute("status"));

                                            String color = null;
                                            String warning = null;

                                            if (status.equals("curso")) {
                                                color = "red";
                                                warning = "Curso já cadastrado";
                                            } else if (status.equals("sucesso")) {
                                                color = "green";
                                                warning = "Dados alterados com sucesso";
                                            } else if (status.equals("deletado")) {
                                                color = "green";
                                                warning = "Dados deletados com sucesso";
                                            }

                                            if (color != null) {
                                                out.println("<div style=\"background-color: " + color + "; width: 50em; border-radius: 5px; text-align: center; color: white;\">" + warning + "</div>");
                                            }
                                        %>
                                    </div>
                                    <div class="form-group login-input" style="display: inline-block">
                                        <select required onchange="setCurso(); storeProf();" id="id" class="form-control" style="height: 50px; display: inline-block; width: 9.7em">
                                            <option value="" disabled selected>Selecione ID</option>
                                            <%
                                                for (CursoBean curso : cursos) {
                                                    out.println("<option value=\"" + curso.getIdCurso() + "\">" + curso.getIdCurso() + "</option>");
                                                }

                                            %>
                                        </select>
                                    </div>

                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-university overlay"></i>
                                        <input id="nome" required name="nome" size="30"  style=" width: 40em" class="form-control text-input" placeholder="Nome do Curso" type="text">                                           
                                    </div>

                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-clock-o overlay"></i>                                      
                                        <input onkeyup="verifyHora();" id="hora" name="hora" size="30"  style=" width: 24.85em; display: inline-block" class="form-control text-input" placeholder="Carga Horária" type="text">                                           
                                    </div>
                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-book overlay"></i>                                      

                                        <%                                            String[] professores = (String[]) request.getAttribute("professores");

                                            if (professores != null) {

                                                out.println("<select id=\"prof\" onchange=\"storeProf()\" class=\"form-control\" style=\"height: 50px; display: inline-block; width: 24.85em\">");

                                                out.println("<option value=\"\" selected>     Selecione o Professor</option>");
                                                for (int x = 0; x < professores.length; x++) {
                                                    String op = "     " + professores[x];
                                                    out.println("<option value=" + professores[x] + ">" + op + "</option>");
                                                }

                                                out.println("</select>");
                                            }
                                        %>

                                    </div>

                                    <div class="row" style="text-align: center; display: inline-block;  margin-left: 0.15em; margin-right: 0.075em;">
                                        <button id="cadastrar" onclick="changeUpdateCurso()" type="submit" style="width: 24.65em; display: inline-block" class="btn btn-success-login  btn-login">Alterar</button>                                          
                                    </div>

                                    <div class="row" style="text-align: center; display: inline-block; margin-left: 0.075em;">
                                        <button id="deletar" onclick="changeDeleteCurso()" type="submit" style="width: 24.65em; display: inline-block" class="btn btn-success-login  btn-login">Deletar</button>                                          
                                    </div>

                                    <input style="display: none" name="idRescue" id= "idRescue" type="text" value="."/>
                                    <input style="display: none"  name="profRescue" id= "profRescue" type="text" value="."/>                                    
                                </form>


                            </fieldset>                           
                        </div>
                    </div>


                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#formLogin').ajaxForm({
                                dataType: 'json',
                                success: function (data) {
                                    if (data.type == "success") {
                                        window.location.href = data.route;//'/';
                                    } else {
                                        $("#formLogin").clearForm();
                                        topBarMessage(data.message, data.type, data.route); //''

                                    }
                                }
                            });
                        });
                    </script>
                </div>
            </div>



        </section>

    </body>
</html>
