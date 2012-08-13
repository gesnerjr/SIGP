package sigp.src.component;

public enum TipoVeiculo {
	JOURNAL("Journal"),
	COMPLETO("Artigo Completo em Conferência"), 
	RESUMO("Artigo Resumido em Conferência"),
	CAPITULO("Capítulo de Livro"),
	LIVRO("Livro"),
	TESE("Tese de Doutorado"),
	DISSERTACAO("Dissertação de Mestrado"),
	TCC("Trabalho de Conclusão de Curso"),
	WORKSHOP("Artigo completo em Workshop"),
	WORKSHOP_RESUMO("Artigo Resumido em Workshop"),
	REPORT("Relatório Técnico"),
	MAGAZINE("Revista"),
	OTHER("Outro");
	
	private String tipoVeiculo;
	
	private TipoVeiculo(String tipoVeiculo) {		
		this.tipoVeiculo = tipoVeiculo;
	}

	public String getTipoVeiculo(){
		return tipoVeiculo;
	}
}
