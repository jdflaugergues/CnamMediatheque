package modeles;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.BatchSize;

@Entity
@Table(name = "Categorie")
public class Categorie {
	
	public Categorie(){}

	@Id
	@GeneratedValue
	@Column(name = "cat_categorieId")
	private int id;
	public int getId(){return id;}
	public void setId(int id){this.id = id;}
	
	@Column(name = "cat_nom")
	private String nom;
	public void setNom(String nom){this.nom = nom;}
	public String getNom(){return nom;}
	
	@OneToMany(mappedBy = "pk.categorie" , fetch=FetchType.LAZY, cascade=CascadeType.PERSIST)
	private Set<Emprunt> emprunts = new HashSet<Emprunt>();
	public Set<Emprunt> getEmprunts() {return this.emprunts;}
	public void setEmprunts(Set<Emprunt> emprunts) {this.emprunts = emprunts;}
}
