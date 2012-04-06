package sigp.src.controller;

import java.util.ArrayList;
import java.util.List;

import sigp.src.annotations.Restricted;
import sigp.src.component.Contribuinte;
import sigp.src.component.Participacao;
import sigp.src.component.Projeto;
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

    public ProjetoController(Result result, Validator validator,
            ProjetoDao dao, MembroDao cdao) {
        this.result = result;
        this.validator = validator;
        this.dao = dao;
        this.cdao = cdao;
    }
    
	public String getHeader() {
		return ProjetoController.HEADER;
	}

    @Path("/projeto/")
    public void index() {
        result.include("projetos", dao.list());
    }

    @Restricted
    @Path("/projeto/novo")
    public void novo_form() {
        result.include("projetos", dao.list());
    }
    
    @Restricted
    @Path("/projeto/{id}/addParticipacao")
    public void participacao_form(Long id) {
    	Projeto projeto = dao.getProjeto(id);
        if (projeto == null)
            result.redirectTo(ProjetoController.class).index();
        else
            result.include("projeto", projeto);
        	result.include("todoscontribuintes", cdao.list());
    }

    @Restricted
    @Path("/projeto/cria")
    public void cria(final Projeto projeto) {
        validator.validate(projeto);
        validator.onErrorForwardTo(this).novo_form();
        projeto.setDescricao(nl2br(projeto.getDescricao()));
        dao.save(projeto);
        result.redirectTo(ProjetoController.class).index();
    }
    
    private String nl2br(String msg){
    	return msg.replace("\n","<br>");
    }
    
    @Restricted
    @Path("/projeto/cria_participacao")
    public void cria(final Participacao participacao, final Long idContribuinte, final Long idProjeto) {
    	Projeto projeto = dao.getProjeto(idProjeto);
        validator.validate(projeto);
        
        Contribuinte contribuinte = cdao.getContribuinte(idContribuinte);
        validator.validate(contribuinte);
        
        participacao.setProjeto(projeto);
        participacao.setContribuinte(contribuinte);
        
        List<Participacao> lp;
        if (projeto.getParticipacoes() == null){
        	lp = new ArrayList<Participacao>();
        } else {
        	lp = projeto.getParticipacoes();
        }
        lp.add(participacao);
    	projeto.setParticipacoes(lp);
        
        validator.onErrorForwardTo(this).novo_form();
        dao.save(projeto);
        result.redirectTo(ProjetoController.class).visualiza(idProjeto);
    }

    @Path("/projeto/ver/{id}")
    public void visualiza(Long id) {
        Projeto projeto = dao.getProjeto(id);
        if (projeto == null)
            result.redirectTo(ProjetoController.class).index();
        else
            result.include("projeto", projeto);
    }

    @Restricted
    @Path("/projeto/alterar/{id}")
    public void altera_form(Long id) {
        Projeto projeto = dao.getProjeto(id);
        if (projeto == null)
            result.redirectTo(ProjetoController.class).index();
        else
            result.include("projeto", projeto);
    }
    
    @Restricted
    @Path("/projeto/altera")
    public void altera(final Projeto projeto) {
        validator.validate(projeto);
        validator.onErrorForwardTo(this).altera_form(projeto.getIdProjeto());
        projeto.setDescricao(nl2br(projeto.getDescricao()));
        dao.update(projeto);
        result.redirectTo(ProjetoController.class).index();
    }

    @Restricted
    @Path("/projeto/apagar/{id}")
    public void remove(Long id) {
        Projeto projeto = dao.getProjeto(id);
        if (projeto != null)
            dao.delete(projeto);
        result.redirectTo(DisciplinaController.class).index();
    }

}
