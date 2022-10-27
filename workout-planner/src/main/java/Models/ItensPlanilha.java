package Models;

public class ItensPlanilha {
	private int Id;
	private double TempoDescanso;
	private int Repeticoes;
	private int Series;
	
	public ItensPlanilha(int id, double tempoDescanso, int repeticoes, int series) {
		super();
		Id = id;
		TempoDescanso = tempoDescanso;
		Repeticoes = repeticoes;
		Series = series;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public double getTempoDescanso() {
		return TempoDescanso;
	}

	public void setTempoDescanso(double tempoDescanso) {
		TempoDescanso = tempoDescanso;
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
