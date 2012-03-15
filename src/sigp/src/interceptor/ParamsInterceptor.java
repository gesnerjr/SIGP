package sigp.src.interceptor;

import sigp.src.component.UsuarioSessao;
import sigp.src.controller.IHeaderController;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;

@Intercepts
public class ParamsInterceptor implements Interceptor {
	
	private Result result;
	private UsuarioSessao userSession;

	public ParamsInterceptor(Result result, UsuarioSessao usession) {
		this.result = result;
		this.userSession = usession;
	}

	public boolean accepts(ResourceMethod resourceMethod) {
		return true;
	}

	public void intercept(InterceptorStack stack, ResourceMethod method, Object resourceInstance) {
		if (resourceInstance instanceof IHeaderController){
			result.include("headername", ((IHeaderController)resourceInstance).getHeader());
		}
		result.include("userName", userSession.getUsername());
		result.include("userIsLogged", userSession.isLogged());
		result.include("userIsAdmin", userSession.isAdmin());
		stack.next(method, resourceInstance);
	}
	

}
