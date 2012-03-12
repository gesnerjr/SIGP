package sigp.src.interceptor;

import sigp.src.annotations.Restricted;
import sigp.src.component.UsuarioSessao;
import sigp.src.controller.UsuarioController;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;

@Intercepts
public class LoginInterceptor implements Interceptor {

	private Result result;
	private UsuarioSessao userSession;

	public LoginInterceptor(Result result, UsuarioSessao userSession) {
		this.result = result;
		this.userSession = userSession;
	}

	public boolean accepts(ResourceMethod method) {
		return false;
		/*
		return (method.getMethod().isAnnotationPresent(Restricted.class) || 
				 method.getResource().getType().isAnnotationPresent(Restricted.class));
				 */
	}

	public void intercept(InterceptorStack stack, ResourceMethod method, Object resourceInstance) {
		if (userSession.isLogged()) {
			stack.next(method, resourceInstance);
		} else {
			result.redirectTo(UsuarioController.class).index();
		}
	}

}


