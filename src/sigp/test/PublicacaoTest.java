package sigp.test;

import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import sigp.src.component.Contribuinte;
import sigp.src.component.Projeto;
import sigp.src.component.Publicacao;
import sigp.src.component.TipoVeiculo;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class PublicacaoTest {

    private Publicacao publicacao;
    private List<Contribuinte> contribuintes;
    private List<Projeto> projetos = new ArrayList<Projeto>();
    private SimpleDateFormat formatador = new SimpleDateFormat("dd/mm/yyyy");

    @Before
    public void setUp() throws Exception {
	this.publicacao = criarPublicacao();
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void deveriaDevolverTitulo() {
	assertEquals(
		"Deveria devolver o Titulo da Publicacao",
		"Service-oriented middleware for the Future Internet: state of the art and research directions",
		publicacao.getTitulo());
    }

    @Test
    public void deveriaDevolverVeiculo() {
	assertEquals("Deveria devolver o Veiculo da Publicacao", "Journal",
		publicacao.getVeiculoTipo().getTipoVeiculo());
    }

    @Test
    public void deveriaDevolverData() throws ParseException {
	assertEquals("Deveria devolver a Data da Publicacao",
		formatador.parse("25/05/2011"), publicacao.getData());
    }

    @Test
    public void deveriaDevolverContribuintesEnvolvidosNaPublicacao() {
	assertEquals(
		"Deveria devolver o primeiro grupo da lista de Grupos envolvidos na publicacao",
		contribuintes.get(0).getNome(), publicacao.getContribuintes()
			.get(0).getNome());
	assertEquals(
		"Deveria devolver o segundo grupo da lista de Grupos envolvidos na publicacao",
		contribuintes.get(1).getNome(), publicacao.getContribuintes()
			.get(1).getNome());
	assertArrayEquals(contribuintes.toArray(), publicacao
		.getContribuintes().toArray());
    }
    
    @Test
    public void deveriaDevolverProjetosProprietariosDaPublicacao(){
	assertArrayEquals(publicacao.getProjetos().toArray(),
		projetos.toArray());
    }
    @Test
    public void deviaDevolverMesmaReferenciaParaListaDeProjetosDaPublicacao() {
	assertSame(publicacao.getProjetos(), projetos);
    }    

    public Publicacao criarPublicacao() throws ParseException {

	publicacao = new Publicacao();

	publicacao
		.setTitulo("Service-oriented middleware for the Future Internet: state of the art and research directions");
	publicacao.setVeiculoTipo(TipoVeiculo.JOURNAL);
	publicacao.setData(formatador.parse("25/05/2011"));

	contribuintes = new ArrayList<Contribuinte>(2);
	Contribuinte contribuinte1 = mock(Contribuinte.class);
	Contribuinte contribuinte2 = mock(Contribuinte.class);

	when(contribuinte1.getNome()).thenReturn("Marco Aurelio Gerosa");
	when(contribuinte2.getNome()).thenReturn("Valdemar Setzer");

	contribuintes.add(contribuinte1);
	contribuintes.add(contribuinte2);
	
	projetos = new ArrayList<Projeto>(2);
	Projeto projeto1 = mock(Projeto.class);
	Projeto projeto2 = mock(Projeto.class);
	projetos.add(projeto1);
	projetos.add(projeto2);		
	
	publicacao.setContribuintes(contribuintes);
	publicacao.setProjetos(projetos);

	return publicacao;

    }

}
