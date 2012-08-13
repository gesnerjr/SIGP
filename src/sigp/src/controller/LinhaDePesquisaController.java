package sigp.src.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sigp.src.annotations.Restricted;
import sigp.src.component.LinhaPesquisa;
import sigp.src.component.Projeto;
import sigp.src.component.Publicacao;
import sigp.src.dao.LinhaDePesquisaDao;
import sigp.src.dao.ProjetoDao;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;

@Resource
public class LinhaDePesquisaController implements IHeaderController {
	private static final String HEADER = "linha";
	private final Result result;
	private final LinhaDePesquisaDao dao;
	private final ProjetoDao pdao;
	private Validator validator;

	public LinhaDePesquisaController(Result result, Validator validator, LinhaDePesquisaDao dao, ProjetoDao pdao) {
		this.result = result;
		this.validator = validator;
		this.dao = dao;
		this.pdao = pdao;
	}
	
	public String getHeader(){
		return LinhaDePesquisaController.HEADER;
	}

	@Path({"/lines/", "/lines"})
	public void index_estatico(){}
	
	@Path({"/plines/", "/plines"})
	public void previous_lines(){}

	public void index() {
		result.include("linhasdepesquisa", dao.list());        
	}

	public List<LinhaPesquisa> lista() {
		return dao.list();
	}

	@Restricted
	@Path({"/lines/add", "/lines/add/*"})
	public void add() {
		result.include("todaslinhas", dao.list());
	}

	@Restricted
	@Path("/lines/create")   
	public void inserir(final LinhaPesquisa linhapesquisa, final List<Long> idsProjetos, 
			final List<Long> idsLinhasPai){
		if (idsProjetos != null) {
			List<Projeto> projetos = new ArrayList<Projeto>();
			for (Long id : idsProjetos){
				Projeto p = pdao.getProjeto(id);
				projetos.add(p);
			}
			linhapesquisa.setProjetos(projetos);
		}

		if (idsLinhasPai != null) {
			List<LinhaPesquisa> linhasPai = new ArrayList<LinhaPesquisa>();
			for (Long id : idsLinhasPai) {
				linhasPai.add(dao.getLinhaPesquisa(id));
			}
			linhapesquisa.setLinhasPai(linhasPai);
		}

		validator.validate(linhapesquisa);
		validator.onErrorForwardTo(this).add();
		dao.save(linhapesquisa);
		result.redirectTo(this).index();
	}

	@Restricted
	@Path("/lines/edit/{idPesquisa}")
	public void editar(Long idPesquisa) {
		LinhaPesquisa linhapesquisa = dao.getLinhaPesquisa(idPesquisa);
		if (linhapesquisa == null)
			result.redirectTo(this).index();
		else
			result.include("linhapesquisa", linhapesquisa);
		result.include("llinhaspai", linhapesquisa.getLinhasPai());
		result.include("todaslinhas", dao.list());  
	}

	@Restricted
	@Path("/lines/update")
	public void altera(final LinhaPesquisa linhapesquisa, final List<Long> idsLinhasPai,
			final List<Long> idsProjetos) {
		validator.validate(linhapesquisa);
		validator.onErrorForwardTo(this).editar(linhapesquisa.getIdPesquisa());
		
		List<Projeto> projetos = new ArrayList<Projeto>();
		if (idsProjetos != null) {
			for (Long id : idsProjetos){
				Projeto p = pdao.getProjeto(id);
				projetos.add(p);
			}
		}
		linhapesquisa.setProjetos(projetos);

		List<LinhaPesquisa> linhasPai = new ArrayList<LinhaPesquisa>();
		if (idsLinhasPai != null) {
			for (Long id : idsLinhasPai) {
				linhasPai.add(dao.getLinhaPesquisa(id));
			}
		}
		linhapesquisa.setLinhasPai(linhasPai);


		dao.update(linhapesquisa);
		result.redirectTo(this).index();
	}

	@Restricted
	@Path("/lines/del/{idPesquisa}")
	public void remove(Long idPesquisa) {
		LinhaPesquisa linhapesquisa = dao.getLinhaPesquisa(idPesquisa);
		if (linhapesquisa != null)
			dao.delete(linhapesquisa);
		result.redirectTo(this).index();
	}

	@Path("/lines/view/{idPesquisa}")
	public void visualiza(Long idPesquisa) {
		LinhaPesquisa linhapesquisa = dao.getLinhaPesquisa(idPesquisa);
		if (linhapesquisa == null) {
			result.redirectTo(this).index();
		} else {
			result.include("linhapesquisa", linhapesquisa);
			Map<Integer, List<Publicacao>> pubmap = new HashMap<Integer, List<Publicacao>>();
			for (Publicacao p: linhapesquisa.getPublicacoes()){
				if (!pubmap.containsKey(p.getAno())){
					pubmap.put(p.getAno(), new ArrayList<Publicacao>());
				}
				pubmap.get(p.getAno()).add(p);
			}
			result.include("pubmap", pubmap);
		}
	}
}
