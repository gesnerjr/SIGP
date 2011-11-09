package sigp.src;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import br.com.caelum.vraptor.Resource;

@Entity
@Resource
@Table(name = "CONTRIBUINTE")
public class Contribuinte {
	private Long idContribuinte;
	private String nome;
	private Usuario usuario;
	private List<Publicacao> publicacoes = new ArrayList<Publicacao>();
	private List<Filiacao> filiacoes = new ArrayList<Filiacao>();
	private List<Participacao> participacoes = new ArrayList<Participacao>();
	private List<RelacaoPesquisa> relacoes = new ArrayList<RelacaoPesquisa>();

	@OneToMany(mappedBy = "contribuinte")
	public List<Filiacao> getFiliacoes() {
		return filiacoes;
	}

	public void setFiliacoes(List<Filiacao> filiacoes) {
		this.filiacoes = filiacoes;
	}

	@OneToMany(mappedBy = "contribuinte")
	public List<Participacao> getParticipacoes() {
		return participacoes;
	}

	public void setParticipacoes(List<Participacao> participacoes) {
		this.participacoes = participacoes;
	}

	@OneToMany(mappedBy = "contribuinte")
	public List<RelacaoPesquisa> getRelacoes() {
		return relacoes;
	}

	public void setRelacoes(List<RelacaoPesquisa> relacoes) {
		this.relacoes = relacoes;
	}

	@OneToOne(mappedBy = "contribuinte")
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "CONTRIBUINTE_PUBLICACAO", joinColumns = { @JoinColumn(name = "CONTRIBUINTE_ID") }, inverseJoinColumns = { @JoinColumn(name = "PUBLICACAO_ID") })
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

}
