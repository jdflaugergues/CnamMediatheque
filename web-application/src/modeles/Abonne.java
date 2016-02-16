package modeles;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.BatchSize;

import hibernate.Action;

@Entity
@Table(name = "Abonne")
@Inheritance(strategy=InheritanceType.JOINED)
public class Abonne {
	
	public Abonne(){}

	@Id
	@GeneratedValue
	@Column(name = "abo_abonneId")
	private int id;
	public int getId(){return id;}
	public void setId(int id){this.id = id;}
	
	@Column(name = "abo_nom")
	private String nom;
	public void setNom(String nom){this.nom = nom;}
	public String getNom(){return nom;}
	
	@Column(name = "abo_prenom")
	private String prenom;
	public void setPrenom(String prenom){this.prenom = prenom;}
	public String getPrenom(){return prenom;}

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name="abo_cat_categorieId")
	private Categorie categorie;
	public Categorie getCategorie() {return this.categorie;}
	public void setCategorie(Categorie categorie) {this.categorie = categorie;}
	
	@OneToMany(mappedBy = "pk.abonne", cascade=CascadeType.PERSIST)
	@BatchSize(size=10)
	private Set<Reservation> reservations = new HashSet<Reservation>();
	public Set<Reservation> getReservations() {return this.reservations;}
	public void setReservations(Set<Reservation> r) {this.reservations = r;}
	
	public boolean canReservedDocument(Document docToReserved){
		
		boolean canReserved = true;
		
		// Liste des documents en cours de réservation par l'abonné
		List<Document> docReserved = Action.getReservations(this);
		
		// Nombre de document total en cours d'emprunt par l'abonné.
		int nbDocReserved =  docReserved.size(); 
		
		// Nombre de document en cours d'emprunt du même type que celui que l'abonné veut emprunté
		int nbSameDocReserved = 0;		
		
		for (Document d : docReserved){
			
			if (d.getType().getNom().equals(docToReserved.getType().getNom())){
				nbSameDocReserved++;
			}
		}
		
		int qttMaxDocReserved = 0;		// Quantité max de document que l'abonné peut emprunté
		int qttMaxSameDocReserved = 0;	// Quantité max de document de même type que l'abonné peut emprunté
		
		// On récupère les caractéristiques d'emprunt pour la catégorie de l'abonné courant
		Set<Emprunt> emp = this.categorie.getEmprunts();
		
		for (Emprunt e : emp){
			if (e.getType().getNom().equals(docToReserved.getType().getNom())){
				qttMaxSameDocReserved = e.getQttMax();
			}
			if (e.getType().getNom().equals("Document")){
				qttMaxDocReserved = e.getQttMax();
			}
		}
		
		// Si on a atteint la quantité max de document de même type ou total à emprunter
		if (nbSameDocReserved == qttMaxSameDocReserved || nbDocReserved == qttMaxDocReserved){
			canReserved = false;
		}
		return canReserved;
	}
}
