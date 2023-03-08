<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
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
        <div class="row p-3 d-flex justify-content-center">
        	<form method="get" action="DashboardController?ruta=ver" class="col-6">
	        	<div class="input-group">
	        		<label for="" class="input-group-text">Mes</label>
		        	<select name="mes" class="form-control">
			        	<c:forEach items="${meses}" var="mes">
			        		<option value="${mes.id}" ${mes.id== messeleccionado ? 'selected':''} >${mes.nombre}</option>
			        	</c:forEach>
		        	</select>
		        	<input type="submit" value="Generar" class="btn btn-primary"/>
	        	</div>
        	</form>
      
        </div>
        <div class="row">
            <div class="col-lg-2 col-sm-12">
                <h1 class="bg-dark text-white p-2 rounded">Cuentas</h1>
             	
	             	<div class="row">
	             		<c:forEach items="${ingresogastos}" var="cuenta">	                
		                	<div class="col-6 col-lg-12">
		                		<div class="bg-body-secondary text-dark border rounded text-center mt-3 p-2 col-12 shadow-sm">
				                    <h4>${cuenta.nombre}</h4>
				                    <div class="${cuenta.total < 0? 'text-danger': 'text-success'}">${cuenta.total}</div>
				                    <div><a href="GestionarMovimientosController?ruta=listarMovimientos&id=${cuenta.id}&mes=${messeleccionado}">Movimientos</a></div>
		                		</div>
		                	</div>		            
	                	</c:forEach> 
	             	</div>        
            </div>
            <div class="col-lg-10 col-sm-12">
                
                <div class="row">
                <h1 class="bg-dark text-white p-2 rounded">Cuentas INGRESO</h1>
                 	<c:forEach items="${ingresos}" var="cuenta">
			                <div class="col-6 col-lg-4">
			                	<div class="bg-body-secondary text-dark border rounded text-center mt-3 p-1">
			                    	<h4>${cuenta.nombre}</h4>
			                    	<div class="${cuenta.totalcalculado < 0? 'text-danger': 'text-success'}">${cuenta.totalcalculado}</div>
			                    	<div><a href="GestionarMovimientosController?ruta=listarMovimientos&id=${cuenta.id}&mes=${messeleccionado}">Movimientos</a></div>
			                	</div>
			                </div>
			         </c:forEach>
 					<c:choose>
 						<c:when test="${ingresos.size() <= 0}">
 							<div>No existieron ingresos</div>
 						</c:when>
 					</c:choose>
                </div>                           

                <div class="row mt-3">
                <h1 class="bg-dark text-white p-2 rounded">Cuentas EGRESO</h1>
					<c:forEach items="${egresos}" var="cuenta">
						<div class="col-6 col-lg-4">
			            	<div class="bg-body-secondary text-dark border rounded text-center mt-3 p-1">
			                	<h4>${cuenta.nombre}</h4>
			                    <div class="${cuenta.totalcalculado < 0? 'text-danger': 'text-success'}">${cuenta.totalcalculado}</div>
			                    <div><a href="GestionarMovimientosController?ruta=listarMovimientos&id=${cuenta.id}&mes=${messeleccionado}">Movimientos</a></div>
			                </div>
						</div>
					</c:forEach>  
					<c:choose>
 						<c:when test="${egresos.size() <= 0}">
 							<div>No existieron egresos</div>
 						</c:when>
 					</c:choose>               	
       	
                </div>
               
                   
                </div>
            </div>

        </div>
</body>
</html>