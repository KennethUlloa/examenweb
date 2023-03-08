package modelo.dto;

import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;

import modelo.entidades.Movimiento;

public class MovimientoDTO {
	private int id;
	private String origen;
	private String destino;
	private String concepto;
	private double valor;
	private String fecha;
	
	public MovimientoDTO(int id, String origen, String destino, String concepto, double valor, String fecha) {
		super();
		this.id = id;
		this.origen = origen;
		this.destino = destino;
		this.concepto = concepto;
		this.valor = valor;
		this.fecha = fecha;
	}
	
	public MovimientoDTO(Movimiento m) {
		super();
		this.id = m.getId();
		this.origen = m.getOrigen().getNombre();
		this.destino = m.getDestino().getNombre();
		this.concepto = m.getConcepto();
		this.valor = m.getValor();
		this.fecha = new SimpleDateFormat("yyyy-MM-dd").format(m.getFecha());
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrigen() {
		return origen;
	}

	public void setOrigen(String origen) {
		this.origen = origen;
	}

	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}

	public String getConcepto() {
		return concepto;
	}

	public void setConcepto(String concepto) {
		this.concepto = concepto;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
}
