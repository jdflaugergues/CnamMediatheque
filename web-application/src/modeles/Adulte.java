package modeles;

import javax.persistence.*;

@Entity
@Table(name = "Adulte")
@PrimaryKeyJoinColumn(name="abo_abonneId")
public class Adulte extends Abonne{
	
	//public Adulte(){}
}
