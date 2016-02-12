package hibernate;

import java.util.Date;
import java.util.List;

import org.hibernate.*;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import modeles.Abonne;
import modeles.Document;
import modeles.Reservation;

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
		Query query = session.createQuery("select doc from Document as doc left join fetch doc.reservations as reser");
		return query.list();
	}
	
	/**
	 * Récupère un document à partir de son id
	 * @param id L'id du document
	 * @return Le document récupéré
	 */
	public static Document getDocument(int id){
		Session session =  new Config().getSession();
		Query query = session.createQuery("FROM Document doc WHERE doc.id= :id")
				.setInteger("id",id);
		
		return (Document)query.uniqueResult();
	}
	
	public static Abonne getAbonne(int id){
		Session session =  new Config().getSession();
		Query query = session.createQuery("FROM Abonne ab WHERE ab.id= :id")
				.setInteger("id",id);
		
		return (Abonne)query.uniqueResult();
	}
	
	/**
	 * Récupère les documents en cours de réservation pour un abonné.
	 * @param abo L'abonnée
	 * @return La liste des documents en cours de réservation.
	 */
	public static List<Document> getReservations(Abonne abo){
		Session session =  new Config().getSession();
		Query query = session.createQuery("FROM Document doc WHERE doc IN "
				+ "(SELECT r.pk.document.id FROM Reservation r WHERE r.retour is null and r.pk.abonne= :abo)")
				.setEntity("abo", abo);
		
		return query.list();
	}
	
	/**
	 * Effectue une réservation d'un document par un abonné
	 * @param idDocument L'id du document réservé
	 * @param idAbonne L'id de l'abonné réservant
	 */
	public static void reserve(Document doc, Abonne abo){
		Session session =  new Config().getSession();
				
		Reservation reservation = new Reservation();
		reservation.setDocument(doc);
		reservation.setAbonne(abo);
		reservation.setDate(new Date());
		
		Transaction tx = null;
        try {
        	tx = session.beginTransaction();
        	session.save(reservation);
        	tx.commit();
        } catch (RuntimeException e) {
        	if (tx != null)
        		tx.rollback();
        	throw e; // Gérer le message (log, affichage, etc.)
        }
	}

	/**
	 * Effectue le retour d'un document d'un abonné
	 * @param idDocument L'id du document retourné
	 * @param idAbonne L'id de l'abonné retournant le document
	 */
	public static void takeback(Document doc, Abonne abo){
		Session session =  new Config().getSession();

		Transaction tx = null;
        try {
        	tx = session.beginTransaction();
        	
        	String hqlUpdate = "UPDATE Reservation r set retour = :retour "
        			+ "WHERE r.pk.abonne.id = :aboid  "
        			+ "AND r.pk.document.id= :docid "
        			+ "AND r.retour is null";
        	
        	session.createQuery( hqlUpdate )
        	        .setDate("retour", new Date() )
        	        .setInteger("aboid", abo.getId() )
        	        .setInteger("docid", doc.getId() )
        	        .executeUpdate();
        	
        	tx.commit();
        	
        } catch (RuntimeException e) {
        	if (tx != null)
        		tx.rollback();
        	throw e; // Gérer le message (log, affichage, etc.)
        }
	}
	
}
