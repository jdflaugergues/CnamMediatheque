package modeles;
import javax.persistence.*;

@Entity
@Table(name = "Emprunt")
public class Emprunt {
	
	public Emprunt(){}

	@Id
	EmpruntId pk;
	public EmpruntId getPk() {return pk;}
	public void setPk(EmpruntId pk) {this.pk = pk;}

	@Column(name="emp_qttMax")
	private int qttMax;
	public int getQttMax() {return this.qttMax;}
	public void setQttMax(int qttMax) {this.qttMax= qttMax;}
	
	@Column(name="emp_duree")
	private int duree;
	public int getDuree() {return this.duree;}
	public void setDuree(int duree) {this.duree= duree;}


	public Categorie getCategorie() {return getPk().getCategorie();}
	public void setCategorie(Categorie c) {getPk().setCategorie(c);}
	
	public Type getType() {return getPk().getType();}
	public void setType(Type t) {getPk().setType(t);}

}
