<%-- 
    Document   : admhome
    Created on : 26/10/2015, 20:38:40
    Author     : TI01N-2
--%>

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
                                <legend style="text-align: center; border-color: #0c2d4e">Cadastro de Usuário</legend>
                                <form action="ServletInsertUsuario" method="post" onload="tipoUsuario();" method="post" id="formLogin" style="max-width: 51.5em ; margin: auto;">
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
                                        <%
                                            String status = String.valueOf(request.getAttribute("status"));

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
                                                warning = "Usuário cadastrado com sucesso";
                                            }

                                            if (color != null) {
                                                out.println("<div style=\"background-color: " + color + "; width: 50em; border-radius: 5px; text-align: center; color: white;\">" + warning + "</div>");
                                            }
                                        %>
                                    </div>

                                    <div class="form-group login-input">
                                        <i class="fa fa-user overlay"></i>
                                        <input onkeyup="verifyEmail()" required style="text-align: right; margin-right: -0.323em; border-radius: 5px 0px 0px 5px; display: inline-block; width: 20em" placeholder="Email" id="email" name="email" size="30" class="form-control text-input" type="text"/>
                                        <input required disabled style=" border-radius: 0px 5px 5px 0px; display: inline-block; width: 20em; background-color: #f9f9f9" value="@unibe.edu" id="edu" name="edu" size="30" class="form-control text-input" type="text"/>
                                        <select required onchange="tipoUsuario(); storeTipo();" id="tipo" class="form-control" style="height: 50px; display: inline-block; width: 10em">
                                            <option value="" disabled selected>Selecione</option>
                                            <option value="adm">Administrador</option>
                                            <option value="aluno">Aluno</option>
                                            <option value="prof">Professor</option>
                                        </select>
                                    </div>



                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-key overlay"></i>
                                        <input  id="password" required name="password" size="30"  style=" width: 24.85em" class="form-control text-input" placeholder="Senha" type="password">                                                                                
                                    </div>



                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-key overlay"></i>
                                        <input id="passwordconfirm" onchange="verifyPassword()" required name="passwordcomfirm" size="30"  style=" width: 24.85em" class="form-control text-input" placeholder="Confirmar Senha" type="password">                                           
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


                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-money overlay"></i>                                      
                                        <input onkeyup="verifySalario();" disabled id="salario" name="salario" size="30"  style=" width: 24.85em; display: inline-block" class="form-control text-input" placeholder="Salário" type="text">                                           
                                    </div>
                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-graduation-cap overlay"></i>                                      

                                        <%
                                            String[] cursos = (String[]) request.getAttribute("cursos");

                                            if (cursos != null) {

                                                out.println("<select id=\"curso\" onchange=\"storeCurso()\" disabled class=\"form-control\" style=\"height: 50px; display: inline-block; width: 24.85em\">");

                                                out.println("<option value=\"\" disabled selected>     Selecione o Curso</option>");
                                                for (int x = 0; x < cursos.length; x++) {
                                                    String op = "     " + cursos[x];
                                                    out.println("<option value=" + cursos[x].toLowerCase().replaceAll(" ", "_") + ">" + op + "</option>");
                                                }

                                                out.println("</select>");
                                            }
                                        %>

                                    </div>


                                    <div class="row" style="text-align: center">
                                        <button id="cadastrar" type="submit" style="width: 30em; display: inline-block" class="btn btn-success-login  btn-login">Cadastrar</button>                                          
                                    </div>

                                    <input style="display: none" name="tipoRescue" id= "tipoRescue" type="text" value="."/>
                                    <input style="display: none" name="cursoRescue" id= "cursoRescue" type="text" value="."/>
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

