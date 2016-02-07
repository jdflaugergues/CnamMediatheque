package modeles;
import javax.persistence.*;

@Embeddable
public class ReservationId implements java.io.Serializable {

     /**
      *
      */
     private static final long serialVersionUID = 1L;

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