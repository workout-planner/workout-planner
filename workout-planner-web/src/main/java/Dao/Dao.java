package Dao;
import java.util.List;
import java.util.Optional;
import java.util.function.Consumer;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
public class Dao<T, ID> {

	private EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();

	public void save(T entity) {
		executeInsideTransaction(em -> em.persist(entity));
	}

	public void update(T entity) {
		executeInsideTransaction(em -> em.merge(entity));
	}

	public void delete(T entity) {
		executeInsideTransaction(em -> em.remove(entity));
	}

	public Optional<T> findById(Class<T> clazz, ID id) {
		return Optional.ofNullable(em.find(clazz, id));
	}

	public List<T> findAll(Class<T> clazz) {
		return em.createQuery("from " + clazz.getName()).getResultList();
	}

	private void executeInsideTransaction(Consumer<EntityManager> action) {
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
			action.accept(em);
			tx.commit();
		} catch (RuntimeException e) {
			tx.rollback();
			throw e;
		}
	}

}
