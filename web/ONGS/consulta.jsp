<%-- 
    Document   : consulta
    Created on : Nov 20, 2024, 6:17:56 PM
    Author     : Suellyn Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="minhatag" uri="/WEB-INF/tlds/minhaTag" %> <!-- Registro da tag personalizada -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONSULTA DE ONGS</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/STYLES/consulta-style.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Bungee&display=swap'); 
        </style>
    </head>
    <body>
       <h1>LISTA DE ONGS</h1>
      <button onclick="window.location.href = 'index.html'">Voltar</button>
        <div>
            <table border="1">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Login</th>
                        <th>Senha</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${empty ongs}">
                         <tr>
                               <td colspan="4">Nenhuma ONG cadastrada.</td>
                         </tr>
                    </c:if>
                    <!-- Itera sobre a lista de ONGs -->
                    <minhatag:carrega entidade="ong" var="ongs" escopo="pagina" paginaAtual="consultar"/>
                        <c:forEach var="ong" items="${ongs}">
                            <tr>
                                <td>${ong.codigo}</td>
                                <td>${ong.nome}</td>
                                <td>${ong.login}</td>
                                <td>${ong.senha}</td>
                            </tr>
                        </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
