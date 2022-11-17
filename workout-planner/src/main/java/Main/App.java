package Main;

import java.time.LocalDate;

import Dao.Dao;
import Models.Aluno;
import Models.Exercicio;
import Models.ItensPlanilha;
import Models.Personal;
import Models.PlanilhaExercicio;
import Models.TipoExercicio;

public class App {

	public static void main(String[] args) {
		Aluno aluno = new Aluno();
		aluno.setNome("Gustavo");
		aluno.setPlano("Hipertrofia");
		aluno.setMatricula("232133");
		aluno.setDataNascimento(LocalDate.now());
		
		Personal personal = new Personal();
		personal.setNome("Lucas");
		personal.setDataNascimento(LocalDate.now());
		personal.setArea("Academia");
		personal.setCBO(23132133);
		
		Exercicio exercicio = new Exercicio();
		exercicio.setNome("Supino");
		exercicio.setDesricao("Deite no banco reto e levante a barra");
		exercicio.setTipoExercicio(TipoExercicio.Peito);
		
		PlanilhaExercicio planilhaExercicio = new PlanilhaExercicio();
		planilhaExercicio.setAluno(aluno);
		planilhaExercicio.setPersonal(personal);
		planilhaExercicio.setDataInicio(LocalDate.now());
		planilhaExercicio.setDataFim(LocalDate.now());
		
		ItensPlanilha itensPlanilha = new ItensPlanilha();
		itensPlanilha.setRepeticoes(4);
		itensPlanilha.setSeries(3);
		itensPlanilha.setTempoDescanso(30);
		itensPlanilha.setExercicio(exercicio);
		itensPlanilha.setPlanilhaExercicio(planilhaExercicio);
		
		Dao<Aluno, Integer> daoAluno = new Dao();
		Dao<Personal, Integer> daoPersonal = new Dao();
		Dao<Exercicio, Integer> daoExercicio = new Dao();
		Dao<PlanilhaExercicio, Integer> daoPlanilhaExercicio = new Dao();
		Dao<ItensPlanilha, Integer> daoItensItensPlanilha = new Dao();
		
		daoAluno.save(aluno);
		daoPersonal.save(personal);
		daoExercicio.save(exercicio);
		daoPlanilhaExercicio.save(planilhaExercicio);
		daoItensItensPlanilha.save(itensPlanilha);
		
	}

}
