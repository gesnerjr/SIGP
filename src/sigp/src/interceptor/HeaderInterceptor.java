package sigp.src.interceptor;

import sigp.src.controller.IHeaderController;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;

@Intercepts
public class HeaderInterceptor implements Interceptor {
	
	private Result result;

	public HeaderInterceptor(Result result) {
		this.result = result;
	}

	public boolean accepts(ResourceMethod resourceMethod) {
		return true;
	}

	public void intercept(InterceptorStack stack, ResourceMethod method, Object resourceInstance) {
		if (resourceInstance instanceof IHeaderController){
			result.include("headername", ((IHeaderController)resourceInstance).getHeader());
		}
		stack.next(method, resourceInstance);
	}
	

}
