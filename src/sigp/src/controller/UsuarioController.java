package sigp.src.controller;

import sigp.src.annotations.Restricted;
import sigp.src.business.LoginBusiness;
import sigp.src.component.Usuario;
import sigp.src.component.UsuarioSessao;
import sigp.src.dao.UsuarioDao;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;

@Resource
public class UsuarioController implements IHeaderController {
	private static final String HEADER = "login";
	private final Result result;
	private final UsuarioDao dao;
	private final Validator validator;


	private UsuarioSessao usuarioSessao;
	private LoginBusiness business;

	public UsuarioController(Result result, Validator validator, UsuarioDao dao,
			LoginBusiness business, UsuarioSessao usuarioSessao) {
		this.result = result;
		this.validator = validator;
		this.business = business;
		this.usuarioSessao = usuarioSessao;
		this.dao = dao;
	}
	
	public String getHeader(){
		return UsuarioController.HEADER;
	}

	@Path("/login/")
	public void index() {
	}

	//@Restricted
	@Path("/login/cadastro")
	public void form() {
	}

	@Post
	@Path("/login/verifica")
	public void verifica(String login, String senha) {
		Usuario user = business.autenticar(login, senha);

		if (user != null) {
			System.out.println("-----------------------------------------------------------");
			System.out.println("usuário logado:" + user.getLogin());
			usuarioSessao.setUser(user);

			result.include("logado", "Usuario " + user.getLogin() + " logado.");
			result.redirectTo(UsuarioController.class).index();
		} else {
			result.include("error", "E-mail ou senha incorreta!").redirectTo(this).index();
		}
	}

	//@Restricted
	@Path("/login/novoUsuario")
	public void novoUsuario() {
	}

	//@Restricted
	@Path("/login/salva")
	public void salva(Usuario usuario, String confirma) {

		validator.validate(usuario);
		// Login indisponível.
		if (dao.pegaUsuarioPorLogin(usuario.getLogin()) != null) {
			validator.add(new ValidationMessage("Login já existe.", "login"));
		}

		// Senhas diferentes
		if (!usuario.getSenha().equals(confirma)) {
			validator.add(new ValidationMessage(
					"Campo senha difere do campo de confirmação.",
					"confirmação"));
		}
		validator.onErrorForwardTo(this).novoUsuario();
		if (!validator.hasErrors()) {
			// Codifica a senha antes de armazenar no banco de dados.
			usuario.codificaSenha();

			dao.save(usuario);
			result.redirectTo(UsuarioController.class).index();
		}
	}

}
