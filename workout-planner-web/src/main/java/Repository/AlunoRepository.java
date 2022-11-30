package Repository;

import java.util.List;

import javax.persistence.TypedQuery;

import Dao.Dao;
import Models.Aluno;
import Models.Pessoa;

public class AlunoRepository extends Dao<Pessoa, Integer>{
	public Pessoa getForMatricula(String matricula, String senha) {
		Pessoa usuario;
		try {
			TypedQuery<Pessoa> query = em.createQuery("SELECT e FROM Pessoa e WHERE e.matricula = ?1 and e.Senha = ?2", Pessoa.class);
			query.setParameter(1, matricula);
			query.setParameter(2, senha);
			
			usuario = query.getSingleResult();
		} catch (Exception e) {
			usuario = null;
		}
		
		return usuario;
	}
	
	public Pessoa buscarPorMatricula(String matricula) {
		Pessoa usuario;
		try {
			TypedQuery<Pessoa> query = em.createQuery("SELECT e FROM Pessoa e WHERE e.matricula = ?1", Pessoa.class);
			query.setParameter(1, matricula);
			
			usuario = query.getSingleResult();
		} catch (Exception e) {
			usuario = null;
		}
		
		return usuario;
	}
	
	public Pessoa buscarPorId(int id) {
		Pessoa aluno;
		try {
			TypedQuery<Pessoa> query = em.createQuery("SELECT e FROM Pessoa e WHERE e.Id = ?1", Pessoa.class);
			query.setParameter(1, id);
			
			aluno = query.getSingleResult();
		} catch (Exception e) {
			aluno = null;
		}
		
		return aluno;
	}
	
	public List<Pessoa> buscarAll() {
		List<Pessoa> list;
		try {
			TypedQuery<Pessoa> query = em.createQuery("SELECT e FROM Pessoa e WHERE e.matricula != null", Pessoa.class);
			
			list = query.getResultList();
		} catch (Exception e) {
			list = null;
		}
		
		return list;
	}
}
