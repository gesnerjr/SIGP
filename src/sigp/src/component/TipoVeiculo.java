package sigp.src.component;

public enum TipoVeiculo {
	JOURNAL("Journal"),
	COMPLETO("Artigo Completo em Conferência"), 
	RESUMO("Artigo Resumido em Conferência"),
	CAPITULO("Capítulo de Livro"),
	LIVRO("Livro"),
	TESE("Tese"),
	DISSERTACAO("Dissertação"),
	TCC("Trabalho de Conclusão de Curso");
	
	private String tipoVeiculo;
	
	private TipoVeiculo(String tipoVeiculo) {		
		this.tipoVeiculo = tipoVeiculo;
	}

	public String getTipoVeiculo(){
		return tipoVeiculo;
	}
}
