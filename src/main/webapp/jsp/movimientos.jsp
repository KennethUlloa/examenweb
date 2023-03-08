<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movimientos</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<style>
	.action-a {
		color: white !important;
	}
</style>
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
        <h1>Movimientos de la cuenta ${cuenta.nombre} en ${mes}</h1>
        
        ${movimientos.size() <= 0 ? '<p>Sin movimientos</p>' : ''}
        
        <table class="col-12 table table-striped ${movimientos.size() <= 0 ? 'd-none' : ''}">
        	<thead class="table-dark">
        		<tr>
	        		<th scope="col">Id</th>
	        		<th scope="col">Cuenta origen</th>
	        		<th scope="col">Cuenta destino</th>
	        		<th scope="col">Concepto</th>
	        		<th scope="col">Valor</th>
        			<th>Fecha</th>
        	</tr>
        	</thead>
        	
        	<c:forEach items="${movimientos}" var ="mov">
        		<tr>
	        		<td>${mov.id}</td>
	        		<td>${mov.origen}</td>
	        		<td>${mov.destino}</td>
	        		<td>${mov.concepto}</td>
	        		<td>${mov.valor}</td>
	        		<td>${mov.fecha}</td>
        		</tr>
        	</c:forEach>
        </table>
    </div>
</body>
</html>