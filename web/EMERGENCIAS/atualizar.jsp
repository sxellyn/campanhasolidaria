<%-- Document : atualizar Created on : Dec 05, 2024, 3:18:47 PM Author : Suellyn
Gomes --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="minhatag" uri="/WEB-INF/tlds/minhaTag" %> <!-- Registro da tag personalizada -->
<!DOCTYPE html>
<html>
  <head>
    <title>ATUALIZAR EMERGENCIAS</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      type="text/css"
      href="<%= request.getContextPath()%>/STYLES/paginas-style.css"
    />
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Bungee&display=swap");
    </style>
  </head>
  <body>
    <div>
      <h1>ATUALIZE AS EMERGÊNCIAS AQUI!</h1>
      <form
        method="post"
        action="/CampanhaSolidaria/EmergenciaServlet?action=atualizar"
      >
        <label>Código da emergência a ser atualizada</label>
        <input type="number" id="codigo" name="codigo" value="${param.codigo}" />
        <minhatag:carrega
        entidade="emergencia"
        var="emergencia"
        escopo="requisicao"
        codigo="${param.codigo != null ? param.codigo : 0}"
        paginaAtual="atualizar"
      />

      <button type="submit" formaction="${pageContext.request.contextPath}/EmergenciaServlet" formmethod="get" name="action" value="buscar">buscar</button>
        <label>Local</label>
        <input type="text" id="local" name="local" value="${emergencia.local}"/>
        <label>Tipo</label>
        <input type="text" id="tipo" name="tipo" value="${emergencia.tipo}"/>
        <label>Descrição</label>
        <textarea id="descricao" name="descricao">${emergencia.descricao}</textarea>
        <button type="submit">Atualizar</button>
      </form>
    </div>
  </body>
</html>
