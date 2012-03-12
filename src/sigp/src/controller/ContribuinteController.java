package sigp.src.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import sigp.src.annotations.Restricted;
import sigp.src.component.Contribuinte;
import sigp.src.component.Grupo;
import sigp.src.component.Usuario;
import sigp.src.dao.ContribuinteDao;
import sigp.src.dao.UsuarioDao;

@Resource
public class ContribuinteController implements IHeaderController{
	private static final String HEADER = "membro";
	
    private final Result result;
    private final ContribuinteDao dao;
    private final UsuarioDao udao;
    private Validator validator;

    public ContribuinteController(Result result, Validator validator,
            ContribuinteDao dao, UsuarioDao udao) {
        this.result = result;
        this.validator = validator;
        this.dao = dao;
        this.udao = udao;
    }
    
	public String getHeader() {
		return ContribuinteController.HEADER;
	}

    @Path("/contribuinte/")
    public void index() {
        result.include("contribuintes", dao.list());
    }

    @Restricted
    @Path("/contribuinte/novo")
    public void novo_form() {
        result.include("contribuintes", dao.list());
        result.include("usuarios", udao.list());
    }

    @Restricted
    @Path("/contribuinte/cria")
    public void cria(final Contribuinte contribuinte, final Long idUsuario) {
        validator.validate(contribuinte);
        Usuario user = udao.getUsuario(idUsuario);
        if (user == null) {
            validator.add(new ValidationMessage("usuário",
                    "não existe"));
        }

        
        validator.onErrorForwardTo(this).novo_form();
        contribuinte.setUsuario(user);
        user.setContribuinte(contribuinte);
        dao.save(contribuinte);
        udao.save(user);
        result.redirectTo(ContribuinteController.class).index();
    }

    @Path("/contribuinte/ver/{id}")
    public void visualiza(Long id) {
        Contribuinte contribuinte = dao.getContribuinte(id);
        if (contribuinte == null)
            result.redirectTo(ContribuinteController.class).index();
        else
            result.include("contribuinte", contribuinte);
    }

    @Restricted
    @Path("/contribuinte/alterar/{id}")
    public void altera_form(Long id) {
        Contribuinte contribuinte = dao.getContribuinte(id);
        if (contribuinte == null)
            result.redirectTo(ContribuinteController.class).index();
        else {
            result.include("contribuinte", contribuinte);
            result.include("usuarios", udao.list());
        }
    }

    @Restricted
    @Path("/contribuinte/altera")
    public void altera(final Contribuinte contribuinte, final Long idUsuario) {
        validator.validate(contribuinte);
        Usuario user = udao.getUsuario(idUsuario);
        if (user == null) {
            validator.add(new ValidationMessage("usuário",
                    "não existe"));
        }
        
        validator.onErrorForwardTo(this).altera_form(contribuinte.getIdContribuinte());
        contribuinte.setUsuario(user);
        user.setContribuinte(contribuinte);
        dao.update(contribuinte);
        udao.update(user);
        result.redirectTo(ContribuinteController.class).index();
    }

    @Restricted
    @Path("/contribuinte/apagar/{id}")
    public void remove(Long id) {
        Contribuinte contribuinte = dao.getContribuinte(id);
        if (contribuinte != null)
            dao.delete(contribuinte);
        result.redirectTo(ContribuinteController.class).index();
    }

}
