package sigp.src.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import sigp.src.component.Contribuinte;
import sigp.src.component.Usuario;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.RequestScoped;

@Component
@RequestScoped
public class UsuarioDao {
	private final Session session;
	
	public UsuarioDao(Session session) {
		this.session = session;
	}

	public void save(Usuario usuario){
		Transaction t = session.beginTransaction();
		session.save(usuario);
		t.commit();
	}
	
	public Usuario pegaUsuarioPorLogin (String login){
		@SuppressWarnings("unchecked")
		List<Usuario> usuarios = this.session.createCriteria(Usuario.class).add(Restrictions.eq("login", login)).list();
		if(usuarios.size() > 0)
			return usuarios.get(0);
		return null;
		 
	}
	public Usuario getUsuario(Long id) {
		return (Usuario) session.get(Usuario.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Usuario> list(){
		return this.session.createCriteria(Usuario.class).list();
	}
	
	public void delete(Usuario usuario){
		Transaction t = session.beginTransaction();
		session.delete(usuario);
		t.commit();
	}
	
	public void update(Usuario usuario){
		Transaction t = session.beginTransaction();
		session.merge(usuario);
		t.commit();
	}
	
	
}
