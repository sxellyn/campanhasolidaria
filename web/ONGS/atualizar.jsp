<%-- Document : atualizar Created on : Dec 05, 2024, 3:18:47 PM Author : Suellyn
Gomes --%> <%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib
prefix="minhatag" uri="/WEB-INF/tlds/minhaTag.tld" %>
<!-- Registro da tag personalizada -->
<!DOCTYPE html>
<html>
  <head>
    <title>ATUALIZAR ONGS</title>
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
      <h1>ATUALIZE AS ONGS AQUI!</h1>
      <form
        method="post"
        action="/CampanhaSolidaria/OngServlet?action=atualizar"
      >
        <label> Código da ONG a ser atualizada</label>

        <input
          type="number"
          id="codigo"
          name="codigo"
          value="${param.codigo}"
          required
        />

        <minhatag:carrega
          entidade="ong"
          var="ong"
          escopo="requisicao"
          codigo="${param.codigo != null ? param.codigo : 0}"
          paginaAtual="atualizar"
        />

        <button
          type="submit"
          formaction="${pageContext.request.contextPath}/OngServlet"
          formmethod="get"
          name="action"
          value="buscar"
        >
          buscar
        </button>

        <label> Nome </label>
        <input type="text" id="nome" name="nome" value="${ong.nome}" />

        <label>Login</label>
        <input type="text" id="login" name="login" value="${ong.login}" />

        <label>Senha</label>
        <input type="password" id="senha" name="senha" value="${ong.senha}" />

        <button type="submit">Atualizar</button>
      </form>
    </div>
  </body>
</html>
