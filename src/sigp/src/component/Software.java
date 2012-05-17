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

import org.hibernate.validator.constraints.NotEmpty;

import br.com.caelum.vraptor.Resource;

@Entity
@Resource
@Table(name = "SOFTWARE")
public class Software {

	private Long idSoftware;
	
	@NotEmpty(message = "Publicação precisa ter um título.")
	private String nome;
	
	private String descricao;
	
	private String repositorio;
	
	private String liveDemo;
	
	private Licenca licenca;
	
	private List<Projeto> projetos = new ArrayList<Projeto>();
	private List<Publicacao> publicacoes = new ArrayList<Publicacao>();
	private List<Contribuinte> membros = new ArrayList<Contribuinte>();
	private List<LinhaPesquisa> linhas = new ArrayList<LinhaPesquisa>();

	public Software() {
	}

	public Software(Long idPublicacao, String nome, String descricao,
			String repositorio, String liveDemo, Licenca licenca,
			List<Projeto> projetos, List<Contribuinte> contribuintes, 
			List<LinhaPesquisa> linhas, List<Publicacao> publicacoes) {
		super();
		this.idSoftware = idPublicacao;
		this.nome = nome;
		this.descricao = descricao;
		this.repositorio = repositorio;
		this.liveDemo = liveDemo;
		this.licenca = licenca;
		this.projetos = projetos;
		this.linhas = linhas;
		this.membros = contribuintes;
		this.publicacoes = publicacoes;
	}
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable( name = "PROJETO_SOFTWARE",
	joinColumns = @JoinColumn( name = "SOFTWARE_ID"), 
	inverseJoinColumns = @JoinColumn (name = "PROJETO_ID"))
	public List<Projeto> getProjetos() {
		return projetos;
	}
	
	public void setProjetos(List<Projeto> projetos) {
		this.projetos = projetos;
	}
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable( name = "SOFTWARE_PUBLICACAO",
		joinColumns = @JoinColumn( name = "SOFTWARE_ID"), 
		inverseJoinColumns = @JoinColumn (name = "PUBLICACAO_ID")
	)
	public List<Publicacao> getPublicacoes() {
		return publicacoes;
	}
	
	public void setPublicacoes(List<Publicacao> publicacoes) {
		this.publicacoes = publicacoes;
	}
	

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "CONTRIBUINTE_SOFTWARE", 
		joinColumns = @JoinColumn(name = "SOFTWARE_ID"),
		inverseJoinColumns = @JoinColumn(name = "CONTRIBUINTE_ID")
	)
	public List<Contribuinte> getContribuintes() {
		return membros;
	}

	public void setContribuintes(List<Contribuinte> contribuintes) {
		this.membros = contribuintes;
	}
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "LINHA_SOFTWARE", 
		joinColumns = @JoinColumn(name = "SOFTWARE_ID"),
		inverseJoinColumns = @JoinColumn(name = "LINHA_ID")
	)
	public List<LinhaPesquisa> getLinhas() {
		return linhas;
	}
	public void setLinhas(List<LinhaPesquisa> linhas) {
		this.linhas = linhas;
	}

	@Id
	@GeneratedValue
	@Column(name = "SOFTWARE_ID")
	public Long getIdSoftware() {
		return idSoftware;
	}

	public void setIdSoftware(Long idSoftware) {
		this.idSoftware = idSoftware;
	}

	@Column(name = "SOFTWARE_NOME", nullable = false, length = 2042)
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	@Lob
	@Column(name = "SOFTWARE_DESCRICAO")
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	@Column(name= "SOFTWARE_REPO", length=5048)
	public String getRepositorio() {
		return repositorio;
	}

	public void setRepositorio(String repositorio) {
		this.repositorio = repositorio;
	}

	@Enumerated(EnumType.STRING)
	@Column(name= "SOFTWARE_LICENCA", length=5048)
	public Licenca getLicenca() {
		return licenca;
	}

	public void setLicenca(Licenca licenca) {
		this.licenca = licenca;
	}

	@Column(name = "SOFTWARE_LIVEDEMO", length = 5048)
	public String getLiveDemo() {
		return liveDemo;
	}

	public void setLiveDemo(String liveDemo) {
		this.liveDemo = liveDemo;
	}

	
}
