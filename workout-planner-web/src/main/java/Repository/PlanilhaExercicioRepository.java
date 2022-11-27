package Repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import Dao.Dao;
import Models.Aluno;
import Models.Personal;
import Models.PlanilhaExercicio;

public class PlanilhaExercicioRepository extends Dao<PlanilhaExercicio, Integer> {
	public List<PlanilhaExercicio> buscarPlanilhasUsuario(Aluno aluno)
	{
		List<PlanilhaExercicio> planilhas = new ArrayList<PlanilhaExercicio>();
		try {
			TypedQuery<PlanilhaExercicio> query = em.createQuery("SELECT e FROM PlanilhaExercicio e WHERE e.Aluno = ?1", PlanilhaExercicio.class);
			query.setParameter(1, aluno);
			
			planilhas = query.getResultList();
		} catch (Exception e) {
			planilhas = null;
		}
		
		return planilhas;
	}
	
	public List<PlanilhaExercicio> buscarPlanilhasPorPersonal(Personal personal)
	{
		List<PlanilhaExercicio> planilhas = new ArrayList<PlanilhaExercicio>();
		try {
			TypedQuery<PlanilhaExercicio> query = em.createQuery("SELECT e FROM PlanilhaExercicio e WHERE e.Personal = ?1", PlanilhaExercicio.class);
			query.setParameter(1, personal);
			
			planilhas = query.getResultList();
		} catch (Exception e) {
			planilhas = null;
		}
		
		return planilhas;
	}
}
