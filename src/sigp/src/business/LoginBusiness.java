package sigp.src.business;

import sigp.src.component.Usuario;
import sigp.src.dao.UsuarioDao;
import sigp.src.hash.PasswordCodificator;
import br.com.caelum.vraptor.ioc.Component;


@Component
public class LoginBusiness {

	private final UsuarioDao dao;

	public LoginBusiness(UsuarioDao dao) {
		this.dao = dao;
	}

	public Usuario autenticar(String login, String senha) {
        Usuario usuario = dao.pegaUsuarioPorLogin(login);
        if (usuario == null) {
            return null;
        }

        // Codifica a senha digitada pelo usuario
        PasswordCodificator p = new PasswordCodificator(senha);
        System.out.println("*******" + senha + "**************");

        // E compara com a do usuário no banco de dados.

        System.out.println("AQUI ------------------------" + p.codificado()
                + "----" + usuario.getSenha());
        if (!(p.codificado().equals(usuario.getSenha()))) {
            return null;
        }
        
        return usuario;

	}

}