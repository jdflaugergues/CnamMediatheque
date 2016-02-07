package modeles;

import javax.persistence.*;

@Entity
@Table(name = "Livre")
@PrimaryKeyJoinColumn(name="doc_documentId")
public class Livre {
	
	public Livre(){}

	@Column(name = "liv_nbPages")
	private int nbPages;
	public void setNbPages(int nbPages){this.nbPages = nbPages;}
	public int getNbPages(){return nbPages;}

	@Column(name = "liv_collection")
	private String collection;
	public void setCollection(String collection){this.collection = collection;}
	public String getCollection(){return collection;}

	@Column(name = "liv_editeur")
	private String editeur;
	public void setEditeur(String editeur){this.editeur = editeur;}
	public String getEditeur(){return editeur;}

	@Column(name = "liv_isbn")
	private String isbn;
	public void setIsbn(String isbn){this.isbn = isbn;}
	public String getIsbn(){return isbn;}
}
