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
        <title>CONSULTA DE EMERGÊNCIAS</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/STYLES/consulta-style.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Bungee&display=swap');
        </style>
    </head>
    <body>
        <h1>LISTA DE EMERGÊNCIAS</h1>
        <button onclick="window.location.href = 'index.html'">Voltar</button>
        <div>
            <table border="1">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Tipo</th>
                        <th>Local</th>
                        <th>Descrição</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${empty emergencias}">
                        <tr>
                              <td colspan="4">Nenhuma Emergencia cadastrada.</td>
                        </tr>
                   </c:if>
                    <!-- Itera sobre a lista de ONGs -->
                    <minhatag:carrega entidade="emergencia" var="emergencias" escopo="pagina" paginaAtual="consultar"/>
                    <c:forEach var="emergencia" items="${emergencias}">
                        <tr>
                            <td>${emergencia.getCodigo()}</td>
                            <td>${emergencia.getTipo()}</td>
                            <td>${emergencia.getLocal()}</td>
                            <td>${emergencia.getDescricao()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>       
        </div>
    </body>
</html>
