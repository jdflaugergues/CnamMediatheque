package modeles;

import javax.persistence.*;

@Entity
@Table(name = "DVD")
@PrimaryKeyJoinColumn(name="doc_documentId")
public class DVD extends Document{
	
	public DVD(){}

	@Column(name = "dvd_genre")
	private String genre;
	public void setGenre(String genre){this.genre = genre;}
	public String getGenre(){return genre;}
	
	@Column(name = "dvd_realisateur")
	private String realisateur;
	public void setRealisateur(String realisateur){this.realisateur = realisateur;}
	public String getRealisateur(){return realisateur;}
	
	@Column(name = "dvd_duree")
	private int duree;
	public void setDuree(int duree){this.duree = duree;}
	public int getDuree(){return duree;}
}
