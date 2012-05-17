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
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import br.com.caelum.vraptor.Resource;

@Entity
@Resource
@Table(name = "PROJETO")
public class Projeto {
    
	private Long idProjeto;
    
    @NotEmpty(message = "Projeto precisa ter um nome.")
	private String nome;
    
	private String descricao;
    
	private String descricaoCurta;
    
	private String financiamento;
	
	private String site;
	
	private List<Publicacao> publicacoes = new ArrayList<Publicacao>();
	private List<Software> software = new ArrayList<Software>();
	private List<LinhaPesquisa> linhasDePesquisa = new ArrayList<LinhaPesquisa>();
	

	private List<Contribuinte> coordenadores = new ArrayList<Contribuinte>();
	private List<Contribuinte> membros = new ArrayList<Contribuinte>();
	

	@ManyToMany(mappedBy = "projetos")
	public List<LinhaPesquisa> getLinhasDePesquisa() {
		return linhasDePesquisa;
	}
	public void setLinhasDePesquisa(List<LinhaPesquisa> linhasDePesquisa) {
		this.linhasDePesquisa = linhasDePesquisa;
	}
	
	
	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "projetos")
	public List<Publicacao> getPublicacoes() {
		return publicacoes;
	}
	public void setPublicacoes(List<Publicacao> publicacoes) {
		this.publicacoes = publicacoes;
	}	
	
	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "projetos")
	public List<Software> getSoftware() {
		return software;
	}
	public void setSoftware(List<Software> software) {
		this.software = software;
	}

	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable( name = "PROJETO_COORDENADORES",
		joinColumns = @JoinColumn( name = "CONTRIBUINTE_ID"), 
		inverseJoinColumns = @JoinColumn (name = "PROJETO_ID")
	)
	public List<Contribuinte> getCoordenadores() {
		return coordenadores;
	}
	public void setCoordenadores(List<Contribuinte> coordenadores) {
		this.coordenadores = coordenadores;
	}
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable( name = "PROJETO_MEMBROS",
		joinColumns = @JoinColumn( name = "CONTRIBUINTE_ID"), 
		inverseJoinColumns = @JoinColumn (name = "PROJETO_ID")
	)
	public List<Contribuinte> getMembros() {
		return membros;
	}
	public void setMembros(List<Contribuinte> membros) {
		this.membros = membros;
	}
	
	
	@Column(name = "PROJETO_NOME", nullable = false)
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	@Lob
	@Column(name = "PROJETO_DESCRICAO", nullable = true)
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	@Id @GeneratedValue @Column(name = "PROJETO_ID")
	public Long getIdProjeto() {
		return idProjeto;
	}
	public void setIdProjeto(Long idProjeto) {
		this.idProjeto = idProjeto;
	}
	
	@Column(name = "PROJETO_FINACIAMENTO", nullable = true)
	public String getFinanciamento() {
		return financiamento;
	}
	public void setFinanciamento(String financiamento) {
		this.financiamento = financiamento;
	}
	
	public void copy(Projeto p) {
		this.setNome(p.getNome());
		this.setDescricao(p.getDescricao());
		this.setFinanciamento(p.getFinanciamento());
	}
	
	@Column(name = "PROJETO_SITE", length=4096)
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	
	@Lob
	@Column(name = "PROJETO_DESCRICAO_CURTA")
	public String getDescricaoCurta() {
		return descricaoCurta;
	}
	public void setDescricaoCurta(String descricaoCurta) {
		this.descricaoCurta = descricaoCurta;
	}

}
