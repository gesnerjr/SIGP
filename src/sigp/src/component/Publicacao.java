package sigp.src.component;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import br.com.caelum.vraptor.Resource;

@Entity
@Resource
@Table(name = "PUBLICACAO")
public class Publicacao {
    
	private Long idPublicacao;
	
	@NotEmpty(message = "Publicação precisa ter um título.")
	private String titulo;
	
	private String resumo;
	private String paperAbstract;
	
	
	@NotNull(message = "Publicação precisa ter uma data válida.")
	private Integer mes;
	@NotNull(message = "Publicação precisa ter uma data válida.")
	private Integer ano;
	
	@NotNull(message = "Publicação precisa ter um status.")
	private PublicacaoStatus status;
	
	private String DOI;
	
	private Language language;
	

	private String bibtex;
	
	/* Publisher */
	private String publisherName;
	private String publisherCity;
	private String linkEditora;
	
	/* Veiculo */
	@NotNull(message = "Publicação precisa ter um veículo válido.")
	private TipoVeiculo veiculoTipo;
	private String veiculoNome;
	private Qualis qualis;
	private String volume;
	private String series;
	private String startPage;
	private String endPage;
	private String fascicle;
	private String isbn;
	private String issn;
	private Country country;
	
	
	
	
	private List<Projeto> projetos = new ArrayList<Projeto>();
	private List<Software> software = new ArrayList<Software>();
	private List<Contribuinte> contribuintes = new ArrayList<Contribuinte>();
	private List<LinhaPesquisa> linhas = new ArrayList<LinhaPesquisa>();

	/* Publication Files */
	private Boolean pdf;
	private Boolean presentation;

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable( name = "PROJETO_PUBLICACAO",
	joinColumns = @JoinColumn( name = "PUBLICACAO_ID"), 
	inverseJoinColumns = @JoinColumn (name = "PROJETO_ID"))
	public List<Projeto> getProjetos() {
		return projetos;
	}

	public void setProjetos(List<Projeto> projetos) {
		this.projetos = projetos;
	}
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable( name = "LINHA_PUBLICACAO",
		joinColumns = @JoinColumn( name = "PUBLICACAO_ID"), 
		inverseJoinColumns = @JoinColumn (name = "LINHA_ID")
	)
	public List<LinhaPesquisa> getLinhas() {
		return linhas;
	}

	public void setLinhas(List<LinhaPesquisa> linhas) {
		this.linhas = linhas;
	}


	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable( name = "SOFTWARE_PUBLICACAO",
		inverseJoinColumns = @JoinColumn( name = "SOFTWARE_ID"), 
		joinColumns = @JoinColumn (name = "PUBLICACAO_ID")
	)
	public List<Software> getSoftware() {
		return software;
	}

	public void setSoftware(List<Software> software) {
		this.software = software;
	}

	public Publicacao() {
	}

	public Publicacao(String titulo, String resumo, TipoVeiculo veiculo, String autor, Integer ano, 
			Integer mes, List<Contribuinte> contribuintes) {
		this.ano = ano;
		this.mes = mes;
		this.contribuintes = contribuintes;
		this.titulo = titulo;
		this.resumo = resumo;
		this.veiculoTipo = veiculo;

	}

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "CONTRIBUINTE_PUBLICACAO", 
		joinColumns = @JoinColumn(name = "PUBLICACAO_ID"),
		inverseJoinColumns = @JoinColumn(name = "CONTRIBUINTE_ID")
	)
	public List<Contribuinte> getContribuintes() {
		return contribuintes;
	}

	public void setContribuintes(List<Contribuinte> contribuintes) {
		this.contribuintes = contribuintes;
	}

	@Id
	@GeneratedValue
	@Column(name = "PUBLICACAO_ID")
	public Long getIdPublicacao() {
		return idPublicacao;
	}

	public void setIdPublicacao(Long idPublicacao) {
		this.idPublicacao = idPublicacao;
	}

	@Column(name = "PUBLICACAO_TITULO", nullable = false, length = 2042)
	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	@Lob
	@Column(name = "PUBLICACAO_RESUMO", nullable = false)
	public String getResumo() {
		return resumo;
	}

	public void setResumo(String resumo) {
		this.resumo = resumo;
	}


	@Enumerated(EnumType.STRING)
	@Column(name = "PUBLICACAO_VEICULO", nullable = false, length = 20)
	public TipoVeiculo getVeiculoTipo() {
		return veiculoTipo;
	}

	public void setVeiculoTipo(TipoVeiculo veiculo) {
		this.veiculoTipo = veiculo;
	}

	@Lob
	@Column(name = "PUBLICACAO_VEICULONOME", nullable = false)
	public String getVeiculoNome() {
		return veiculoNome;
	}

	public void setVeiculoNome(String veiculoNome) {
		this.veiculoNome = veiculoNome;
	}

	@Column(name = "PUBLICACAO_MES")
	public Integer getMes() {
		return mes;
	}

	public void setMes(Integer mes) {
		this.mes = mes;
	}
	
	@Column(name = "PUBLICACAO_ANO", nullable = false)
	public Integer getAno() {
		return ano;
	}

	public void setAno(Integer ano) {
		this.ano = ano;
	}


	
	public Boolean getPdf(){
		return this.pdf;
	}
	public void setPdf(Boolean pdf) {
		this.pdf = pdf;
	}

	@Lob
	@Column(name = "PUBLICACAO_ABSTRACT")
	public String getPaperAbstract() {
		return paperAbstract;
	}

	public void setPaperAbstract(String paperAbstract) {
		this.paperAbstract = paperAbstract;
	}

	@Lob
	@Column(name = "PUBLICACAO_BIBTEX")
	public String getBibtex() {
		return bibtex;
	}

	public void setBibtex(String bibtex) {
		this.bibtex = bibtex;
	}

	@Column(name = "PUBLICACAO_LINK", length = 2048)
	public String getLinkEditora() {
		return linkEditora;
	}

	public void setLinkEditora(String linkEditora) {
		this.linkEditora = linkEditora;
	}

	@Enumerated(EnumType.STRING)
	@Column(name = "PUBLICACAO_STATUS")
	public PublicacaoStatus getStatus() {
		return status;
	}

	public void setStatus(PublicacaoStatus status) {
		this.status = status;
	}

	
	@Column(name = "PUBLICACAO_DOI", length= 2048)
	public String getDOI() {
		return DOI;
	}

	public void setDOI(String dOI) {
		DOI = dOI;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	public Language getLanguage() {
		return language;
	}

	public void setLanguage(Language language) {
		this.language = language;
	}

	@Lob
	@Column(name = "PUBLICACAO_PUBLISHER_NAME")
	public String getPublisherName() {
		return publisherName;
	}

	public void setPublisherName(String publisherName) {
		this.publisherName = publisherName;
	}

	@Lob
	@Column(name = "PUBLICACAO_PUBLISHER_CITY")
	public String getPublisherCity() {
		return publisherCity;
	}

	public void setPublisherCity(String publisherCity) {
		this.publisherCity = publisherCity;
	}

	@Enumerated(EnumType.STRING)
	@Column(name = "PUBLICACAO_QUALIS")
	public Qualis getQualis() {
		return qualis;
	}

	public void setQualis(Qualis qualis) {
		this.qualis = qualis;
	}

	@Column(name = "PUBLICACAO_VOLUME", length= 128)
	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	@Column(name = "PUBLICACAO_SERIES", length= 128)
	public String getSeries() {
		return series;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	@Column(name = "PUBLICACAO_START_PAGE")
	public String getStartPage() {
		return startPage;
	}

	public void setStartPage(String startPage) {
		this.startPage = startPage;
	}
	
	@Column(name = "PUBLICACAO_END_PAGE")
	public String getEndPage() {
		return endPage;
	}

	public void setEndPage(String endPage) {
		this.endPage = endPage;
	}

	@Column(name = "PUBLICACAO_FASCICLE")
	public String getFascicle() {
		return fascicle;
	}

	public void setFascicle(String fascicle) {
		this.fascicle = fascicle;
	}

	@Column(name = "PUBLICACAO_ISBN")
	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	@Column(name = "PUBLICACAO_ISSN")
	public String getIssn() {
		return issn;
	}

	public void setIssn(String issn) {
		this.issn = issn;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public Boolean getPresentation() {
		return presentation;
	}

	public void setPresentation(Boolean presentation) {
		this.presentation = presentation;
	}

}
