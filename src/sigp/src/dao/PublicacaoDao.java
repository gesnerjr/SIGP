package sigp.src.dao;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import sigp.src.component.Publicacao;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class PublicacaoDao {
	private final Session session;

	public PublicacaoDao(Session session) {
		this.session = session;
	}

	public Publicacao getPublicacao(Long id) {
		return (Publicacao) session.get(Publicacao.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Publicacao> list() {
		return this.session.createCriteria(Publicacao.class).list();
	}
	
	public void save(Publicacao publicacao) {
		Transaction tx = session.beginTransaction();
		session.save(publicacao);
		tx.commit();
	}

	public void update(Publicacao publicacao) {
		Transaction tx = session.beginTransaction();
		session.update(publicacao);
		tx.commit();
	}

	public void delete(Publicacao publicacao) {
		Transaction tx = session.beginTransaction();
		publicacao.setContribuintes(null);
		publicacao.setProjetos(null);
		session.delete(publicacao);
		tx.commit();
	}

	@SuppressWarnings("unchecked")
	public List<Publicacao> list_year(Integer year) {
		Query query = session.createQuery("from Publicacao where ano = :year ");
		query.setParameter("year", year);		
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Publicacao> list_before_year(Integer year) {
		Query query = session.createQuery("from Publicacao where ano < :year ");
		query.setParameter("year", year);		
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Publicacao> list_by_project(Integer projectId) {
		Query query = session.createSQLQuery("select P.* from PUBLICACAO AS P, PROJETO_PUBLICACAO as PP where " +
				"P.PUBLICACAO_ID = PP.PUBLICACAO_ID and " +
				"PP.PROJETO_ID = :pid").addEntity(Publicacao.class);
		query.setParameter("pid", projectId);		
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Publicacao> list_by_line(Integer lineId) {
		Query query = session.createSQLQuery("select P.* from PUBLICACAO AS P, LINHA_PUBLICACAO as LP where " +
				"P.PUBLICACAO_ID = LP.PUBLICACAO_ID and " +
				"LP.LINHA_ID = :lid").addEntity(Publicacao.class);
		query.setParameter("lid", lineId);		
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public Map<Integer, BigInteger> years_with_publication(){
		Map<Integer, BigInteger> years = new HashMap<Integer, BigInteger>();
		Query query = session.createSQLQuery("select P.PUBLICACAO_ANO as ano, count(*) as count " +
				"from PUBLICACAO P " +
				"group by P.PUBLICACAO_ANO " +
				"order by P.PUBLICACAO_ANO desc " +
				"LIMIT 10");
        for(ListIterator iter = query.list().listIterator(); iter.hasNext(); ) {
        	Object[] row = (Object[]) iter.next();
        	years.put((Integer)row[0], (BigInteger)row[1]);
        }

        return years;
	}
	
	
}
