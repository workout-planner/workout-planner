<%@page import="Models.TipoExercicio"%>
<%@page import="Models.Exercicio"%>
<%@page import="Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar exercicio</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<%
	int exercicioId = Integer.parseInt(request.getParameter("id"));
	Dao<Exercicio, Integer> daoExercicio = new Dao<Exercicio, Integer>();
	Exercicio exercicio = daoExercicio.findById(Exercicio.class, exercicioId).get();
%>
	<div  class="h-100 d-flex align-items-center justify-content-center">
		<form class="col-md-4 col-md-offset-4" action="ExercicioServelet" method="post">
			<h1 class="text-center"> Editar Exercicio</h1>
			<input type="hidden" name="exercicioId" value="<%= exercicioId %>">
			<div class="form-outline mb-4">
				<label class="form-label">Nome</label>
				<input class="form-control" type="text" name="nome" value="<%= exercicio.getNome() %>"/>
			</div>
			<div class="form-outline mb-4">
				<label class="form-label">Descricao</label>
				<input class="form-control" type="text" name="descricao" value="<%= exercicio.getDesricao() %>"/>
			</div>
			<div class="form-outline mb-4">
				<label class="form-label">TipoExercicio</label>
				<select class="form-select" name="tipoExercicio" id="tipoExercicio">
				<%
				    for (TipoExercicio exercicioTipo : TipoExercicio.values()) {
				%>
				  <option value="<%= exercicioTipo %>"><%=exercicioTipo%></option>
				<%
				    }
				%>
				</select>
			</div>
			<button  class="btn btn-primary btn-block w-100" type="submit">Salvar</button>
		</form>
	</div>
</body>
</html>