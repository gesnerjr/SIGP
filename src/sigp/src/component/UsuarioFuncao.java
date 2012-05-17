package sigp.src.component;

public enum UsuarioFuncao {
	GRADUACAO("Aluno de Graduação"),
	MESTRADO("Aluno de Mestrado"), 
	DOUTORADO("Aluno de Doutorado"),
	POSDOC("Aluno de Pos-Doc"),
	PROFESSORE("Professor"),
	EXTERNO("Colaborador Externo"),
	AUTOR("Autor");
	
	private String funcao;
	
	private UsuarioFuncao(String funcao) {		
		this.funcao = funcao;
	}

	public String getFuncao(){
		return funcao;
	}
}

