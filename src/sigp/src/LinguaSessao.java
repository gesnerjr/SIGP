package sigp.src;

import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;
import javax.servlet.jsp.jstl.fmt.LocalizationContext;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@SessionScoped
@Component
public class LinguaSessao {
	
    private HttpSession session;
    
    public LinguaSessao(HttpSession session){
    	this.session = session;
    }
    
    public void setLingua(String lingua){
    	Locale locale = new Locale(lingua);

    	Config.set(session, Config.FMT_LOCALE, locale);
		Config.set(session, Config.FMT_FALLBACK_LOCALE, locale);
		
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale );  
		Config.set(session, Config.FMT_LOCALIZATION_CONTEXT, new LocalizationContext(bundle));
    }

}
