<%-- 
    Document   : cadastro
    Created on : Dec 05, 2024, 3:19:31 PM
    Author     : Suellyn Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>CADASTRO DE EMERGENCIAS</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/STYLES/paginas-style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Bungee&display=swap');
    </style>
  </head>
  <body>
    <div>
    <h1>CADASTRE AS EMERGENCIAS AQUI!</h1>
    <form method="post" action="/CampanhaSolidaria/EmergenciaServlet?action=cadastrar">
    <label>Código</label>
    <input type="number" id="codigo" name="codigo"> 
    <label>Local</label>
    <input type="text" id="local" name="local">
    <label>Tipo</label>
    <input type="text" id="tipo" name="tipo"> 
    <label>Descrição</label>
    <textarea id="descricao" name="descricao"> </textarea>
    <button type="submit"> Cadastrar </button>
    </form>
    </div>
  </body>
</html>
