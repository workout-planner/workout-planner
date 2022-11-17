package Models;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;


@Entity
@DiscriminatorValue("PERSONAL")
public class Personal extends Pessoa{

	public Personal() {
		
	}
	
	
	@Column(length = 10, unique = true)
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
