package sigp.src.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import sigp.src.annotations.Restricted;
import sigp.src.business.PublicacaoBusiness;
import sigp.src.component.Contribuinte;
import sigp.src.component.Projeto;
import sigp.src.component.Publicacao;
import sigp.src.component.Software;
import sigp.src.component.TipoVeiculo;
import sigp.src.dao.MembroDao;
import sigp.src.dao.ProjetoDao;
import sigp.src.dao.PublicacaoDao;
import sigp.src.dao.SoftwareDao;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

@Resource
public class PublicacaoController implements IHeaderController {
	private static final String HEADER = "publicacao";
	
	private final Result result;
	
	private final PublicacaoDao dao;
	private final ProjetoDao pdao;
	private final MembroDao cdao;
	private final SoftwareDao sdao;
	
    private Validator validator;
    
    private PublicacaoBusiness business;


	public PublicacaoController(Result result, Validator validator, PublicacaoDao dao, ProjetoDao pdao,
			MembroDao cdao, SoftwareDao sdao ,PublicacaoBusiness business) {
		this.result = result;
		this.validator = validator;
		this.sdao = sdao;
		this.business = business;
		this.dao = dao;
		this.cdao = cdao;
		this.pdao = pdao;
	}
	
	public String getHeader(){
		return PublicacaoController.HEADER;
	}

	@Path("/publicacao/")
	public void index() {
		result.include("publicacoes", dao.list());
	}
	
	@Path("/publicacao/clist")
	public void clean_list() {
		result.include("publicacoes", dao.list());
	}

	@Restricted
	@Path("/publicacao/novo")
	public void novo_form() {
		result.include("veiculos", TipoVeiculo.values());
		result.include("todosprojetos", pdao.list());
		result.include("todoscontribuintes", cdao.list());
		result.include("todossoftware", sdao.list());
	}

	@Restricted
	@Path("/publicacao/cria")
	public void cria(final Publicacao publicacao,  final List<Long> idsProjetos,
			final List<Long> idsContribuintes, final List<Long> idsSoftware,UploadedFile pdf) {
		List<Projeto> projetos = new ArrayList<Projeto>();
		if (idsProjetos != null) {
			for (Long id : idsProjetos){
				projetos.add(pdao.getProjeto(id));
			}
		}
    	publicacao.setProjetos(projetos);
    	
    	List<Contribuinte> contribuintes = new ArrayList<Contribuinte>();
    	if (idsContribuintes != null) {
	    	for (Long id : idsContribuintes){
	    		contribuintes.add(cdao.getContribuinte(id));
	    	}
    	}
    	publicacao.setContribuintes(contribuintes);
    	
    	List<Software> software = new ArrayList<Software>();
    	if (idsSoftware != null) {
	    	for (Long id : idsSoftware){
	    		software.add(sdao.getSoftware(id));
	    	}
    	}
    	publicacao.setSoftware(software);

	    validator.validate(publicacao);
	    validator.onErrorForwardTo(this).novo_form();
		dao.save(publicacao);
		
		if (pdf != null){
	    	try {
				business.salvarPdf(publicacao.getIdPublicacao(), pdf);
			} catch (IOException e) {
				publicacao.setPdf(false);
			}
	    	publicacao.setPdf(true);
		}
		
		result.redirectTo(PublicacaoController.class).index();
	}

	@Path("/publicacao/ver/{id}")
	public void visualiza(Long id) {
		Publicacao publicacao = dao.getPublicacao(id);
		if (publicacao == null)
			result.redirectTo(PublicacaoController.class).index();
		else
			result.include("publicacao", publicacao);
	}
	
	@Path("/publicacao/pdf/{id}")
	public File pdf(Long id) {
		return business.downloadPdf(id);
	}

	@Restricted
	@Path("/publicacao/alterar/{id}")
	public void altera_form(Long id) {
		Publicacao publicacao = dao.getPublicacao(id);
		if (publicacao == null)
			result.redirectTo(PublicacaoController.class).index();
		else
			result.include("publicacao", publicacao);
		result.include("veiculos", TipoVeiculo.values());
		result.include("lprojetos", publicacao.getProjetos());
		result.include("lsoftware", publicacao.getSoftware());
		result.include("lcontribuintes", publicacao.getContribuintes());
		result.include("todosprojetos", pdao.list());
		result.include("todossoftware", sdao.list());
		result.include("todoscontribuintes", cdao.list());
	}
	
	@Restricted
	@Path("/publicacao/apagarpdf/{id}")
	public void apaga_pdf(Long id){
		business.removerPdf(id);
		result.redirectTo(PublicacaoController.class).visualiza(id);
	}

	@Restricted
	@Path("/publicacao/altera")
	public void altera(final Publicacao publicacao,  final List<Long> idsProjetos,
			final List<Long> idsContribuintes, final List<Long> idsSoftware)  {
		List<Projeto> projetos = new ArrayList<Projeto>();
		if (idsProjetos != null) {
			for (Long id : idsProjetos){
				projetos.add(pdao.getProjeto(id));
			}
		}
    	publicacao.setProjetos(projetos);
    	
    	List<Contribuinte> contribuintes = new ArrayList<Contribuinte>();
    	if (idsContribuintes != null) {
	    	for (Long id : idsContribuintes){
	    		contribuintes.add(cdao.getContribuinte(id));
	    	}
    	}
    	publicacao.setContribuintes(contribuintes);
    	
    	List<Software> software = new ArrayList<Software>();
    	if (idsSoftware != null) {
	    	for (Long id : idsSoftware){
	    		software.add(sdao.getSoftware(id));
	    	}
    	}
    	publicacao.setSoftware(software);
		
        validator.validate(publicacao);
        validator.onErrorForwardTo(this).altera_form(publicacao.getIdPublicacao());
		dao.update(publicacao);
		result.redirectTo(PublicacaoController.class).index();
	}

	@Restricted
	@Path("/publicacao/apagar/{id}")
	public void remove(Long id) {
		Publicacao publicacao = dao.getPublicacao(id);
		if (publicacao != null){
			dao.delete(publicacao);
			business.removerPdf(id);
		}
		result.redirectTo(PublicacaoController.class).index();
	}
}
