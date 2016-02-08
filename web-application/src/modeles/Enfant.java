package modeles;

import javax.persistence.*;

@Entity
@Table(name = "Enfant")
@PrimaryKeyJoinColumn(name="abo_abonneId")
public class Enfant extends Abonne{
	
	public Enfant(){}
}
