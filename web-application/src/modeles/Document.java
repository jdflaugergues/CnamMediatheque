package modeles;

import java.util.HashSet;
import java.util.Set;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

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

	@Column(name = "doc_dateParution")
	private String dateParution;
	public void setDateParution(String dateParution){this.dateParution = dateParution;}
	public String getDateParution(){return dateParution;}

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name="doc_typ_typeId")
	private Type type;
	public Type getType() {return this.type;}
	public void setType(Type type) {this.type = type;}
	
	@OneToMany(mappedBy = "pk.document" , fetch=FetchType.LAZY, cascade=CascadeType.PERSIST)
	private Set<Reservation> reservations = new HashSet<Reservation>();
	public Set<Reservation> getReservations() {return this.reservations;}
	public void setReservations(Set<Reservation> reservations) {this.reservations = reservations;}
	
	/**
	 * Récupère l'abonné qui a réservé le document.
	 * @return l'abonné qui a réservé; null si aucun
	 */
	public Abonne getReserver(){
		
		Abonne reserver = null;
		for (Reservation r : getReservations()){
			
			if (r.getRetour() == null){
				reserver = r.getAbonne();
			}
		}
		return reserver;
	}
	
	@Override
	public int hashCode() {
	    HashCodeBuilder hcb = new HashCodeBuilder();
	    hcb.append(this.id);
	    return hcb.toHashCode();
	}
	
	@Override
	public boolean equals(Object obj) {
	    if (this == obj) {
	        return true;
	    }
	    if (!(obj instanceof Document)) {
	        return false;
	    }
	    Document autre = (Document) obj;
	    EqualsBuilder eb = new EqualsBuilder();
	    eb.append(id, autre.id);
	    return eb.isEquals();
	}
}
