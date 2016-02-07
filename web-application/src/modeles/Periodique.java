package modeles;

import javax.persistence.*;

@Entity
@Table(name = "Periodique")
@PrimaryKeyJoinColumn(name="doc_documentId")
public class Periodique {
	
	public Periodique(){}

	@Column(name = "per_numero")
	private int numero;
	public void setNumero(int numero){this.numero = numero;}
	public int getNumero(){return numero;}
}
