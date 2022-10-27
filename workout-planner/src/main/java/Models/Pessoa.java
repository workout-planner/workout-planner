package Models;

import java.time.LocalDate;

public class Pessoa {
	private int Id;
	private String Nome;
	private LocalDate AnoNascimento;
	
	public Pessoa(int id, String nome, LocalDate anoNascimento, Models.TipoUsuario tipoUsuario) {
		super();
		Id = id;
		Nome = nome;
		AnoNascimento = anoNascimento;
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

	public LocalDate getAnoNascimento() {
		return AnoNascimento;
	}

	public void setAnoNascimento(LocalDate anoNascimento) {
		AnoNascimento = anoNascimento;
	}
}
