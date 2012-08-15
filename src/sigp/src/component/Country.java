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
@Table(name = "COUNTRY")
public class Country {
	
	private Long idCountry;

	@NotEmpty(message = "Country must have ISO 3166 code.")
	private String countryISOCode;
	
	@Id
	@GeneratedValue
	@Column(name = "countryID")
	public Long getIdCountry() {
		return idCountry;
	}

	public void setIdCountry(Long idCountry) {
		this.idCountry = idCountry;
	}
	
	
	@Column(name = "ISOcode", nullable = false, length = 5)
	public String getCountryISOCode() {
		return countryISOCode;
	}
	
	public void setCountryISOCode(String countryISOCode) {
		this.countryISOCode = countryISOCode;
	}

}
