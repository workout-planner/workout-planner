<%@page import="Models.TipoExercicio"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro Exercicio</title>
<!-- CSS only -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
	<div class="h-100 d-flex align-items-center justify-content-center">
		<form class="col-md-4 col-md-offset-4" action="controllerServelet" method="post">
			<h1 class="text-center"> Cadastro Exercicio</h1>
			
			<div class="form-outline mb-4">
				<label class="form-label">Nome</label>
				<input type="text" name="nome" class="form-control"/>
			</div>
			
			<div class="form-outline mb-4">
				<label class="form-label">Descricao</label>
				<input type="text" name="descricao" class="form-control"/>
			</div>
			<div class="form-outline mb-4">
				<label class="form-label">TipoExercicio</label>
				<select class="form-select" name="tipoExercicio" id="tipoExercicio">
				<%
				    for (TipoExercicio exercicio : TipoExercicio.values()) {
				%>
				  <option value="<%= exercicio %>"><%=exercicio%></option>
				<%
				    }
				%>
				</select>
			</div>
			<button type="submit" class="btn btn-primary btn-block w-100">Salvar</button>			
		</form>
	</div>
</body>
</html>