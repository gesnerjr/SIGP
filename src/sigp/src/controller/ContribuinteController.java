package sigp.src.controller;

import java.io.File;
import java.io.IOException;

import sigp.src.annotations.Restricted;
import sigp.src.business.MembroBusiness;
import sigp.src.component.Contribuinte;
import sigp.src.component.Usuario;
import sigp.src.dao.MembroDao;
import sigp.src.dao.UsuarioDao;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.validator.ValidationMessage;

@Resource
public class ContribuinteController implements IHeaderController{
	private static final String HEADER = "membro";
	
    private final Result result;
    private final MembroDao dao;
    private final UsuarioDao udao;
    private Validator validator;

	private MembroBusiness business;

    public ContribuinteController(Result result, Validator validator,
            MembroDao dao, UsuarioDao udao, MembroBusiness business) {
        this.result = result;
        this.validator = validator;
        this.business = business;
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
    
    @Get
    @Path("/contribuinte/ajax")
    public void ajax(String q){
    	if (q == null){
    		result.include("contribuintes", dao.list());
    	} else {
    		result.include("contribuintes", dao.search_by_name(q));
    	}
    }
    
    @Post
    @Path("/contribuinte/ajax")
    public void ajax(final Contribuinte contribuinte, final Long idUsuario) throws IOException {
        validator.validate(contribuinte);
        Usuario user = udao.getUsuario(idUsuario);
        
        validator.onErrorForwardTo(this).novo_form();
        dao.save(contribuinte);
        
        if (user != null) {
        	user.setContribuinte(contribuinte);
            contribuinte.setUsuario(user);
        	udao.save(user);
        }
    	
    	dao.save(contribuinte);
    	result.redirectTo(ContribuinteController.class).index();
    }

    @Restricted
    @Path("/contribuinte/novo")
    public void novo_form() {
        result.include("contribuintes", dao.list());
        result.include("usuarios", udao.list());
    }

    @Restricted
    @Path("/contribuinte/cria")
    public void cria(final Contribuinte contribuinte, final Long idUsuario, UploadedFile file) throws IOException {
        validator.validate(contribuinte);
        Usuario user = udao.getUsuario(idUsuario);
        if (user == null) {
            //validator.add(new ValidationMessage("usuário", "não existe"));
        }

        
        validator.onErrorForwardTo(this).novo_form();
        dao.save(contribuinte);
        
        if (user != null) {
        	user.setContribuinte(contribuinte);
            contribuinte.setUsuario(user);
        	udao.save(user);
        }
    	
        business.salvarImagem(contribuinte.getIdContribuinte(), file);
    	dao.save(contribuinte);
    	
        if (file == null){
        	result.redirectTo(ContribuinteController.class).index();
        } else {
        	result.redirectTo(ContribuinteController.class).resize_image(contribuinte.getIdContribuinte());
        }
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
    public void altera(final Contribuinte contribuinte, final Long idUsuario, UploadedFile file) throws IOException {
        validator.validate(contribuinte);
        Usuario user = udao.getUsuario(idUsuario);
        if (user == null) {
            //validator.add(new ValidationMessage("usuário", "não existe"));
        }
        
        validator.onErrorForwardTo(this).altera_form(contribuinte.getIdContribuinte());
        dao.update(contribuinte);
        
        if (user != null) {
        	user.setContribuinte(contribuinte);
            contribuinte.setUsuario(user);
        	udao.save(user);
        }
        
        if (file == null){
        	result.redirectTo(ContribuinteController.class).index();
        } else {
            business.salvarImagem(contribuinte.getIdContribuinte(), file);
        	result.redirectTo(ContribuinteController.class).resize_image(contribuinte.getIdContribuinte());
        }
    }

    @Restricted
    @Path("/contribuinte/apagar/{id}")
    public void remove(Long id) {
        Contribuinte contribuinte = dao.getContribuinte(id);
        if (contribuinte != null){
        	Usuario user = contribuinte.getUsuario();
        	user.setContribuinte(null);
        	udao.save(user);
            dao.delete(contribuinte);
        }
        result.redirectTo(ContribuinteController.class).index();
    }
    

    @Path("/contribuinte/resfoto/{id}")
    public void resize_image(Long id){
        Contribuinte contribuinte = dao.getContribuinte(id);
        if (contribuinte == null)
            result.redirectTo(ContribuinteController.class).index();
        else {
            result.include("contribuinte", contribuinte);
        }
    }
    
    @Path("/contribuinte/resfoto/{id}/2")
    public void resizeFoto(Long id, Integer x, Integer y, Integer w, Integer h){
    	business.resizeImage(id, x, y, w, h);
    	result.redirectTo(ContribuinteController.class).visualiza(id);
    }
    
    @Path("/contribuinte/foto/{id}")
    public File getFoto(Long id) throws IOException{
    	return business.downloadImagem(id);
    }

    
}
