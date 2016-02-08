package modeles;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.BatchSize;

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
	
	@OneToMany(mappedBy = "pk.abonne" , fetch=FetchType.LAZY, cascade=CascadeType.PERSIST)
	@BatchSize(size=10)
	private Set<Reservation> reservations = new HashSet<Reservation>();
	public Set<Reservation> getReservations() {return this.reservations;}
	public void setReservations(Set<Reservation> r) {this.reservations = r;}
}
