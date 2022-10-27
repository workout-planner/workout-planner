package Models;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

public class PlanilhaExercicio {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int Id;
	
	
	public LocalDate DataInicio;
	
	private LocalDate DataFim;
	
	
	
	List<ItensPlanilha> ItensPlanilha;
	
	@OneToMany
	private Aluno Aluno;
	
	@OneToMany
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
