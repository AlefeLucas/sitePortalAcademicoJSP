<%-- 
    Document   : homeAdm
    Created on : 29/10/2015, 01:42:44
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
            <div>ADMINISTRADOR</div>



        </section>

    </body>
</html>
