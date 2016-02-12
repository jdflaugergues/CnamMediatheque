package modeles;
import java.util.Date;

import javax.persistence.*;

@Embeddable
public class ReservationId implements java.io.Serializable {

     /**
      *
      */
     private static final long serialVersionUID = 1L;
     
     public ReservationId(){}
     
     public ReservationId(Abonne abonne, Document document, Date date){
    	 this.abonne = abonne;
    	 this.document = document;
    	 this.date = date;
     }
     
	 /**
	  * Date à laquelle le document a été réservé
	  */
	 @Column(name="res_date")
	 private Date date;
	 public Date getDate() {return this.date;}
	 public void setDate(Date date) {this.date= date;}
 	
     @ManyToOne
     @JoinColumn(name = "res_abo_abonneId")
     private Abonne abonne;
     public Abonne getAbonne() {return abonne;}
     public void setAbonne(Abonne a) {this.abonne = a;}

     @ManyToOne
     @JoinColumn(name = "res_doc_documentId")
     private Document document;
     public Document getDocument() {return document;}
     public void setDocument(Document d) {this.document = d;}
}