package sigp.src.business;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import sigp.src.component.Disciplina;
import sigp.src.component.Filiacao;
import sigp.src.component.Grupo;
import sigp.src.component.Projeto;
import sigp.src.component.Publicacao;
import sigp.src.component.TipoVeiculo;

public class CriaTabela {
	public static void init() {
		Configuration configuration = new Configuration();
		configuration.addAnnotatedClass(Disciplina.class);
		configuration.addAnnotatedClass(Grupo.class);
		configuration.addAnnotatedClass(Filiacao.class);
		configuration.addAnnotatedClass(Publicacao.class);
		configuration.addAnnotatedClass(Projeto.class);
		configuration.addAnnotatedClass(TipoVeiculo.class);

		configuration.configure();

		SessionFactory factory = configuration.buildSessionFactory();
		Session session = factory.openSession();

		Transaction tx = session.beginTransaction();
		new SchemaExport(configuration).create(true, true);
		tx.commit();
	}
}
