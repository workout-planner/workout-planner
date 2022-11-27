<%@page import="Models.Exercicio"%>
<%@page import="Dao.Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script   src="https://code.jquery.com/jquery-3.1.1.min.js"   integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="   crossorigin="anonymous"></script>
  <!-- CSS only -->
<title>Exercicios</title>
</head>
<body>
<%
	Dao<Exercicio, Integer> daoExercicio = new Dao<Exercicio, Integer>();
	List<Exercicio> exercicios = daoExercicio.findAll(Exercicio.class);
%>

<a class="btn btn-primary" href="cadastrarExercicio.jsp">Cadastrar</a>
<div class="container">
	<div class="table-responsive">
		<table class="table table-sm table-hover table-bordered table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>NOME</th>
					<th>DESCRIÇÃO</th>
					<th>TIPO EXERCICIO</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<% 
			for (Exercicio exercicio : exercicios) {
			%>
				<tr>
					<td><%= exercicio.getId() %></td>
					<td><%= exercicio.getNome() %></td>
					<td><%= exercicio.getDesricao() %></td>
					<td><%= exercicio.getTipoExercicio() %></td>
					<td><a href="editarExercicio.jsp?id=<%=exercicio.getId()%>"><i class="">Edit</i></a></td>
					<td><a href="<%= request.getContextPath()%>/ExercicioServelet?id=<%=exercicio.getId()%>">Delete</a></td>
				</tr>
			<% 
			}
			%>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>