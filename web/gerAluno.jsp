<%-- 
    Document   : gerAluno
    Created on : 27/10/2015, 18:36:42
    Author     : TI01N-2
--%>

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
        <!--<style>
            *{
                border: 1px solid blue;
            }
        </style>-->

    </head>
    <body  onload="createListaAlunos()"style="min-width: 70em; background-color: #FFF; background-image: url('img/backlista.png');
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
                                <legend style="text-align: center; border-color: #0c2d4e">Gerenciar Alunos</legend>

                                <div class="form-group login-input" style="max-height: 40em; overflow: auto">                                   


                                    <table class="form-control table consulta" style="height: auto;" >
                                        <tr>
                                            <td colspan="8">Alunos</td>                                            
                                        </tr>
                                        <tr>
                                            <td>ID</td>
                                            <td>Nome</td>
                                            <td>Email</td>
                                            <td>RG</td>
                                            <td>CPF</td>
                                            <td>Curso</td>
                                            <td>Nota</td>
                                            <td>Faltas</td>
                                        </tr>
                                        <%
                                            ArrayList<AlunoBean> alunos = (ArrayList<AlunoBean>) request.getAttribute("alunos");

                                            CursoDAO cursoD = new CursoDAO();

                                            for (int x = 0; x < alunos.size(); x++) {
                                                AlunoBean aluno = alunos.get(x);

                                                String nomeCurso = cursoD.getNomeCurso(aluno.getIdCurso());

                                                out.println("<tr>");
                                                out.println("<td id=\"idUsuario" + x + "\">" + aluno.getIdUsuario() + "</td>");
                                                out.println("<td id=\"nomeUsuario" + x + "\">" + aluno.getNomeUsuario() + "</td>");
                                                out.println("<td id=\"loginUsuario" + x + "\">" + aluno.getLoginUsuario() + "</td>");
                                                out.println("<td id=\"rgUsuario" + x + "\">" + aluno.getRgUsuario() + "</td>");
                                                out.println("<td id=\"cpfUsuario" + x + "\">" + aluno.getCpfUsuario() + "</td>");
                                                out.println("<td id=\"nomeCurso" + x + "\">" + nomeCurso + "</td>");
                                                out.println("<td id=\"notaAluno" + x + "\">" + aluno.getNotaAluno() + "</td>");
                                                out.println("<td id=\"faltasAluno" + x + "\">" + aluno.getFaltasAluno() + "</td>");
                                                out.println("</tr>");
                                            }
                                        %>
                                    </table>
                                </div>

                            </fieldset>
                            <% 
                            out.println("<input type=\"text\" value=\"" + alunos.size() +"\" id=\"count\" style=\"display: none;\"\\");
                            %>
                            <fieldset>
                                <legend style="text-align: center; border-color: #0c2d4e">Alterar Dados</legend>


                                <form action="ServletUpdateUser"  method="post" method="post" id="updateUser" style="max-width: 51.5em ; margin: auto;">
                                    <script type="text/javascript">
                                        $("#cpf").mask('000.000.000-00');

                                        $(document).ready(function () {
                                            $('#formSolicitacao').ajaxForm({
                                                dataType: 'json',
                                                success: function (data) {
                                                    topBarMessage(data.message, data.type, '');
                                                    if (data.type == "success") {
                                                        $('#formSolicitacao').clearForm();
                                                    }
                                                }
                                            });
                                        });

                                    </script>

                                    <script type="text/javascript">
                                        $("#rg").mask('AA-00.000.000');

                                        $(document).ready(function () {
                                            $('#formSolicitacao').ajaxForm({
                                                dataType: 'json',
                                                success: function (data) {
                                                    topBarMessage(data.message, data.type, '');
                                                    if (data.type == "success") {
                                                        $('#formSolicitacao').clearForm();
                                                    }
                                                }
                                            });
                                        });

                                    </script>

                                    <div class="form-group login-input">
                                        <%                                            String status = String.valueOf(request.getAttribute("status"));

                                            String color = null;
                                            String warning = null;

                                            if (status.equals("email")) {
                                                color = "red";
                                                warning = "Email já cadastrado";
                                            } else if (status.equals("cpf")) {
                                                color = "red";
                                                warning = "CPF já cadastrado";
                                            } else if (status.equals("rg")) {
                                                color = "red";
                                                warning = "RG já cadastrado";
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
                                        <select required onchange="setAluno();" id="id" class="form-control" style="height: 50px; display: inline-block; width: 9.7em">
                                            <option value="" disabled selected>Selecione ID</option>
                                            <%
                                                for (AlunoBean aluno : alunos) {
                                                    out.println("<option value=\"" + aluno.getIdUsuario() + "\">" + aluno.getIdUsuario() + "</option>");
                                                }

                                            %>
                                        </select>
                                    </div>

                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-user overlay"></i>
                                        <input onkeyup="verifyEmail()" required style="text-align: right; margin-right: -0.323em; border-radius: 5px 0px 0px 5px; display: inline-block; width: 20em" placeholder="Email" id="email" name="email" size="30" class="form-control text-input" type="text"/>                                        
                                        <input required disabled style=" border-radius: 0px 5px 5px 0px; display: inline-block; width: 20em; background-color: #f9f9f9" value="@unibe.edu" id="edu" name="edu" size="30" class="form-control text-input" type="text"/>                                        
                                    </div>



                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-key overlay"></i>
                                        <input  id="password"  name="password" size="30"  style=" width: 24.85em" class="form-control text-input" placeholder="Nova Senha (Opcional)" type="password">                                                                                
                                    </div>



                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-key overlay"></i>
                                        <input id="passwordconfirm" onchange="verifyPassword()" name="passwordcomfirm" size="30"  style=" width: 24.85em" class="form-control text-input" placeholder="Confirmar Senha" type="password">                                           
                                    </div>

                                    <div class="form-group login-input">
                                        <i class="fa fa-user overlay"></i>
                                        <input id="nome" required name="nome" size="30"  style=" width: 50em" class="form-control text-input" placeholder="Nome" type="text">                                           
                                    </div>

                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-male overlay"></i>
                                        <input id="rg" required name="rg" size="30"  style=" width: 24.85em" class="form-control text-input" placeholder="RG" type="text">                                                                                
                                    </div>



                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-male overlay"></i>
                                        <input id="cpf" required name="cpf" size="30"  style=" width: 24.85em" class="form-control text-input" placeholder="CPF" type="text">                                           
                                    </div>

                                    <div class="form-group login-input">
                                        <i class="fa fa-graduation-cap overlay"></i>                                      

                                        <%                                            String[] cursos = (String[]) request.getAttribute("cursos");

                                            if (cursos != null) {

                                                out.println("<select id=\"curso\" onchange=\"storeCurso()\" class=\"form-control\" style=\"height: 50px; display: inline-block; width: 50em\">");

                                                out.println("<option value=\"\" disabled selected>     Selecione o Curso</option>");
                                                for (int x = 0; x < cursos.length; x++) {
                                                    String op = "     " + cursos[x];
                                                    out.println("<option value=" + cursos[x].toLowerCase().replaceAll(" ", "_") + ">" + op + "</option>");
                                                }

                                                out.println("</select>");
                                            }
                                        %>

                                    </div>

                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-pencil overlay"></i>
                                        <input id="nota" onkeyup="verifyNota();" required name="nota" size="30"  style=" width: 24.85em" class="form-control text-input" placeholder="Nota" type="text">                                                                                
                                    </div>



                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-ban overlay"></i>
                                        <input id="faltas" onkeyup="verifyFaltas();" required name="faltas" size="30"  style=" width: 24.85em" class="form-control text-input" placeholder="Faltas" type="text">                                           
                                    </div>

                                    <div class="row" style="text-align: center; display: inline-block;  margin-left: 0.15em; margin-right: 0.075em;">
                                        <button id="cadastrar" onclick="changeUpdate()" type="submit" style="width: 24.65em; display: inline-block" class="btn btn-success-login  btn-login">Alterar</button>                                          
                                    </div>

                                    <div class="row" style="text-align: center; display: inline-block; margin-left: 0.075em;">
                                        <button id="deletar" onclick="changeDelete()" type="submit" style="width: 24.65em; display: inline-block" class="btn btn-success-login  btn-login">Deletar</button>                                          
                                    </div>

                                    <input style="display: none" name="idRescue" id= "idRescue" type="text" value="."/>
                                    <input style="display: none"  name="cursoRescue" id= "cursoRescue" type="text" value="."/>
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
