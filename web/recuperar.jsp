<%-- 
    Document   : recuperar
    Created on : 26/10/2015, 14:13:10
    Author     : Alefe Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>UNIBE - Universidade de Betim</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="description" content="">
        <meta name="keywords" content="unibe, educação, universidade, faculdade, betim">
        <meta name="author" content="UNIBE">
        <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
        <script src="js/jquery.mask.js"></script>
        <!-- Base Css Files -->
        <link href="css/login/bootstrap.css" rel="stylesheet">           

        <!-- Extra CSS Libraries Start -->
        <link href="css/login/style.css" rel="stylesheet" type="text/css">
        <link href="css/login/login.css" rel="stylesheet" type="text/css">
        <!-- Extra CSS Libraries End -->
        <!--Requisitos-->
        <link href="css/font-awesome-4.4.0/css/font-awesome.css" rel="stylesheet" type="text/css">
                <link href="css/login/jquery.css" rel="stylesheet" type="text/css">
        <link  type="text/css" rel="stylesheet" href="css/header.css">
        <script>
            var resizefunc = [];
        </script>
        <script type="text/javascript" src="js/login/bootstrap.js"></script>        
        <link href="img/16.ico" rel="Shortcut Icon">
        <!--     Demo Specific JS Libraries -->
    </head>
    <body style="background-color: #FFF; background-image: url('img/backlista.png');
          background-repeat: repeat;" class="fixed-left login-page">

    <header>
        <a id="logo" href="#">
            <img id="logo" src="img/logo.png" style="height: 3em; "/>
        </a>
        <nav >
            <ul class="menu">
                <li><a href="index.html">Home</a></li>
               <li><a href="#">Galeria</a></li>
                <li><a href="#">Sobre</a></li>
            </ul>
        </nav>
    </header>


    <section>
        <!-- Begin page -->
        <div class="container-fluid">
            <div class="col-md-7 col-lg-7">
                <img src="img/login/login.png" class="img-responsive" alt="Você em primeiro plano e um mundo de possibilidades." title="Você em primeiro plano e um mundo de possibilidades."/>
            </div>
            <div class="col-md-4 top-login">

                <p class="text-center">
                    <img style="max-width: 50%;"  src="img/logo.png" alt="Unipam" title="Unipam">
                </p>
                <div class="login-wrap animated flipInX">
                    <div class="login-block">

                        <div class="md-content">
                            <fieldset>
                                <legend style="border-color: #0c2d4e">Recuperar Senha</legend>

                                <br/>
                                <ul>
                                    <li>
                                        Atenção: Informe os dados abaixo para criar uma senha nova.
                                    </li>
                                    <li>
                                        Os dados informados devem coincidir com os dados presente no seu cadastro.
                                    </li>                                    
                                </ul>

                                <form action="ServletRecuperar" method="post" id="formSolicitacao">
                                    <%
                                        boolean certo = (Boolean) request.getAttribute("result");

                                        if (!certo) {
                                            out.println("<div style=\"background-color: red; border-radius: 5px; color: white; text-align: center; margin-bottom: 1em;\">Email ou CPF incorretos</div>");
                                        } else {
                                            out.println("<div style=\"background-color: green; border-radius: 5px; color: white; text-align: center; margin-bottom: 1em;\">Senha alterada com sucesso</div>");
                                        }
                                    %>
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
                                    
                                    <div class="form-group login-input">
                                        <i class="fa fa-user overlay"></i>
                                        <input required placeholder="Email" id="email" name="email" size="30" class="form-control text-input" onkeypress="verificarCapsLock(event)" type="email"/>
                                    </div>
                                    <div class="form-group login-input">
                                        <i class="fa fa-male overlay"></i>    
                                        <input required class="form-control text-input" name="cpf" size="30" id="cpf" placeholder="CPF" type="text">
                                    </div>                                        

                                    <div class="form-group login-input">
                                        <i class="fa fa-key overlay"></i>
                                        <input id="password" required name="password" size="30" class="form-control text-input" placeholder="Nova Senha" type="password">                                            
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <button type="submit" class="btn btn-success-login btn-block btn-login">Alterar Senha</button>
                                        </div>
                                    </div>
                                </form>
                            </fieldset>
                        </div>	



                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-md-offset-1">
                        <div class="col-xs-8">
                            <ul class="nav nav-pills formt-lg1">
                                <li>
                                    <a href="index.html">
                                        <i class="fa fa-arrow-left formt-set"></i>&nbsp; <span style="color: #333">Voltar para o Login</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>





            </div>
        </div>
        <!-- the overlay modal element -->
        <div class="md-overlay"></div>
        <!-- End of eoverlay modal -->
    </section>
</body>
</html>