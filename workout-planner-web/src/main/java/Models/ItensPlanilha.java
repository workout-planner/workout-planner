package Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class ItensPlanilha {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	
	@ManyToOne
	private Exercicio Exercicio;
	
	public Exercicio getExercicio() {
		return Exercicio;
	}

	public void setExercicio(Exercicio exercicio) {
		Exercicio = exercicio;
	}

	public PlanilhaExercicio getPlanilhaExercicio() {
		return PlanilhaExercicio;
	}

	public void setPlanilhaExercicio(PlanilhaExercicio planilhaExercicio) {
		PlanilhaExercicio = planilhaExercicio;
	}

	@ManyToOne
	private PlanilhaExercicio PlanilhaExercicio;
	
	private int TempoDescanso;
	private int Repeticoes;
	private int Series;
	
	public ItensPlanilha() {
		
	}
	
	public int getTempoDescanso() {
		return TempoDescanso;
	}

	public void setTempoDescanso(int tempoDescanso) {
		TempoDescanso = tempoDescanso;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public int getRepeticoes() {
		return Repeticoes;
	}

	public void setRepeticoes(int repeticoes) {
		Repeticoes = repeticoes;
	}

	public int getSeries() {
		return Series;
	}

	public void setSeries(int series) {
		Series = series;
	}
}
