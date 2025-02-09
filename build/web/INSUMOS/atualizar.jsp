<%-- Document : atualizar Created on : Dec 05, 2024, 3:18:47 PM Author : Suellyn
Gomes --%> <%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib
prefix="minhatag" uri="/WEB-INF/tlds/minhaTag.tld" %>
<!-- Registro da tag personalizada -->
<!DOCTYPE html>
<html>
  <head>
    <title>ATUALIZAR INSUMOS</title>
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
      <h1>ATUALIZE OS INSUMOS A SEREM DOADOS AQUI!</h1>
      <form
        method="post"
        action="/CampanhaSolidaria/InsumoServlet?action=atualizar"
      >
        <label>Código do insumo a ser atualizado</label>
        <input type="number" id="codigo" name="codigo" value="${param.codigo}" />
        <minhatag:carrega
          entidade="insumo"
          var="insumo"
          escopo="requisicao"
          codigo="${param.codigo != null ? param.codigo : 0}"
          paginaAtual="atualizar"
        />

        <button
          type="submit"
          formaction="${pageContext.request.contextPath}/InsumoServlet"
          formmethod="get"
          name="action"
          value="buscar"
        >
          buscar
        </button>
        <label>Nome</label>
        <input type="text" id="nome" name="nome" value="${insumo.nome}" />
        <label>Marca</label>
        <input type="text" id="marca" name="marca" value="${insumo.marca}" />
        <label>Categoria</label>
        <input type="text" id="categoria" name="categoria" value="${insumo.categoria}" />
        <button type="submit">Atualizar</button>
      </form>
    </div>
  </body>
</html>
