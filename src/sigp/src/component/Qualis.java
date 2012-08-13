package sigp.src.component;

public enum Qualis {
    A1("A1"),
    A2("A2"),
    B1("B1"),
    B2("B2"),
    B3("B3"),
    B4("B4"),
    B5("B5"),
    C("C");
	
	private String qualis;
	
	private Qualis(String qualis) {		
		this.qualis = qualis;
	}

	public String getQualis(){
		return qualis;
	}
}
