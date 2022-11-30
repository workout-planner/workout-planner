package Models;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class PlanilhaExercicio {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	
	private String NomeTabela;
	public String getNomeTabela() {
		return NomeTabela;
	}

	public void setNomeTabela(String nomeTabela) {
		NomeTabela = nomeTabela;
	}

	private LocalDate DataInicio;
	
	private LocalDate DataFim;
	
	@ManyToOne
	private Aluno Aluno;

	public Aluno getAluno() {
		return Aluno;
	}

	public void setAluno(Aluno aluno) {
		Aluno = aluno;
	}

	public Personal getPersonal() {
		return Personal;
	}

	public void setPersonal(Personal personal) {
		Personal = personal;
	}

	@ManyToOne
	private Personal Personal;
	
	public PlanilhaExercicio() {
		
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public LocalDate getDataInicio() {
		return DataInicio;
	}

	public void setDataInicio(LocalDate dataInicio) {
		DataInicio = dataInicio;
	}

	public LocalDate getDataFim() {
		return DataFim;
	}

	public void setDataFim(LocalDate dataFim) {
		DataFim = dataFim;
	}
}
