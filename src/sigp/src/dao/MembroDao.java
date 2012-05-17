package sigp.src.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import sigp.src.component.Contribuinte;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class MembroDao {
	private final Session session;

	public MembroDao(Session session) {
		this.session = session;
	}

	public Contribuinte getContribuinte(Long id) {
		return (Contribuinte) session.get(Contribuinte.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Contribuinte> list() {
		return this.session.createCriteria(Contribuinte.class).list();
	}
	
	public void save(Contribuinte contrib) {
		Transaction tx = session.beginTransaction();
		if (contrib.getIdContribuinte() == null){
			session.save(contrib);
		} else {
			session.merge(contrib);
		}
		tx.commit();
	}

	public void update(Contribuinte contrib) {
		Transaction tx = session.beginTransaction();
		session.merge(contrib);
		tx.commit();
	}

	public void delete(Contribuinte contrib) {
		Transaction tx = session.beginTransaction();
		session.delete(contrib);
		tx.commit();
	}

	@SuppressWarnings("unchecked")
	public List<Contribuinte> search_by_name(String q) {
		Query query = session.createQuery("from Contribuinte where nome like :q OR nomeCitacao like :q ");
		query.setParameter("q", "%"+q+"%");		
		return query.list();
	}
}
