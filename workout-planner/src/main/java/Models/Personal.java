package Models;

import java.time.LocalDate;

public class Personal extends Pessoa{

	public Personal(int id, String nome, LocalDate anoNascimento, TipoUsuario tipoUsuario) {
		super(id, nome, anoNascimento, tipoUsuario);
		// TODO Auto-generated constructor stub
	}
	private int CBO;
	private String Area;
	public int getCBO() {
		return CBO;
	}
	public void setCBO(int cBO) {
		CBO = cBO;
	}
	public String getArea() {
		return Area;
	}
	public void setArea(String area) {
		Area = area;
	}
}
