
<%-- 
    Document   : deletar
    Created on : Dec 05, 2024, 3:20:56 PM
    Author     : Suellyn Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
  <head>
    <title>REMOÇÃO DE CAMPANHAS</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/STYLES/paginas-style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Bungee&display=swap');
    </style>
  </head>
  <body>
    <div>
    <h1>DELETE AS CAMPANHAS AQUI!</h1>
    <form method="post" action="/CampanhaSolidaria/CampanhaServlet?action=deletar">
    <label>Código</label>
    <input type="number" id="codigo" name="codigo">
    <button type="submit">Deletar</button>
    </form>
    </div>
  </body>
</html>