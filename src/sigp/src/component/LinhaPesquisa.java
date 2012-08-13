package sigp.src.component;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import br.com.caelum.vraptor.Resource;

@Entity
@Resource
@Table(name = "LINHA")
public class LinhaPesquisa {
    
	private Long idPesquisa;
	
	@NotEmpty(message = "Linha de pesquisa precisa ter nome.")
	private String nome;
	
	private String descricao;
	
	private List<Projeto> projetos = new ArrayList<Projeto>();
	private List<Grupo> grupos = new ArrayList<Grupo>();
	// Relacao = {Contribuinte, Linha de Pesquisa} 
	private List<RelacaoPesquisa> relacoes = new ArrayList<RelacaoPesquisa>();
	
	private List<Publicacao> publicacoes = new ArrayList<Publicacao>();
	
	/* 
	 * Relacoes para a propria entidade precisam ser declaradas sob os
	 * dois 'pontos de vista'
	*/ 
	private List<LinhaPesquisa> linhasPai;
	private List<LinhaPesquisa> linhasFilhas;
	
	
	public LinhaPesquisa() {
	}
	
	public LinhaPesquisa(String nome, String descricao){
		this.nome = nome;
		this.descricao = descricao;
	}
	
	
	@OneToMany(mappedBy = "linha")
	public List<RelacaoPesquisa> getRelacoes() {
		return relacoes;
	}
	public void setRelacoes(List<RelacaoPesquisa> relacoes) {
		this.relacoes = relacoes;
	}
	
	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "linhas")
	public List<Publicacao> getPublicacoes() {
		return publicacoes;
	}
	public void setPublicacoes(List<Publicacao> publicacoes) {
		this.publicacoes = publicacoes;
	}

	@ManyToMany
	@JoinTable(name="LINHAS_PAI",
			joinColumns = @JoinColumn(name = "LINHA_ID"),
			inverseJoinColumns = @JoinColumn(name = "LINHAPAI_ID")
	)

	public List<LinhaPesquisa> getLinhasPai() {
		return linhasPai;
	}
	
	public void setLinhasPai(List<LinhaPesquisa> linhasPai) {
		this.linhasPai = linhasPai;
	}
	

	@ManyToMany
	@JoinTable(name="LINHAS_PAI",
			joinColumns = @JoinColumn(name = "LINHAPAI_ID"),
			inverseJoinColumns = @JoinColumn(name = "LINHA_ID")
	)
	public List<LinhaPesquisa> getLinhasFilhas() {
		return linhasFilhas;
	}
	
	public void setLinhasFilhas(List<LinhaPesquisa> linhasFilhas) {
		this.linhasFilhas = linhasFilhas;
	}
	

	@ManyToMany()
	@JoinTable( name = "LINHA_PROJETO",
		joinColumns = @JoinColumn( name = "LINHA_ID"), 
		inverseJoinColumns = @JoinColumn (name = "PROJETO_ID")
	)
	public List<Projeto> getProjetos() {
		return projetos;
	}
	public void setProjetos(List<Projeto> projetos) {
		this.projetos = projetos;
	}

	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "pesquisas")
	public List<Grupo> getGrupos(){
		return grupos;
	}
	public void setGrupos(List<Grupo> grupos){
		this.grupos = grupos;
	}
	
	
	@Id
	@GeneratedValue 
	@Column(name = "LINHA_ID")
	public Long getIdPesquisa() {
		return idPesquisa;
	}
	public void setIdPesquisa(Long idPesquisa) {
		this.idPesquisa = idPesquisa;
	}
	
	
	@Column(name = "LINHA_NOME", nullable = false)
	public String getNome() {
		return nome;
	}
	public void setNome(String name) {
		this.nome = name;
	}
	
	@Lob
	@Column(name = "LINHA_DESC", nullable = false)
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	
	
	
	
}
