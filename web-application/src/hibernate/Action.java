package hibernate;

import java.util.Date;
import java.util.List;

import org.hibernate.*;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import modeles.Abonne;
import modeles.Document;
import modeles.Emprunt;
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
		Query query = session.createQuery("select distinct doc from Document as doc left join fetch doc.reservations as reser");
		return query.list();
	}

	/**
	 * Récupère la liste de toutes les réservations en cours des document de la médiathèque.
	 * @return La liste des réservations
	 */
	public static List<Reservation> getDocumentBorrowed(){
		Session session = new Config().getSession();
		Query query = session.createQuery("select reservation from Reservation as reservation"
										+ " left join fetch reservation.pk.document as document"
										+ " left join fetch reservation.pk.abonne as abonne"
										+ " where reservation.retour is null");
		return query.list();
	}
	
	/**
	 * Récupère le type d'emprunt d'un document en fonction du type du document
	 * et de la catégorie de l'emprenteur
	 * @param type Type du document
	 * @param categorie Catégorie de l'emprunteur.
	 * @return Emprunt
	 */
	public static Emprunt getEmprunt(int type, int categorie){
		Session session =  new Config().getSession();
		Query query = session.createQuery("FROM Emprunt as emprunt "
										+ " WHERE emprunt.pk.categorie.id= :categorieid"
										+ " AND emprunt.pk.type.id= :typeid")
				.setInteger("categorieid",categorie)
				.setInteger("typeid",type);
		
		return (Emprunt)query.uniqueResult();
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
