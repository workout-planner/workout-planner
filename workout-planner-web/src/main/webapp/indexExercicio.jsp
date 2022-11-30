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
	
	String erro = null;
	if (request.getAttribute("error") != null)
	{
		erro = request.getAttribute("error").toString();
	}
%>
<h1 class="text-center">Lista de exercicios</h1>

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
					<td><a href="editarExercicio.jsp?id=<%=exercicio.getId()%>">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
							  <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
							</svg>
					</a></td>
					<td><a href="<%= request.getContextPath()%>/ExercicioServelet?id=<%=exercicio.getId()%>">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
								  <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
								</svg>
					</a></td>
				</tr>
			<% 
			}
			%>
			</tbody>
		</table>
	</div>
	<div>
	<a class="btn btn-primary btn-lg" href="TelaInicialPersonal.jsp">Voltar</a>
	<a class="btn btn-primary btn-lg float-right" href="cadastrarExercicio.jsp">Cadastrar</a>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>

<!-- Modal -->
		<div class="modal fade" id="modalErro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">ERRO</h5>
		        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body .text-danger">
		       	<label><%=erro %></label>
		      </div>
		      <div class="modal-footer">
			      <div class="col-md-12">
	                <div class="col-md-12">
	                <button class="btn btn-danger form-control" data-dismiss="modal">Entendi</button>
	                </div>
            	   </div>
		      </div>
		    </div>
		  </div>
		</div>

<script>
if (<%=erro != null%>)
{	
	$('#modalErro').modal('show');
}
</script>