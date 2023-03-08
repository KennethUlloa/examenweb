package modelo.dao;

import java.util.List;

import modelo.dto.MovimientoDTO;
import modelo.entidades.Movimiento;

public interface MovimientoDAO extends GenericDAO<Movimiento, Integer> {
	public List<MovimientoDTO> getMovimientosDeCuenta(int id, int mes);
}
