<%-- 
    Document   : login
    Created on : 23/10/2015, 21:01:07
    Author     : TI01N-2
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
                    <img style="max-width: 50%;" title="UNIBE" alt="UNIBE" src="img/logo.png">
                </p>
                <div class="login-wrap animated flipInX">
                    <div class="login-block">
                        <div class="row">
                            <div class="small-4 small-centered columns">
                                <div class="loginContainer">
                                    <form action="ServletLogin" method="post" id="formLogin">
                                        <%
                                            boolean certo = (Boolean) request.getAttribute("certo");

                                            if(!certo){
                                                out.println("<div style=\"background-color: red; border-radius: 5px; color: white; text-align: center; margin-bottom: 1em;\">Email ou senha incorretos</div>");
                                            }
                                        %>
                                        
                                        
                                        <div class="form-group login-input">
                                            <i class="fa fa-user overlay"></i>
                                            <input required placeholder="Email" id="email" name="email" size="30" class="form-control text-input" onkeypress="verificarCapsLock(event)" type="email"/>
                                        </div>
                                        <div class="form-group login-input">
                                            <i class="fa fa-key overlay"></i>
                                            <input id="password" required name="password" size="30" class="form-control text-input" placeholder="Senha" type="password">
                                            <!--placeholder="********"-->
                                            <div class="texto-login">
                                                <small class="text-right"><a href="recuperar.html">Esqueceu a senha?</a></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <button type="submit" class="btn btn-success-login btn-block btn-login">Entrar</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
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
            </div>
        </div>
        <!-- the overlay modal element -->
        <div class="md-overlay"></div>
        <!-- End of eoverlay modal -->
    </section>
</body>
</html>