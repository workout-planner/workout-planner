package Models;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;


@Entity
@DiscriminatorValue("ALUNO")
public class Aluno extends Pessoa {
	private String Plano;
	
	@Column(length = 10, unique = true)
	private String matricula;
	
	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getPlano() {
		return Plano;
	}

	public void setPlano(String plano) {
		Plano = plano;
	}

	public Aluno() {
		
	}

}
