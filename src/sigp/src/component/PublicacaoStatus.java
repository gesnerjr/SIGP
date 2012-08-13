package sigp.src.component;

public enum PublicacaoStatus {
    WORKING("Em Producao"),
    SUBMITED("Submetido"),
    PUBLISHED("Publicado"),
    REJECTED("Recusado"),
    CANCELED("Cancelado"),
    ACCEPTED("Aceito para publicacao");
	
	private String publicationStatus;
	
	private PublicacaoStatus(String status) {		
		this.publicationStatus = status;
	}

	public String getPublicacaoStatus(){
		return publicationStatus;
	}
}
