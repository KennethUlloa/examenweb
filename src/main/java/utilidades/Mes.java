package utilidades;

import java.util.ArrayList;
import java.util.List;

public class Mes {
	private int id;
	private String nombre;
	
	public Mes() {}

	public Mes(int id, String nombre) {
		super();
		this.id = id;
		this.nombre = nombre;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public static List<Mes> getMeses() {
		List<Mes> meses = new ArrayList<Mes>();
		meses.add(new Mes(1, "Enero"));
		meses.add(new Mes(2, "Febrero"));
		meses.add(new Mes(3, "Marzo"));
		meses.add(new Mes(4, "Abril"));
		meses.add(new Mes(5, "Mayo"));
		meses.add(new Mes(6, "Junio"));
		meses.add(new Mes(7, "Julio"));
		meses.add(new Mes(8, "Agosto"));
		meses.add(new Mes(9, "Septiembre"));
		meses.add(new Mes(10, "Octubre"));
		meses.add(new Mes(11, "Noviembre"));
		meses.add(new Mes(12, "Diciembre"));
		return meses;
	}
}
