package sigp.src.controller;

import java.util.ArrayList;
import java.util.List;

import sigp.src.annotations.Restricted;
import sigp.src.component.Contribuinte;
import sigp.src.component.LinhaPesquisa;
import sigp.src.component.Projeto;
import sigp.src.dao.LinhaDePesquisaDao;
import sigp.src.dao.MembroDao;
import sigp.src.dao.ProjetoDao;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;

@Resource
public class ProjetoController implements IHeaderController {
    private static final String HEADER = "projeto";
	private final Result result;
    private final ProjetoDao dao;
    private Validator validator;
	private MembroDao cdao;
	private LinhaDePesquisaDao ldao;

    public ProjetoController(Result result, Validator validator,
            ProjetoDao dao, MembroDao cdao, LinhaDePesquisaDao ldao) {
        this.result = result;
        this.validator = validator;
        this.dao = dao;
        this.cdao = cdao;
		this.ldao = ldao;
    }
    
	public String getHeader() {
		return ProjetoController.HEADER;
	}

    @Path({"/projeto/", "/project"})
    public void index() {
        result.include("projetos", dao.list());
    }

    @Restricted
    @Path({"/projeto/novo", "/project/new"})
    public void novo_form() {
        result.include("projetos", dao.list());
        result.include("todoscontribuintes", cdao.list());
        result.include("todaslinhas", ldao.list());
    }

    @Restricted
    @Path({"/projeto/cria", "/project/create"})
    public void cria(final Projeto projeto, final List<Long> idsCoordenadores, 
    		final List<Long> idsMembros, final List<Long> idsLinhas) {
    	
    	List<Contribuinte> coordenadores = new ArrayList<Contribuinte>();
    	if (idsCoordenadores != null) {
	    	for (Long id : idsCoordenadores){
	    		coordenadores.add(cdao.getContribuinte(id));
	    	}
    	}
    	projeto.setCoordenadores(coordenadores);
    	
    	List<Contribuinte> membros = new ArrayList<Contribuinte>();
    	if (idsMembros != null) {
	    	for (Long id : idsMembros){
	    		membros.add(cdao.getContribuinte(id));
	    	}
    	}
    	projeto.setMembros(membros);
    	
    	List<LinhaPesquisa> linhas = new ArrayList<LinhaPesquisa>();
    	if (idsLinhas != null) {
    		for (Long id: idsLinhas){
    			linhas.add(ldao.getLinhaPesquisa(id));
    		}
    	}
    	projeto.setLinhasDePesquisa(linhas);
    	
        validator.validate(projeto);
        validator.onErrorForwardTo(this).novo_form();
        projeto.setDescricao(nl2br(projeto.getDescricao()));
        dao.save(projeto);
        result.redirectTo(ProjetoController.class).index();
    }
    
    private String nl2br(String msg){
    	return msg.replace("\n","<br>");
    }
    
    @Path({"/projeto/ver/{id}", "/project/view/{id}"})
    public void visualiza(Long id) {
        Projeto projeto = dao.getProjeto(id);
        if (projeto == null)
            result.redirectTo(ProjetoController.class).index();
        else
            result.include("projeto", projeto);
    }

    @Restricted
    @Path({"/projeto/alterar/{id}", "/project/edit/{id}"})
    public void altera_form(Long id) {
        Projeto projeto = dao.getProjeto(id);
        if (projeto == null){
            result.redirectTo(ProjetoController.class).index();
        } else {
            result.include("projeto", projeto);
            result.include("lcoordenadores", projeto.getCoordenadores());
            result.include("lmembros", projeto.getMembros());
            result.include("llinhas", projeto.getLinhasDePesquisa());
            result.include("todoscontribuintes", cdao.list());
            result.include("todaslinhas", ldao.list());
        }
    }
    
    @Restricted
    @Path({"/projeto/altera", "/project/edit"})
    public void altera(final Projeto projeto, final List<Long> idsCoordenadores, 
    		final List<Long> idsMembros, final List<Long> idsLinhas) {
    	
    	List<Contribuinte> coordenadores = new ArrayList<Contribuinte>();
    	if (idsCoordenadores != null) {
	    	for (Long id : idsCoordenadores){
	    		coordenadores.add(cdao.getContribuinte(id));
	    	}
    	}
    	projeto.setCoordenadores(coordenadores);
    	
    	List<Contribuinte> membros = new ArrayList<Contribuinte>();
    	if (idsMembros != null) {
	    	for (Long id : idsMembros){
	    		membros.add(cdao.getContribuinte(id));
	    	}
    	}
    	projeto.setMembros(membros);
    	
    	List<LinhaPesquisa> linhas = new ArrayList<LinhaPesquisa>();
    	if (idsLinhas != null) {
    		for (Long id: idsLinhas){
    			linhas.add(ldao.getLinhaPesquisa(id));
    		}
    	}
    	projeto.setLinhasDePesquisa(linhas);
    	
        validator.validate(projeto);
        validator.onErrorForwardTo(this).altera_form(projeto.getIdProjeto());
        projeto.setDescricao(nl2br(projeto.getDescricao()));
        dao.update(projeto);
        result.redirectTo(ProjetoController.class).index();
    }

    @Restricted
    @Path({"/projeto/apagar/{id}", "/project/del/{id}"})
    public void remove(Long id) {
        Projeto projeto = dao.getProjeto(id);
        if (projeto != null)
            dao.delete(projeto);
        result.redirectTo(DisciplinaController.class).index();
    }

}
