package sigp.src.controller;

import sigp.src.component.LinguaSessao;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class LangController{

    private Result result;
	private LinguaSessao langSession;

	public LangController(Result result, LinguaSessao langSession) {
		this.result = result;
		this.langSession = langSession;
	}

	public void mudarLingua(String lingua) {

		this.langSession.setLingua(lingua);

		result.redirectTo(IndexController.class).index();
	}
}