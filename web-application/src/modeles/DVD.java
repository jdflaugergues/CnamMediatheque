package modeles;

import javax.persistence.*;

@Entity
@Table(name = "DVD")
@PrimaryKeyJoinColumn(name="doc_documentId")
public class DVD {
	
	public DVD(){}

	@Column(name = "dvd_genre")
	private String genre;
	public void setGenre(String genre){this.genre = genre;}
	public String getGenre(){return genre;}
}
