package Models;

public class Exercicio {
	private int Id;
	private String Nome;
	private String Desricao;
	private TipoExercicio TipoExercicio;
	
	public Exercicio(int id, String nome, String desricao, Models.TipoExercicio tipoExercicio) {
		super();
		Id = id;
		Nome = nome;
		Desricao = desricao;
		TipoExercicio = tipoExercicio;
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
