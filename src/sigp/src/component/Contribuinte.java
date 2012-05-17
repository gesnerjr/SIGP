package sigp.src.component;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import br.com.caelum.vraptor.Resource;

@Entity
@Resource
@Table(name = "CONTRIBUINTE")
public class Contribuinte {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idContribuinte;
	
	@NotEmpty(message = "Contribuinte precisa ter um nome.")
	
	private String nome;
	
	private String nomeCitacao;
	
	private Boolean foto;
	
	private UsuarioFuncao funcao;
	
	private Usuario usuario;
	
	private List<Publicacao> publicacoes = new ArrayList<Publicacao>();
	private List<Filiacao> filiacoes = new ArrayList<Filiacao>();
	
	private List<Projeto> projetosCoordenador = new ArrayList<Projeto>();
	private List<Projeto> projetosMembro = new ArrayList<Projeto>();
	
	private List<RelacaoPesquisa> relacoes = new ArrayList<RelacaoPesquisa>();

	@OneToMany(mappedBy = "contribuinte")
	public List<Filiacao> getFiliacoes() {
		return filiacoes;
	}

	public void setFiliacoes(List<Filiacao> filiacoes) {
		this.filiacoes = filiacoes;
	}

	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "coordenadores")
	public List<Projeto> getProjetosCoordenador() {
		return projetosCoordenador;
	}
	public void setProjetosCoordenador(List<Projeto> projetosCoordenador) {
		this.projetosCoordenador = projetosCoordenador;
	}

	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "membros")
	public List<Projeto> getProjetosMembro() {
		return projetosMembro;
	}
	public void setProjetosMembro(List<Projeto> projetosMembro) {
		this.projetosMembro = projetosMembro;
	}

	@OneToMany(mappedBy = "contribuinte",  cascade = CascadeType.ALL)
	public List<RelacaoPesquisa> getRelacoes() {
		return relacoes;
	}

	public void setRelacoes(List<RelacaoPesquisa> relacoes) {
		this.relacoes = relacoes;
	}

	@OneToOne(optional=true)
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "CONTRIBUINTE_PUBLICACAO", 
		joinColumns = @JoinColumn(name = "CONTRIBUINTE_ID"), 
		inverseJoinColumns = @JoinColumn(name = "PUBLICACAO_ID")
	)
	public List<Publicacao> getPublicacoes() {
		return publicacoes;
	}

	public void setPublicacoes(List<Publicacao> publicacoes) {
		this.publicacoes = publicacoes;
	}

	@Id
	@GeneratedValue
	@Column(name = "CONTRIBUINTE_ID")
	public Long getIdContribuinte() {
		return idContribuinte;
	}

	public void setIdContribuinte(Long idContribuinte) {
		this.idContribuinte = idContribuinte;
	}

	@Column(name = "CONTRIBUINTE_NOME", nullable = false, length = 255)
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Column(name = "CONTRIBUINTE_NOMECITE", nullable = false, length = 255)
	public String getNomeCitacao() {
		return nomeCitacao;
	}

	public void setNomeCitacao(String nomeCitacao) {
		this.nomeCitacao = nomeCitacao;
	}

	public Boolean getFoto() {
		return foto;
	}

	public void setFoto(Boolean foto) {
		this.foto = foto;
	}

	@Enumerated(EnumType.STRING)
	@Column(name = "CONTRIBUINTE_FUNCAO", nullable = true, length = 255)
	public UsuarioFuncao getFuncao() {
		return funcao;
	}

	public void setFuncao(UsuarioFuncao funcao) {
		this.funcao = funcao;
	}

}
