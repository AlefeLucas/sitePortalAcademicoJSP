<%-- 
    Document   : cadastroCurso
    Created on : 27/10/2015, 13:11:13
    Author     : Alefe Lucas
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

        <script type="text/javascript" src="js/cadastro/cadastroCurso.js"></script>
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
                                <legend style="text-align: center; border-color: #0c2d4e">Cadastro de Cursos</legend>
                                <form action="ServletInsertCurso" method="post" method="post" id="formLogin" style="max-width: 51.5em ; margin: auto;">
                                  

                                    <div class="form-group login-input">
                                        <%
                                            String status = String.valueOf(request.getAttribute("status"));

                                            String color = null;
                                            String warning = null;

                                            if (status.equals("curso")) {
                                                color = "red";
                                                warning = "Curso já cadastrado";
                                            } else if (status.equals("sucesso")) {
                                                color = "green";
                                                warning = "Curso cadastrado com sucesso";
                                            }

                                            if (color != null) {
                                                out.println("<div style=\"background-color: " + color + "; width: 50em; border-radius: 5px; text-align: center; color: white;\">" + warning + "</div>");
                                            }
                                        %>
                                    </div>




                                    




                                    <div class="form-group login-input">
                                        <i class="fa fa-university overlay"></i>
                                        <input id="nome" required name="nome" size="30"  style=" width: 50em" class="form-control text-input" placeholder="Nome do Curso" type="text">                                           
                                    </div>

                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-clock-o overlay"></i>                                      
                                        <input onkeyup="verifyHora();" id="hora" name="hora" size="30"  style=" width: 24.85em; display: inline-block" class="form-control text-input" placeholder="Carga Horária" type="text">                                           
                                    </div>
                                    <div class="form-group login-input" style="display: inline-block">
                                        <i class="fa fa-book overlay"></i>                                      

                                        <%
                                            String[] professores = (String[]) request.getAttribute("professores");

                                            if (professores != null) {

                                                out.println("<select id=\"prof\" onchange=\"storeProf()\" class=\"form-control\" style=\"height: 50px; display: inline-block; width: 24.85em\">");

                                                out.println("<option value=\"\" disabled selected>     Selecione o Professor</option>");
                                                for (int x = 0; x < professores.length; x++) {
                                                    String op = "     " + professores[x];
                                                    out.println("<option value=" + professores[x] + ">" + op + "</option>");
                                                }

                                                out.println("</select>");
                                            }
                                        %>

                                    </div>


                                    <div class="row" style="text-align: center">
                                        <button id="cadastrar" type="submit" style="width: 30em; display: inline-block" class="btn btn-success-login  btn-login">Cadastrar</button>                                          
                                    </div>

                                    <input style="display: none" name="profRescue" id= "profRescue" type="text" value="."/>                                    
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

