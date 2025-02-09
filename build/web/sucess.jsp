<%-- 
    Document   : sucess
    Created on : Nov 20, 2024, 2:57:18 PM
    Author     : Suellyn Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SUCESSO</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/STYLES/index-style.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Bungee&display=swap');
        </style>
    </head>
    <body>
         <h1>${mensagem}</h1> <!-- Mensagem dinâmica -->
        <button onclick="window.location.href = 'index.html'">Voltar</button>
    </body>
</html>