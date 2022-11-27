package Repository;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Dao.Dao;
import Dao.JpaUtil;
import Models.Personal;
import Models.Pessoa;

public class PersonalRepository extends Dao<Pessoa, Integer>
{
	public Pessoa getForCbo(int CBO, String senha) {
		Pessoa usuario;
		try {
			TypedQuery<Pessoa> query = em.createQuery("SELECT e FROM Pessoa e WHERE e.CBO = ?1 and e.Senha = ?2", Pessoa.class);
			query.setParameter(1, CBO);
			query.setParameter(2, senha);
			
			usuario = query.getSingleResult();
		} catch (Exception e) {
			usuario = null;
		}
		
		return usuario;
	}
	
	public Pessoa buscarPorCbo(int CBO) {
		Pessoa usuario;
		try {
			TypedQuery<Pessoa> query = em.createQuery("SELECT e FROM Pessoa e WHERE e.CBO = ?1", Pessoa.class);
			query.setParameter(1, CBO);
			
			usuario = query.getSingleResult();
		} catch (Exception e) {
			usuario = null;
		}
		
		return usuario;
	}
	
	public Pessoa buscarPorId(int id) {
		Pessoa personal;
		try {
			TypedQuery<Pessoa> query = em.createQuery("SELECT e FROM Pessoa e WHERE e.Id = ?1", Pessoa.class);
			query.setParameter(1, id);
			
			personal = query.getSingleResult();
		} catch (Exception e) {
			personal = null;
		}
		
		return personal;
	}

}