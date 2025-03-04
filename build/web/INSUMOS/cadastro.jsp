<%-- 
    Document   : cadastro
    Created on : Dec 05, 2024, 3:19:31 PM
    Author     : Suellyn Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>CADASTRO DE INSUMOS</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/STYLES/paginas-style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Bungee&display=swap');
    </style>
  </head>
  <body>
    <div>
    <h1>CADASTRE OS INSUMOS A SEREM DOADOS AQUI!</h1>
    <form method="post" action="/CampanhaSolidaria/InsumoServlet?action=cadastrar">
    <label>Código</label>
    <input type="number" id="codigo" name="codigo">
    <label>Nome</label>
    <input type="text" id="nome" name="nome">
    <label>Marca</label>
    <input type="text" id="marca" name="marca">
    <label>Categoria</label> 
    <input type="text" id="categoria" name="categoria">
    <button type="submit"> Cadastrar </button>
    </form>
    </div>
  </body>
</html>
