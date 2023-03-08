package modelo.jpa;

import java.util.List;

import javax.persistence.TypedQuery;

import modelo.dao.MovimientoDAO;
import modelo.dto.MovimientoDTO;
import modelo.entidades.Movimiento;

public class JPAMovimientoDAO extends JPAGenericDAO<Movimiento, Integer> implements MovimientoDAO {

	public JPAMovimientoDAO() {
		super(Movimiento.class);
	}
	
	@Override
	public List<MovimientoDTO> getMovimientosDeCuenta(int id, int mes) {
		String JPQL = "SELECT new modelo.dto.MovimientoDTO(m) FROM Movimiento m WHERE (m.origen.id=:id OR m.destino.id=:id) AND FUNC('MONTH', m.fecha)=:mes";
		TypedQuery<MovimientoDTO> query = em.createQuery(JPQL, MovimientoDTO.class);
		query.setParameter("id",id);
		query.setParameter("mes", mes);
		return query.getResultList();
	}

}
