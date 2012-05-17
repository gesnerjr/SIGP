package sigp.src.component;

public enum Licenca {
	APACHE("Apache License, Version 2.0"),
	AGPL("GNU Affero General Public License"),
	LGPL("GNU Lesser General Public License"),
	GPL("GNU General Public License"),
	MIT("MIT License (Expat)");
	
	private String nomeLicenca;

	private Licenca(String nomelicenca) {
		this.nomeLicenca = nomelicenca;
	}

	public String getNomeLicenca() {
		return nomeLicenca;
		
	}	

}
