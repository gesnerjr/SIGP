package sigp.src.component;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class UsuarioSessao {

	private Usuario user;
	
	public boolean isLogged(){
		return user != null;
	}
	
	public void logout(){
		user = null;
	}

	public Usuario getUser() {
		return user;
	}

	public void setUser(Usuario user) {
		this.user = user;
	}
	
	
	
	
}

