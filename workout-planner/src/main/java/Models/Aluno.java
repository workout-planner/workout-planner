package Models;

import java.time.LocalDate;

public class Aluno extends Pessoa {
	private String Plano;
	
	public String getPlano() {
		return Plano;
	}

	public void setPlano(String plano) {
		Plano = plano;
	}

	public Aluno(int id, String nome, LocalDate anoNascimento, TipoUsuario tipoUsuario) {
		super(id, nome, anoNascimento, tipoUsuario);
	}

}
