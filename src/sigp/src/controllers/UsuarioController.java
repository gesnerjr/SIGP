package sigp.src.controllers;

import sigp.src.Usuario;
import sigp.src.dao.UsuarioDao;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class UsuarioController {
	private final Result result;
	private final UsuarioDao dao;
	
	public UsuarioController(Result result, UsuarioDao dao) {
		this.result = result;
		this.dao = dao;
	}
	
	@Path("/login/")
	public void index() {
	}
	
	@Path("/login/cadastro")
	public void form(){
	}
		
	@Post
	@Path("/login/verifica")
	public void verifica(String login, String senha){
		Usuario usuario = dao.pegaUsuarioPorLogin(login);
		if(usuario == null){
			result.include("usuarioNaoCadastrado", "Usuario nao cadastrado.");
			result.redirectTo(UsuarioController.class).index();	
		}
		else{
			//TODO
		}
	}
	
	@Path("/login/novoUsuario")
	public void novoUsuario(){
	}
	
	@Path("/login/salva")
	public void salva(Usuario usuario){
		if (dao.pegaUsuarioPorLogin(usuario.getLogin()) != null){
			result.include("usuarioJaExistente", "Login nao disponivel.");
			result.redirectTo(UsuarioController.class).novoUsuario();	
		}
	//	if (usuario.getSenha() == confirma)
		dao.save(usuario);
		result.redirectTo(UsuarioController.class).novoUsuario();
	}
	
}
