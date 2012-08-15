package sigp.src.component;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import br.com.caelum.vraptor.Resource;

@Entity
@Resource
@Table(name = "LANGUAGE")
public class Language {
	
	private Long idLanguage;

	@NotEmpty(message = "Language must have ISO 639-1 code.")
	private String languageISOCode;
	
	@Id
	@GeneratedValue
	@Column(name = "languageID")
	public Long getIdLanguage() {
		return idLanguage;
	}

	public void setIdLanguage(Long idLanguage) {
		this.idLanguage = idLanguage;
	}
	
	
	@Column(name = "ISOcode", nullable = false, length = 5)
	public String getLanguageISOCode() {
		return languageISOCode;
	}
	
	public void setLanguageISOCode(String languageISOCode) {
		this.languageISOCode = languageISOCode;
	}

}
