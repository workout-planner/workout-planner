<%@page import="Models.Exercicio"%>
<%@page import="Dao.Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Exercicios</title>
</head>
<body>
<%
	Dao<Exercicio, Integer> daoExercicio = new Dao<Exercicio, Integer>();
	List<Exercicio> exercicios = daoExercicio.findAll(Exercicio.class);
%>

<a class="btn btn-primary" href="cadastrarExercicio.jsp">Cadastrar</a>

<div class="container">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>ID</th>
				<th>NOME</th>
				<th>DESCRIÇÃO</th>
				<th>TIPO EXERCICIO</th>
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
				<td><a href="editCurso.jsp?id=<%=exercicio.getId()%>"><i class="">Edit</i></a></td>
				<td><a href="<%= request.getContextPath()%>/controllerCurso?id=<%=exercicio.getId()%>">Delete</a></td>
			</tr>
		<% 
		}
		%>
		</tbody>
	</table>
</div>
</body>
</html>