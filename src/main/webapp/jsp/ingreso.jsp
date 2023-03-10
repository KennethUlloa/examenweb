<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ingreso</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1 class="bg-black text-white p-3 mb-0">Contabilidad Personal</h1>
        <div class="bg-body-secondary pt-2 pb-1 ps-2 d-flex flex-row justify-content-center">
            <ul class="list-inline">
                <li class="list-inline-item"><a href="GestionarMovimientosController?ruta=crearIngreso" class="btn btn-primary">Ingreso</a></li>
                <li class="list-inline-item"><a href="GestionarMovimientosController?ruta=crearEgreso" class="btn btn-primary">Egreso</a></li>
                <li class="list-inline-item"><a href="" class="btn btn-primary">Transferencia</a></li>
                <li class="list-inline-item"><a href="DashboardController" class="btn btn-primary">Dashboard</a></li>
            </ul>
        </div>

        <div>
            <h1>Registro de Ingreso ($$)</h1>
            <form action="GestionarMovimientosController?ruta=guardarIngreso" method="post">
                <fieldset class="d-flex flex-column">
                    <div class="input-group mb-3">
                    	<label class="input-group-text">Categoria Ingreso</label>
	                    <select name="cuentaOrigen" class="form-select">
		                    <c:forEach items="${cuentasIngreso}" var="cuenta">
		                    	<option value="${cuenta.id}">${cuenta.nombre}</option>
		                    </c:forEach>
	                    </select>
                    </div>
                    <div class="input-group mb-3">
	                    <label class="input-group-text">Concepto</label>
	                    <input type="text" name="concepto" class="form-control" placeholder="Ej: Pago de n?mina, bonos..." required>
                    </div>
                    <div class="input-group mb-3">
                    	<label class="input-group-text">Fecha</label>
                    	<input type="date" name="fecha" value="${fechaActual}" class="form-control" required>
                    </div>
                    <div class="input-group mb-3">
                    	<label class="input-group-text">Valor</label>
                    	 <span class="input-group-text">$</span>
                    	<input type="number" name="valor" min="0" step="0.01" class="form-control" placeholder="Ej: 1000.50, 20.25, 200.00" required>
                    </div>
                    
                    <div class="input-group mb-3">
                    	<label class="input-group-text">Cuenta acreditada</label>
	                    <select name="cuentaDestino" class="form-select">
		                    <c:forEach items="${cuentasIngresoEgreso}" var="cuenta">
		                    	<option value="${cuenta.id}">${cuenta.nombre}</option>
		                    </c:forEach>
	                    </select>
                    </div>
                    <input type="submit" value="Guardar" class="btn btn-primary">
                </fieldset>
            </form>
        </div>
    </div>
</body>
</html>