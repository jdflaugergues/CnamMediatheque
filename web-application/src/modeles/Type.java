package modeles;

import javax.persistence.*;

@Entity
@Table(name = "Type")
public class Type {
	
	@Id
	@GeneratedValue
	@Column(name = "typ_typeId")
	private int id;
	public int getId(){return id;}
	public void setId(int id){this.id = id;}
	
	@Column(name = "typ_nom")
	private String nom;
	public void setNom(String nom){this.nom = nom;}
	public String getNom(){return nom;}
}
