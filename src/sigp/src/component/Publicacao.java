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
	
	private String bibtex;
	
	private String linkEditora;
	
	@NotNull(message = "Publicação precisa ter um veículo válido.")
	private TipoVeiculo veiculoTipo;
	
	private String veiculoNome;
	
	@NotNull(message = "Publicação precisa ter uma data válida.")
	private Integer mes;
	
	@NotNull(message = "Publicação precisa ter uma data válida.")
	private Integer ano;
	
	private List<Projeto> projetos = new ArrayList<Projeto>();
	private List<Contribuinte> contribuintes = new ArrayList<Contribuinte>();

	private Boolean pdf;

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
		inverseJoinColumns = @JoinColumn(name = "CONTRIBUINTE_ID"))
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

}
