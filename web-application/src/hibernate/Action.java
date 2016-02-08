package hibernate;

import java.util.List;

import org.hibernate.*;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import modeles.Document;

/**
 * Cette classe comporte toutes les actiosn pour intéragir avec la base de données :
 *  - Récupérer la liste des documents
 *  - Réserver un document
 *  - etc...
 *  
 * @author Jonathan de Flaugergues
 *
 */
public class Action {

	/**
	 * Récupère la liste de tous les documents présents à la médiathèque
	 * @return La liste des documents
	 */
	public static List<Document> getListDocument(){
		Session session = new Config().getSession();
		Query query = session.createQuery("FROM Document");
		return query.list();
	}
	
	/**
	 * Récupère un document à partir de son id
	 * @param id L'id du document
	 * @return Le document récupéré
	 */
	public static Document getDocument(int id){
		Session session = new Config().getSession();
		Query query = session.createQuery("FROM Document doc WHERE doc.id= :id")
				.setInteger("id",id);
		
		return (Document)query.uniqueResult();
	}
}
