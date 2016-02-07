package modeles;

import javax.persistence.*;

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
}
