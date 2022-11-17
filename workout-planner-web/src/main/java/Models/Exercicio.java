package Models;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Exercicio {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	
	private String Nome;
	
	private String Desricao;
	
	@Enumerated(EnumType.STRING)
	private TipoExercicio TipoExercicio;
	
	public Exercicio() {
		
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getNome() {
		return Nome;
	}

	public void setNome(String nome) {
		Nome = nome;
	}

	public String getDesricao() {
		return Desricao;
	}

	public void setDesricao(String desricao) {
		Desricao = desricao;
	}

	public TipoExercicio getTipoExercicio() {
		return TipoExercicio;
	}

	public void setTipoExercicio(TipoExercicio tipoExercicio) {
		TipoExercicio = tipoExercicio;
	}
	
	
}
