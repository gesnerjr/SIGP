package sigp.src.controller;

import java.util.ArrayList;
import java.util.List;

import sigp.src.annotations.Restricted;
import sigp.src.component.Contribuinte;
import sigp.src.component.Grupo;
import sigp.src.component.LinhaPesquisa;
import sigp.src.dao.MembroDao;
import sigp.src.dao.GrupoDao;
import sigp.src.dao.LinhaDePesquisaDao;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.caelum.vraptor.view.Results;

@Resource
public class GrupoController implements IHeaderController {
    private static final String HEADER = "grupo";
	
    private final Result result;
    private final GrupoDao dao;
    private final LinhaDePesquisaDao ldao;
    private final MembroDao cdao;
    private Validator validator;

    public GrupoController(Result result, Validator validator, GrupoDao dao, LinhaDePesquisaDao ldao,
    		MembroDao cdao) {
        this.result = result;
        this.validator = validator;
        this.dao = dao;
        this.ldao = ldao;
        this.cdao = cdao;
    }
    
	public String getHeader() {
		return this.HEADER;
	}

    @Path("/grupo/")
    public void index() {
        result.include("grupos", dao.list());        
    }

    @Path("/grupo/procura/{query}")
    public void procura(String query) {
        result.use(Results.json()).from(dao.search(query)).serialize();
    }

    @Restricted
    @Path("/grupo/novo")
    public void novo_form() {
        result.include("grupos", dao.list());
        result.include("todaslinhasdepesquisa", ldao.list());
        result.include("todoscontribuintes", cdao.list());
    }

    @Restricted
    @Path("/grupo/cria")
    public void cria(final Grupo grupo, final Long idResponsavel, final List<Long> idsLinhasdePesquisa) {
    	List<LinhaPesquisa> linhas = new ArrayList<LinhaPesquisa>();
    	if (idsLinhasdePesquisa != null) {
	    	for (Long id : idsLinhasdePesquisa){
	    		linhas.add(ldao.getLinhaPesquisa(id));
	    	}
    	}
    	grupo.setPesquisas(linhas);
    	
    	
        validator.validate(grupo);
        Contribuinte respon = cdao.getContribuinte(idResponsavel);

        validator.onErrorForwardTo(this).novo_form();
        grupo.setResponsavel(respon);
        
        
        dao.save(grupo);
        result.redirectTo(GrupoController.class).index();
    }

    @Path("/grupo/ver/{idGrupo}")
    public void visualiza(Long idGrupo) {
        Grupo grupo = dao.getGrupo(idGrupo);
        if (grupo == null)
            result.redirectTo(GrupoController.class).index();
        else
            result.include("grupo", grupo);
    }

    @Restricted
    @Path("/grupo/alterar/{idGrupo}")
    public void altera_form(Long idGrupo) {
        Grupo grupo = dao.getGrupo(idGrupo);
        if (grupo == null)
            result.redirectTo(GrupoController.class).index();
        else
            result.include("grupo", grupo);
        result.include("grupos", dao.list());
        result.include("todoscontribuintes", cdao.list());
    }

    @Restricted
    @Path("/grupo/altera")
    public void altera(final Grupo grupo, final Long idResponsavel) {
        validator.validate(grupo);
        Contribuinte respon = cdao.getContribuinte(idResponsavel);
        validator.onErrorForwardTo(this).altera_form(grupo.getIdGrupo());

        grupo.setResponsavel(respon);
        dao.update(grupo);
        result.redirectTo(GrupoController.class).index();
    }

    @Restricted
    @Path("/grupo/apagar/{idGrupo}")
    public void remove(Long idGrupo) {
        Grupo grupo = dao.getGrupo(idGrupo);
        if (grupo != null)
            dao.delete(grupo);
        result.redirectTo(GrupoController.class).index();
    }

}
