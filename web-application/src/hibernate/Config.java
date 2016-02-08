package hibernate;

import org.hibernate.*;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 * Cette Classe permet d'établir une connexion avec Hibernate et
 * de mettre à disposition son objet session pour requêter la base.
 * @author Jonathan de Flaugergues
 *
 */
public class Config {

	private Session session;

	/**
	 * Constructeur établissant une connexion avec Hibernate
	 */
	public Config() {
		Configuration configuration = new Configuration().configure();
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		session = sessionFactory.openSession();
	}
	
	/**
	 * Retourne la session hibernate.
	 * @return La session hibernate
	 */
	public Session getSession(){
		return this.session;
	}
}
