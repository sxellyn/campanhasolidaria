<%-- 
    Document   : cadastro
    Created on : Dec 05, 2024, 3:19:31 PM
    Author     : Suellyn Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="minhatag" uri="/WEB-INF/tlds/minhaTag" %> <!-- Registro da tag personalizada -->
<!DOCTYPE html>
<html>
  <head>
    <title>CADASTRO DE ONGS</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/STYLES/paginas-style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Bungee&display=swap');
    </style>
  </head>
  <body>
    <div>
    <h1>CADASTRE AS ONGS AQUI!</h1>
    <form method="post" action="/CampanhaSolidaria/OngServlet?action=cadastrar">
    <label>Código da ONG a ser cadastrada</label>
    
    <input type="number" id="codigo" name="codigo" required>
    <label>Nome</label>
    <input type="text" id="nome" name="nome" required>
    <label>Login</label>
    <input type="text" id="login" name="login" required>
    <label>Senha</label>
    <input type="password" id="senha" name="senha" required>

    <button type="submit"> Cadastrar </button>
    </form>
    </div>
  </body>
</html>
