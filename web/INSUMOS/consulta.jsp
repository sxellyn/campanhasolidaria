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
        <title>CONSULTA DE INSUMOS</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/STYLES/consulta-style.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Bungee&display=swap');
        </style>
    </head>
    <body>
        <h1>LISTA DE INSUMOS</h1>
        <button onclick="window.location.href = 'index.html'">Voltar</button>

        <div>
            <table border="1">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Marca</th>
                        <th>Categoria</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${empty insumos}">
                        <tr>
                              <td colspan="4">Nenhum Insumo cadastrado.</td>
                        </tr>
                   </c:if>
                    <!-- Itera sobre a lista de Insumos -->
                   <minhatag:carrega entidade="insumo" var="insumos" escopo="pagina" paginaAtual="consultar"/>
                    <c:forEach var="insu" items="${insumos}">
                        <tr>
                            <td>${insu.getCodigo()}</td>
                            <td>${insu.getNome()}</td>
                            <td>${insu.getMarca()}</td>
                            <td>${insu.getCategoria()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
