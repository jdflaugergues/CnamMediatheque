package modeles;
import javax.persistence.*;

import hibernate.Action;

import java.util.Calendar;
import java.util.Date;

@Entity
@Table(name = "Reservation")
public class Reservation {
	
	public Reservation(){}

	@Id
	ReservationId pk;
	public ReservationId getPk() {return pk;}
	public void setPk(ReservationId pk) {this.pk = pk;}

	/**
	 * Date à laquelle le document a été rendu.
	 * null si non rendu
	 */
	@Column(name="res_retour")
	private Date retour;
	public Date getRetour() {return this.retour;}
	public void setRetour(Date retour) {this.retour= retour;}

	public Abonne getAbonne() {return getPk().getAbonne();}
	public void setAbonne(Abonne a) {if (pk == null){this.pk = new ReservationId();}getPk().setAbonne(a);}
	
	public Document getDocument() {return getPk().getDocument();}
	public void setDocument(Document d) {if (pk == null){this.pk = new ReservationId();} getPk().setDocument(d);}
	
	public Date getDate() {return getPk().getDate();}
	public void setDate(Date date) {if (pk == null){this.pk = new ReservationId();} getPk().setDate(date);}

	/**
	 * Récupère la date limite à laquelle l'abonné peut emprunter le document.
	 * @return
	 */
	public Date getDeadline(){
		
		int type = this.getDocument().getType().getId();
		int categorie = this.getAbonne().getCategorie().getId();
		
		Emprunt emprunt = Action.getEmprunt(type, categorie);
		
		Calendar c = Calendar.getInstance();    
		c.setTime(this.getDate());
		c.add(Calendar.DATE, emprunt.getDuree());
		return c.getTime();
	}
	
}
