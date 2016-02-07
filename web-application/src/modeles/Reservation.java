package modeles;
import javax.persistence.*;

@Entity
@Table(name = "Reservation")
public class Reservation {
	
	public Reservation(){}

	@Id
	ReservationId pk;
	public ReservationId getPk() {return pk;}
	public void setPk(ReservationId pk) {this.pk = pk;}

	@Column(name="res_date")
	private String date;
	public String getDate() {return this.date;}
	public void setDate(String date) {this.date= date;}

	public Abonne getAbonne() {return getPk().getAbonne();}
	public void setAbonne(Abonne a) {getPk().setAbonne(a);}
	
	public Document getDocument() {return getPk().getDocument();}
	public void setDocument(Document d) {getPk().setDocument(d);}

}
