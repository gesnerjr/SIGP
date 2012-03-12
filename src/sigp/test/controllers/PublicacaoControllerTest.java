package sigp.test.controllers;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.mapping.Array;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;

import sigp.src.component.Contribuinte;
import sigp.src.component.Projeto;
import sigp.src.component.Publicacao;
import sigp.src.component.TipoVeiculo;
import sigp.src.controller.PublicacaoController;
import sigp.src.dao.ContribuinteDao;
import sigp.src.dao.ProjetoDao;
import sigp.src.dao.PublicacaoDao;

public class PublicacaoControllerTest {

    PublicacaoController controller;
    Result result;
    PublicacaoDao dao;
    ProjetoDao pdao;
    ContribuinteDao cdao;
    SimpleDateFormat formatador = new SimpleDateFormat("dd/mm/yyyy");
    List<Publicacao> publicacoes;
    private Validator validator;

    @Before
    public void setUp() throws Exception {
        result = mock(Result.class);
        dao = mock(PublicacaoDao.class);
        validator = mock(Validator.class);
        pdao = mock(ProjetoDao.class);
        cdao = mock(ContribuinteDao.class);
        controller = new PublicacaoController(result, validator, dao, pdao, cdao);

        PublicacaoController controlmock = mock(PublicacaoController.class);
        when(result.redirectTo(PublicacaoController.class)).thenReturn(
                controlmock);
        when(validator.onErrorForwardTo(controller)).thenReturn(controlmock);
        setUpDao();
    }

    private void setUpDao() {
        publicacoes = new ArrayList<Publicacao>();

        {
            Publicacao publicacao = new Publicacao();
            publicacao.setIdPublicacao(1L);
            publicacao.setTitulo("Artigo 1");
            publicacao.setVeiculoTipo(TipoVeiculo.JOURNAL);

            List<Contribuinte> contribuintes = new ArrayList<Contribuinte>();
            Contribuinte contribuinte1 = mock(Contribuinte.class);
            Contribuinte contribuinte2 = mock(Contribuinte.class);
            contribuintes.add(contribuinte1);
            contribuintes.add(contribuinte2);

            List<Projeto> projetos = new ArrayList<Projeto>();
            Projeto projeto1 = mock(Projeto.class);
            Projeto projeto2 = mock(Projeto.class);
            projetos.add(projeto1);
            projetos.add(projeto2);

            publicacao.setContribuintes(contribuintes);
            publicacao.setProjetos(projetos);
            publicacoes.add(publicacao);

        }

        {
            Publicacao publicacao = new Publicacao();
            publicacao.setIdPublicacao(2L);
            publicacao.setTitulo("Artigo 2");
            publicacao.setVeiculoTipo(TipoVeiculo.CONFERENCIA);

            List<Contribuinte> contribuintes = new ArrayList<Contribuinte>();
            Contribuinte contribuinte1 = mock(Contribuinte.class);
            Contribuinte contribuinte2 = mock(Contribuinte.class);
            contribuintes.add(contribuinte1);
            contribuintes.add(contribuinte2);

            List<Projeto> projetos = new ArrayList<Projeto>();
            Projeto projeto1 = mock(Projeto.class);
            Projeto projeto2 = mock(Projeto.class);
            projetos.add(projeto1);
            projetos.add(projeto2);

            publicacao.setContribuintes(contribuintes);
            publicacao.setProjetos(projetos);
            publicacoes.add(publicacao);
        }
        when(dao.list()).thenReturn(publicacoes);
        when(dao.getPublicacao(1L)).thenReturn(publicacoes.get(0));
        when(dao.getPublicacao(2L)).thenReturn(publicacoes.get(1));
    }

    @After
    public void tearDown() throws Exception {
        controller = null;
        result = null;
        dao = null;
        publicacoes = null;
    }

    @Test
    public void testIndex() {
        controller.index();
        verify(result).include("publicacoes", publicacoes);
    }

    @Test
    public void testNovo_Form() {
        controller.novo_form();
        verify(result).include("veiculos", TipoVeiculo.values());
    }

    @Test
    public void testCria() {
        Publicacao p = publicacoes.get(0);
        controller.cria(p, new ArrayList<Long>(), new ArrayList<Long>());
        verify(dao).save(p);
    }

    @Test
    public void testVisualiza() {
        Publicacao p = publicacoes.get(0);
        controller.visualiza(p.getIdPublicacao());
        verify(result).include("publicacao", p);
    }

    @Test
    public void testAltera_form() {
        Publicacao p = publicacoes.get(0);
        controller.altera_form(p.getIdPublicacao());
        verify(result).include("publicacao", p);
    }

}
