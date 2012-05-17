package sigp.src.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import sigp.src.component.Software;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class SoftwareDao {
	private final Session session;

	public SoftwareDao(Session session) {
		this.session = session;
	}

	public Software getSoftware(Long id) {
		return (Software) this.session.get(Software.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Software> list() {
		return this.session.createCriteria(Software.class).list();
	}

	public void save(Software s) {
		Transaction t = this.session.beginTransaction();
		this.session.save(s);
		t.commit();
	}

	public void update(Software s) {
		Transaction t = this.session.beginTransaction();
		this.session.update(s);
		t.commit();
	}

	public void delete(Software s) {
		Transaction t = this.session.beginTransaction();
		this.session.delete(s);
		t.commit();
	}
}
