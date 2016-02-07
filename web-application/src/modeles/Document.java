package modeles;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "Document")
@Inheritance(strategy=InheritanceType.JOINED)
public class Document {
	
	public Document(){}

	@Id
	@GeneratedValue
	@Column(name = "doc_documentId")
	private int id;
	public int getId(){return id;}
	public void setId(int id){this.id = id;}
	
	@Column(name = "doc_titre")
	private String titre;
	public void setTitre(String titre){this.titre = titre;}
	public String getTitre(){return titre;}

	@Column(name = "doc_auteur")
	private String auteur;
	public void setAuteur(String auteur){this.auteur = auteur;}
	public String getAuteur(){return auteur;}

	@Column(name = "doc_dateParution")
	private String dateParution;
	public void setDateParution(String dateParution){this.dateParution = dateParution;}
	public String getDateParution(){return dateParution;}

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "Type", cascade = CascadeType.ALL)
	private Type type;
	public Type getType() {return this.type;}
	public void setType(Type type) {this.type = type;}
	
	@OneToMany(mappedBy = "pk.document" , fetch=FetchType.LAZY, cascade=CascadeType.PERSIST)
	private Set<Document> documents = new HashSet<Document>();
	public Set<Document> getDocuments() {return this.documents;}
	public void setDocuments(Set<Document> d) {this.documents = d;}
}
