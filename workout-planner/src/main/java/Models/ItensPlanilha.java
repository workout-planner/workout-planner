package Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class ItensPlanilha {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	
	
	
	private int TempoDescanso;
	private int Repeticoes;
	private int Series;
	
	public ItensPlanilha() {
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
