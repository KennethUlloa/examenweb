package Test;

import java.util.List;

import modelo.dao.DAOFactory;
import modelo.entidades.Cuenta;
import modelo.entidades.CuentaTipo;
import modelo.entidades.Movimiento;

public class TestEntityManager {

	public static void main(String[] args) {
		/*Cuenta cuentaPichincha = new Cuenta();
		cuentaPichincha.setNombre("PICHINCHA");
		cuentaPichincha.setTipo(CuentaTipo.INGRESOGASTO);
		cuentaPichincha.setTotal(0);
		
		DAOFactory.getFactory().getCuentaDAO().create(cuentaPichincha);
		Cuenta c = DAOFactory.getFactory().getCuentaDAO().getById(1);
		Cuenta c2 = DAOFactory.getFactory().getCuentaDAO().getById(2);
		double valor = 1000;
		Movimiento m = new Movimiento();
		m.setOrigen(c2);
		m.setDestino(c);
		m.setValor(valor);
		m.setConcepto("Pago Nómina");
		
		c.setTotal(c.getTotal() + valor);
		
		DAOFactory.getFactory().getMovimientoDAO().create(m);
		DAOFactory.getFactory().getCuentaDAO().update(c);
		List<?> mov = DAOFactory.getFactory().getMovimientoDAO().getMovimientosDeCuenta(1, 3);
		System.out.println(mov);*/
		
		Cuenta c = new Cuenta();
		c.setNombre("NÓMINA");
		c.setTipo(CuentaTipo.INGRESO);
		c.setTotal(0);
		
		Cuenta c1 = new Cuenta();
		c1.setNombre("EFECTIVO");
		c1.setTipo(CuentaTipo.INGRESOGASTO);
		c1.setTotal(0);
		
		Cuenta c2 = new Cuenta();
		c2.setNombre("UNIVERSIDAD");
		c2.setTipo(CuentaTipo.GASTO);
		c2.setTotal(0);
		
		DAOFactory.getFactory().getCuentaDAO().create(c);
		DAOFactory.getFactory().getCuentaDAO().create(c1);
		DAOFactory.getFactory().getCuentaDAO().create(c2);
		
		
	}
		
		;

}
