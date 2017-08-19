<%-- 
    Document   : homeAluno
    Created on : 29/10/2015, 01:44:13
    Author     : Alefe Lucas
--%>

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
                                        <td colspan="8">Seus Dados</td>                                            
                                    </tr>
                                    <tr>                        
                                        <td>Nome</td>
                                        <td>Email</td>
                                        <td>RG</td>
                                        <td>CPF</td>
                                        <td>Curso</td>
                                        <td>Nota</td>
                                        <td>Faltas</td>
                                    </tr>
                                    <%
                                        AlunoBean aluno = (AlunoBean) request.getAttribute("aluno");

                                        CursoDAO cursoD = new CursoDAO();

                                        String nomeCurso = cursoD.getNomeCurso(aluno.getIdCurso());

                                        out.println("<tr>");

                                        out.println("<td>" + aluno.getNomeUsuario() + "</td>");
                                        out.println("<td>" + aluno.getLoginUsuario() + "</td>");
                                        out.println("<td>" + aluno.getRgUsuario() + "</td>");
                                        out.println("<td>" + aluno.getCpfUsuario() + "</td>");
                                        out.println("<td>" + nomeCurso + "</td>");
                                        out.println("<td>" + aluno.getNotaAluno() + "</td>");
                                        out.println("<td>" + aluno.getFaltasAluno() + "</td>");
                                        out.println("</tr>");

                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </section>

    </body>
</html>
