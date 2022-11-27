package Repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import Dao.Dao;
import Models.ItensPlanilha;
import Models.PlanilhaExercicio;

public class ItensPlanilhaRepository extends Dao<ItensPlanilha, Integer>{
	public List<ItensPlanilha> BuscarPorPlanilha(PlanilhaExercicio planilha)
	{
		List<ItensPlanilha> itensPlanilha = new ArrayList<ItensPlanilha>();
		try {
			TypedQuery<ItensPlanilha> query = em.createQuery("SELECT e FROM ItensPlanilha e WHERE e.PlanilhaExercicio = ?1", ItensPlanilha.class);
			query.setParameter(1, planilha);
			
			itensPlanilha = query.getResultList();
		} catch (Exception e) {
			itensPlanilha = null;
		}
		
		return itensPlanilha;
	}
}
