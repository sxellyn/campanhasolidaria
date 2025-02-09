package CampanhaSolidaria.controllers;

import CampanhaSolidaria.model.modelo.Ong;
import CampanhaSolidaria.model.repositorios.RepositorioOngs;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

/**
 * @author Suellyn Gomes
 */
public class OngServlet extends HttpServlet {

    // Método que centraliza o processamento das requisições
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lógica comum que pode ser compartilhada entre os métodos do GET, POST, PUT,
        // DELETE

        String action = request.getParameter("action");
        System.out.println("Ação recebida: " + action);

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
        String nome = request.getParameter("nome");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        // criando novo objeto
        Ong organizacao = new Ong(codigo, nome, login, senha);

        RepositorioOngs.inserir(organizacao);
        request.setAttribute("mensagem", "ONG cadastrada com sucesso!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/sucess.jsp");
        dispatcher.forward(request, response); // Encaminha a requisição para o JSP
    }

    private void consultar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // retorna a lista de ongs inteiras
        List<Ong> listadeongs = RepositorioOngs.lerTudo();

        // Adiciona a lista no request
        request.setAttribute("ongs", listadeongs);
        request.getRequestDispatcher("/ONGS/consulta.jsp").forward(request, response); // Encaminha a requisição para o
                                                                                       // JSP
    }

    private void atualizar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // pegando parametros:
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String nome = request.getParameter("nome");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        // criando novo objeto
        Ong organizacao = new Ong(codigo, nome, login, senha);
        RepositorioOngs.alterar(organizacao);

        request.setAttribute("mensagem", "ONG atualizada com sucesso!");
        request.getRequestDispatcher("/sucess.jsp").forward(request, response); // Encaminha a requisição para o JSP
    }

    private void deletar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // pegando parametros:
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        RepositorioOngs.deletar(codigo);

        request.setAttribute("mensagem", "ONG deletada com sucesso!"); // mensagem dinamica
        RequestDispatcher dispatcher = request.getRequestDispatcher("/sucess.jsp");
        dispatcher.forward(request, response); // Encaminha a requisição para o JSP
    }

    private void buscar(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        System.out.println(codigo);
        if (codigo != null) {
            Ong ong = RepositorioOngs.buscarPorCodigo(Integer.parseInt(codigo)); // Ajuste conforme sua lógica de repositório
            request.setAttribute("ong", ong);
        }
        request.getRequestDispatcher("/ONGS/atualizar.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="metodos originais. Click on the +
    // sign on the left to edit the code.">
    // doGet: Usado para consultas.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // doPost: Usado para criar novos registros.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // doPut: Usado para atualizar registros existentes.
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // doDelete: Usado para deletar registros.
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
// </editor-fold>
