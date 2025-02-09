package CampanhaSolidaria.controllers;

import CampanhaSolidaria.model.modelo.Emergencia;
import CampanhaSolidaria.model.modelo.Ong;
import CampanhaSolidaria.model.repositorios.RepositorioEmergencias;
import CampanhaSolidaria.model.repositorios.RepositorioOngs;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Suellyn Gomes
 */
public class EmergenciaServlet extends HttpServlet {

// Método que centraliza o processamento das requisições
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lógica comum que pode ser compartilhada entre os métodos do GET, POST, PUT, DELETE

        String action = request.getParameter("action");

        // Verifica qual ação foi solicitada
        if (action == null) {
            action = "consultar"; // Padrão, se não for especificado
        }

        switch (action) {
            case "cadastrar":
                cadastrar(request, response);
                break;
            case "consultar":
                consultar(request, response);
                break;
            case "atualizar":
                atualizar(request, response);
                break;
            case "deletar":
                deletar(request, response);
                break;
            case "buscar":
                buscar(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ação não reconhecida.");
                break;
        }
    }

    private void cadastrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // pegando parametros:
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String local = request.getParameter("local");
        String tipo = request.getParameter("tipo");
        String descricao = request.getParameter("descricao");

        //criando novo objeto
        Emergencia especie = new Emergencia(codigo, local, tipo, descricao);

        RepositorioEmergencias.inserir(especie);
        request.setAttribute("mensagem", "Emergencia cadastrada com sucesso!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/sucess.jsp");
        dispatcher.forward(request, response);  // Encaminha a requisição para o JSP
    }

    private void consultar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //retorna a lista de emergencias inteiras
         List<Emergencia> listadeemergencias = RepositorioEmergencias.lerTudo();
         
         // Adiciona a lista no request
        request.setAttribute("emergencias", listadeemergencias);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/EMERGENCIAS/consulta.jsp");
        dispatcher.forward(request, response);  // Encaminha a requisição para o JSP 
    }

    private void atualizar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // pegando parametros:
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String local = request.getParameter("local");
        String tipo = request.getParameter("tipo");
        String descricao = request.getParameter("descricao");

        //criando novo objeto
        Emergencia especie = new Emergencia(codigo, local, tipo, descricao);
         RepositorioEmergencias.alterar(especie);

        request.setAttribute("mensagem", "Emergencia atualizada com sucesso!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/sucess.jsp");
        dispatcher.forward(request, response);  // Encaminha a requisição para o JSP
    }

    private void deletar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         // pegando parametros:
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        RepositorioEmergencias.deletar(codigo);

        request.setAttribute("mensagem", "Emergencia deletada com sucesso!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/sucess.jsp");
        dispatcher.forward(request, response);  // Encaminha a requisição para o JSP
    }

    private void buscar(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        System.out.println(codigo);
        if (codigo != null) {
            Emergencia emergencia = RepositorioEmergencias.buscarPorCodigo(Integer.parseInt(codigo)); // Ajuste conforme sua lógica de repositório
            request.setAttribute("emergencia", emergencia);
        }
        request.getRequestDispatcher("/EMERGENCIAS/atualizar.jsp").forward(request, response);
    }

// <editor-fold defaultstate="collapsed" desc="metodos originais. Click on the + sign on the left to edit the code.">
//doGet: Usado para consultas.
@Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    processRequest(request, response);
}

//doPost: Usado para criar novos registros.
@Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    processRequest(request, response);
}

//    doPut: Usado para atualizar registros existentes.
@Override
        protected void doPut(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    processRequest(request, response);
}

//    doDelete: Usado para deletar registros.
@Override
        protected void doDelete(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    processRequest(request, response);
        }
}
// </editor-fold>
