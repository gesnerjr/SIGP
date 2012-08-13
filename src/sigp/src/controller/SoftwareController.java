package sigp.src.controller;

import java.util.ArrayList;
import java.util.List;

import sigp.src.annotations.Restricted;
import sigp.src.business.Utils;
import sigp.src.component.Contribuinte;
import sigp.src.component.Licenca;
import sigp.src.component.LinhaPesquisa;
import sigp.src.component.Projeto;
import sigp.src.component.Publicacao;
import sigp.src.component.Software;
import sigp.src.dao.LinhaDePesquisaDao;
import sigp.src.dao.MembroDao;
import sigp.src.dao.ProjetoDao;
import sigp.src.dao.PublicacaoDao;
import sigp.src.dao.SoftwareDao;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;

@Resource
public class SoftwareController implements IHeaderController {
	private static final String HEADER = "software";
	
	private final Result result;
	
	private final SoftwareDao dao;
	private final PublicacaoDao pubdao;
	private final ProjetoDao projdao;
	private final LinhaDePesquisaDao ldao;
	private final MembroDao cdao;
	
    private Validator validator;
    
	public SoftwareController(Result result, Validator validator, SoftwareDao sdao, 
			PublicacaoDao pubdao, ProjetoDao projdao, LinhaDePesquisaDao ldao,
			MembroDao cdao) {
		this.result = result;
		this.validator = validator;
		this.dao = sdao;
		this.pubdao = pubdao;
		this.cdao = cdao;
		this.ldao = ldao;
		this.projdao = projdao;
	}
	
	public String getHeader(){
		return SoftwareController.HEADER;
	}

	@Path("/software/")
	public void index() {
		result.include("softwarelist", dao.list());
	}
	
	@Path("/software/clist")
	public void clean_list() {
		result.include("softwarelist", dao.list());
	}

	@Restricted
	@Path({"/software/add", "/software/novo"})
	public void add() {
		result.include("licencas", Licenca.values());
		result.include("todaslinhas", ldao.list());
		result.include("todosprojetos", projdao.list());
		result.include("todaspublicacoes", pubdao.list());
		result.include("todoscontribuintes", cdao.list());
	}

	@Restricted
	@Path("/software/create")
	public void cria(final Software software,  final List<Long> idsProjetos,
			final List<Long> idsContribuintes, final List<Long> idsPublicacoes, 
			final List<Long> idsLinhas) {
		List<Projeto> projetos = new ArrayList<Projeto>();
		if (idsProjetos != null) {
			for (Long id : idsProjetos){
				projetos.add(projdao.getProjeto(id));
			}
		}
    	software.setProjetos(projetos);
    	
    	List<Contribuinte> contribuintes = new ArrayList<Contribuinte>();
    	if (idsContribuintes != null) {
	    	for (Long id : idsContribuintes){
	    		contribuintes.add(cdao.getContribuinte(id));
	    	}
    	}
    	software.setContribuintes(contribuintes);
    	
    	List<Publicacao> publicacoes = new ArrayList<Publicacao>();
    	if (idsPublicacoes != null) {
	    	for (Long id : idsPublicacoes){
	    		publicacoes.add(pubdao.getPublicacao(id));
	    	}
    	}
    	software.setPublicacoes(publicacoes);
    	
    	List<LinhaPesquisa> linhas = new ArrayList<LinhaPesquisa>();
    	if (idsLinhas != null) {
    		for (Long id: idsLinhas) {
    			linhas.add(ldao.getLinhaPesquisa(id));
    		}
    	}
    	software.setLinhas(linhas);

	    validator.validate(software);
	    validator.onErrorForwardTo(this).add();
	    software.setDescricao(Utils.nl2br(software.getDescricao().trim()));
		dao.save(software);
		
		result.redirectTo(SoftwareController.class).index();
	}

	@Path({"/software/view/{id}", "/software/ver/{id}"})
	public void view(Long id) {
		Software software = dao.getSoftware(id);
		if (software == null)
			result.redirectTo(SoftwareController.class).index();
		else
			result.include("software", software);
	}
	
	@Restricted
	@Path({"/software/edit/{id}", "/software/alterar/{id}"})
	public void edit(Long id) {
		Software software = dao.getSoftware(id);
		if (software == null)
			result.redirectTo(SoftwareController.class).index();
		else
			result.include("software", software);
		// for ajax
		result.include("llinhas", software.getLinhas());
		result.include("lprojetos", software.getProjetos());
		result.include("lpublicacoes", software.getPublicacoes());
		result.include("lcontribuintes", software.getContribuintes());
		result.include("licencas", Licenca.values());
		result.include("todaslinhas", ldao.list());
		result.include("todosprojetos", projdao.list());
		result.include("todaspublicacoes", pubdao.list());
		result.include("todoscontribuintes", cdao.list());
	}
	
	@Restricted
	@Path("/software/update")
	public void altera(final Software software,  final List<Long> idsProjetos,
			final List<Long> idsContribuintes, final List<Long> idsPublicacoes) {
		List<Projeto> projetos = new ArrayList<Projeto>();
		if (idsProjetos != null) {
			for (Long id : idsProjetos){
				projetos.add(projdao.getProjeto(id));
			}
		}
    	software.setProjetos(projetos);
    	
    	List<Contribuinte> contribuintes = new ArrayList<Contribuinte>();
    	if (idsContribuintes != null) {
	    	for (Long id : idsContribuintes){
	    		contribuintes.add(cdao.getContribuinte(id));
	    	}
    	}
    	software.setContribuintes(contribuintes);
    	
    	List<Publicacao> publicacoes = new ArrayList<Publicacao>();
    	if (idsPublicacoes != null) {
	    	for (Long id : idsPublicacoes){
	    		publicacoes.add(pubdao.getPublicacao(id));
	    	}
    	}
    	software.setPublicacoes(publicacoes);
		
        validator.validate(software);
        validator.onErrorForwardTo(this).edit(software.getIdSoftware());
        software.setDescricao(Utils.nl2br(software.getDescricao().trim()));
		dao.update(software);
		result.redirectTo(SoftwareController.class).index();
	}

	@Restricted
	@Path("/software/remove/{id}")
	public void remove(Long id) {
		Publicacao publicacao = pubdao.getPublicacao(id);
		if (publicacao != null){
			pubdao.delete(publicacao);
		}
		result.redirectTo(SoftwareController.class).index();
	}
}
