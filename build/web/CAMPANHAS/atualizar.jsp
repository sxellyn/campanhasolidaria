<%-- Document : atualizar Created on : Dec 05, 2024, 3:18:47 PM Author : Suellyn
Gomes --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>ATUALIZAR CAMPANHAS</title>
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
    <minhatag:carrega
    entidade="campanha"
    var="campanha"
    escopo="requisicao"
    codigo="${param.codigo != null ? param.codigo : 0}"
    paginaAtual="atualizar"
  />
    <div>
      <h1>ATUALIZE AS CAMPANHAS SOLIDARIAS AQUI!</h1>
      <form
        method="post"
        action="/CampanhaSolidaria/CampanhaServlet?action=atualizar"
      >
        <label>Código da campanha a ser atualizada</label>
        <input
          type="number"
          id="codigo"
          name="codigo"
          value="${param.codigo}"
          required
        />

        <button
          type="submit"
          formaction="${pageContext.request.contextPath}/CampanhaServlet"
          formmethod="get"
          name="action"
          value="buscar"
        >
          buscar
        </button>
        
        <label>Data de Inicio</label>
        <input type="date" id="data-inicio" name="data-inicio" value="${campanha.dataInicio}" />
        <label>Data de Fim</label>
        <input type="date" id="data-fim" name="data-fim" value="${campanha.dataFim}" />
        <label>Objetivo</label>
        <textarea id="objetivo" name="objetivo">${campanha.objetivo}</textarea>
        <label>Descrição</label>
        <textarea id="descricao" name="descricao">${campanha.descricao}</textarea>
        <button type="submit">Atualizar</button>
      </form>
    </div>
  </body>
</html>
