package Models;

import java.time.LocalDate;

public class PlanilhaExercicio {
	public int Id;
	public LocalDate DataInicio;
	private LocalDate DataFim;
	
	public PlanilhaExercicio(int id, LocalDate dataInicio, LocalDate dataFim) {
		super();
		Id = id;
		DataInicio = dataInicio;
		DataFim = dataFim;
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
