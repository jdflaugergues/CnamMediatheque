package modeles;
import javax.persistence.*;

@Embeddable
public class EmpruntId implements java.io.Serializable {

     /**
      *
      */
     private static final long serialVersionUID = 1L;

     @ManyToOne (fetch=FetchType.LAZY)
     @JoinColumn(name = "emp_cat_categorieId")
     private Categorie categorie;
     public Categorie getCategorie() {return categorie;}
     public void setCategorie(Categorie categorie) {this.categorie = categorie;}

     @ManyToOne (fetch=FetchType.LAZY)
     @JoinColumn(name = "emp_typ_typeId")
     private Type type;
     public Type getType() {return type;}
     public void setType(Type type) {this.type = type;}
}