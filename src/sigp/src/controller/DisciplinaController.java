package sigp.src.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import sigp.src.annotations.Restricted;
import sigp.src.component.Disciplina;
import sigp.src.component.Grupo;
import sigp.src.dao.DisciplinaDao;
import sigp.src.dao.GrupoDao;

@Resource
public class DisciplinaController implements IHeaderController {
    private static final String HEADER = "disciplina";
    
	private final Result result;
    private final DisciplinaDao dao;
    private final GrupoDao gdao;
    private Validator validator;

    public DisciplinaController(Result result, Validator validator,
            DisciplinaDao dao, GrupoDao gdao) {
        this.result = result;
        this.validator = validator;
        this.dao = dao;
        this.gdao = gdao;
    }
    
	public String getHeader() {
		return DisciplinaController.HEADER;
	}

    @Path("/disciplina/")
    public void index() {
        result.include("disciplinas", dao.list());
    }

    @Restricted
    @Path("/disciplina/novo")
    public void novo_form() {
        result.include("disciplinas", dao.list());
        result.include("grupos", gdao.list());
    }
    
    @Restricted
    @Path("/disciplina/cria")
    public void cria(final Disciplina disciplina, final String ministrante) {
    	Grupo minist = gdao.find(ministrante);
    	disciplina.setGrupo(minist);
    	
    	validator.validate(disciplina);
        validator.onErrorForwardTo(this).novo_form();
        dao.save(disciplina);
        result.redirectTo(DisciplinaController.class).index();
    }

    @Path("/disciplina/ver/{id}")
    public void visualiza(Long id) {
        Disciplina disciplina = dao.getDisciplina(id);
        if (disciplina == null)
            result.redirectTo(DisciplinaController.class).index();
        else
            result.include("disciplina", disciplina);
    }

    @Restricted
    @Path("/disciplina/alterar/{id}")
    public void altera_form(Long id) {
        Disciplina disciplina = dao.getDisciplina(id);
        if (disciplina == null)
            result.redirectTo(DisciplinaController.class).index();
        else
            result.include("disciplina", disciplina);
    }

    @Restricted
    @Path("/disciplina/altera")
    public void altera(final Disciplina disciplina, final String ministrante) {
    	Grupo minist = gdao.find(ministrante);
    	disciplina.setGrupo(minist);
    	
        validator.validate(disciplina);
        validator.onErrorForwardTo(this).altera_form(disciplina.getIdDisciplina());
        dao.update(disciplina);
        result.redirectTo(DisciplinaController.class).index();
    }

    @Restricted
    @Path("/disciplina/apagar/{id}")
    public void remove(Long id) {
        Disciplina disciplina = dao.getDisciplina(id);
        if (disciplina != null)
            dao.delete(disciplina);
        result.redirectTo(DisciplinaController.class).index();
    }
}
