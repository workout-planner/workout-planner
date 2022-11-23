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
<button id="Teste">Abrir modal de demonstração</button>
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
				<td><a href="editarExercicio.jsp?id=<%=exercicio.getId()%>"><i class="">Edit</i></a></td>
				<td><a href="<%= request.getContextPath()%>/ExercicioServelet?id=<%=exercicio.getId()%>">Delete</a></td>
			</tr>
		<% 
		}
		%>
		</tbody>
	</table>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<script>
	$( "#Teste" ).click(function() {
		alert("modal");
		$("modalExemplo").show();
	});
</script>