package controlador;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.dao.DAOFactory;
import modelo.entidades.Cuenta;
import modelo.entidades.CuentaTipo;
import modelo.entidades.Movimiento;
import utilidades.DateConverter;

@WebServlet("/GastosController")
public class GastosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GastosController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rutear(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rutear(request, response);
	}
	
	private void rutear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ruta = (request.getParameter("ruta") == null) ? "nuevoGasto" : request.getParameter("ruta");
		switch(ruta) {
		case "nuevoGasto": 
			mostrarPantalla(request, response);
			break;
		case "guardarGasto":
			guardarGasto(request, response);
			break;
		}
	}

	private void guardarGasto(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//Parametros
		int idCuentaOrigen = Integer.parseInt(request.getParameter("cuentaOrigen"));
		int idCuentaDestino = Integer.parseInt(request.getParameter("cuentaDestino"));
		double valor = Double.parseDouble(request.getParameter("valor"));
		LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
		String concepto = request.getParameter("concepto");
		//Modelo
		Cuenta cuentaDestino = DAOFactory.getFactory().getCuentaDAO().getById(idCuentaDestino);
		Cuenta cuentaOrigen = DAOFactory.getFactory().getCuentaDAO().getById(idCuentaOrigen);
		cuentaDestino.setTotal(cuentaDestino.getTotal() - valor);
		cuentaOrigen.setTotal(cuentaOrigen.getTotal() - valor);
		DAOFactory.getFactory().getMovimientoDAO().create(new Movimiento(concepto, valor, DateConverter.asDate(fecha), cuentaOrigen, cuentaDestino));
		DAOFactory.getFactory().getCuentaDAO().update(cuentaOrigen);
		DAOFactory.getFactory().getCuentaDAO().update(cuentaDestino);
		//Vista
		response.sendRedirect("DashboardController");
		
	}

	private void mostrarPantalla(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Cuenta> cuentasEgreso = DAOFactory.getFactory().getCuentaDAO().getByType(CuentaTipo.GASTO);
		List<Cuenta> cuentasIngresoGasto = DAOFactory.getFactory().getCuentaDAO().getByType(CuentaTipo.INGRESOGASTO);
		
		request.setAttribute("cuentasEgreso", cuentasEgreso);
		request.setAttribute("cuentasIngresoEgreso", cuentasIngresoGasto);
		request.setAttribute("fechaActual", LocalDate.now().toString());
		request.getRequestDispatcher("jsp/egreso.jsp").forward(request, response);
		
	}

}
