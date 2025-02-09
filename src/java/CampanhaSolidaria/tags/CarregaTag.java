package CampanhaSolidaria.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TagSupport;


import CampanhaSolidaria.model.modelo.Ong; // Importando o modelo Ong
import CampanhaSolidaria.model.modelo.Insumo; // Importando o modelo Insumo
import CampanhaSolidaria.model.modelo.Campanha; // Importando o modelo Campanha
import CampanhaSolidaria.model.modelo.Emergencia; // Importando o modelo Emergencias
import CampanhaSolidaria.model.repositorios.RepositorioOngs;// Importando o repositório Ong
import CampanhaSolidaria.model.repositorios.RepositorioInsumos; // Importando o repositório Insumo
import CampanhaSolidaria.model.repositorios.RepositorioCampanhas;// Importando o repositório Campanha
import CampanhaSolidaria.model.repositorios.RepositorioEmergencias; // Importando o repositório Emergencias

public class CarregaTag extends SimpleTagSupport {

    private String entidade;
    private String var;
    private String escopo;
    private int codigo;
    private String paginaAtual;

    // Instâncias dos repositórios
    private RepositorioOngs repositorioOngs = new RepositorioOngs();
    private RepositorioCampanhas repositorioCampanhas = new RepositorioCampanhas();
    private RepositorioEmergencias repositorioEmergencias = new RepositorioEmergencias();
    private RepositorioInsumos repositorioInsumos = new RepositorioInsumos();

    // Getters e Setters
    public void setEntidade(String entidade) {
        this.entidade = entidade;
    }

    public void setVar(String var) {
        this.var = var;
    }

    public void setEscopo(String escopo) {
        this.escopo = escopo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setpaginaAtual(String paginaAtual) {
        this.paginaAtual = paginaAtual;
    }

@Override
public void doTag() throws JspException, IOException {
    Object objeto = null;

    // Lógica para carregar a lista ou um único objeto
    if (paginaAtual != null && paginaAtual.equals("atualizar") && codigo > 0) { // Verifica se o código é maior que 0
        objeto = carregarObjeto(entidade, codigo); // Passa o int para o método
    } 
    else if (paginaAtual != null && paginaAtual.equals("consultar")) {
        objeto = carregarLista(entidade);
    }

    // Armazenar o objeto no escopo apropriado
    switch (escopo) {
        case "pagina":
            getJspContext().setAttribute(var, objeto);
            break;
        case "requisicao":
            // Acessando a requisição diretamente
            HttpServletRequest request = (HttpServletRequest) getJspContext().getAttribute("javax.servlet.jsp.jspRequest");
            request.setAttribute(var, objeto);
            break;
        case "sessao":
            // Acessando a sessão diretamente
            HttpSession session = (HttpSession) getJspContext().getAttribute("javax.servlet.jsp.jspSession");
            session.setAttribute(var, objeto);
            break;
        default:
            throw new JspException("Escopo inválido: " + escopo);
    }
}

    private List<?> carregarLista(String entidade) {
        switch (entidade) {
            case "ong":
                return RepositorioOngs.lerTudo(); // Método que retorna a lista de ONGs
            case "campanha":
                return RepositorioCampanhas.lerTudo(); // Método que retorna a lista de Campanhas
            case "emergencia":
                return RepositorioEmergencias.lerTudo(); // Método que retorna a lista de Emergências
            case "insumo":
                return RepositorioInsumos.lerTudo(); // Método que retorna a lista de Insumos
            default:
                throw new IllegalArgumentException("Entidade desconhecida: " + entidade);
        }
    }

    private Object carregarObjeto(String entidade, int codigo) {
        switch (entidade) {
            case "ong":
                return RepositorioOngs.buscarPorCodigo(codigo); // Método que busca ONG pelo código
            case "campanha":
                return RepositorioCampanhas.buscarPorCodigo(codigo); // Método que busca Campanha pelo código
            case "emergencia":
                return RepositorioEmergencias.buscarPorCodigo(codigo); // Método que busca Emergência pelo código
            case "insumo":
                return RepositorioInsumos.buscarPorCodigo(codigo); // Método que busca Insumo pelo código
            default:
                throw new IllegalArgumentException("Entidade desconhecida: " + entidade);
        }
    }
}
