<%@page import="Models.Aluno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Pessoa"%>
<%@page import="Models.UsuarioLogado"%>
<%@page import="java.util.List"%>
<%@page import="Repository.PlanilhaExercicioRepository"%>
<%@page import="Models.PlanilhaExercicio"%>
<%@page import="Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Seja bem vindo</title>
</head>
<body>
<%
	Pessoa usuarioLogado = UsuarioLogado.getUsuarioLogado();
	Aluno aluno = (Aluno) usuarioLogado;
	PlanilhaExercicioRepository _repositorio = new PlanilhaExercicioRepository();
	List<PlanilhaExercicio> planilhas = new ArrayList<PlanilhaExercicio>();
	planilhas = _repositorio.buscarPlanilhasUsuario(aluno);
	
	String erro = null;
	if (request.getAttribute("error") != null)
	{
		erro = request.getAttribute("error").toString();
	}
%>
<a class="btn btn-primary btn-lg float-right" href="telaLogin.jsp">Sair</a>
	<div class="container">
	<h1 class="text-center">Planilhas de treino</h1>
		<div class="table-responsive">
			<table class="table table-sm table-hover table-bordered table-striped">
				<thead>
					<tr>
						<th>Tabela</th>
						<th>DATA INICIO</th>
						<th>DATA FIM</th>
						<th>PERSONAL</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<% 
					for (PlanilhaExercicio planilha : planilhas) {
					%>
						<tr>
							<td><%= planilha.getNomeTabela() %></td>
							<td><%= planilha.getDataInicio() %></td>
							<td><%= planilha.getDataFim() %></td>
							<td><%= planilha.getPersonal().getNome() %></td>
							<td>
							<a href="<%= request.getContextPath()%>/PlanilhaExercicioServelet?id=<%=planilha.getId()%>">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
	  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
	  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
	</svg>
							</a> </td>
						</tr>
					<% 
					}
					%>
				</tbody>
			</table>
			
			<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
			<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		</div>
	</div>
</body>
	<!-- Modal -->
		<div class="modal fade" id="semPlanilhas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Que pena...</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body .text-danger">
		       	<label>Você ainda não possui planilhas de treino.</label>
		      </div>
		      <div class="modal-footer">
			      <div class="col-md-12">
	                <div class="col-md-12">
	                <button class="btn btn-danger form-control" data-dismiss="modal">OK</button>
	                </div>
            	   </div>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="semItensPlanilhas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Que pena...</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body .text-danger">
		       	<label><%=erro%></label>
		      </div>
		      <div class="modal-footer">
			      <div class="col-md-12">
	                <div class="col-md-12">
	                <button class="btn btn-danger form-control" data-dismiss="modal">OK</button>
	                </div>
            	   </div>
		      </div>
		    </div>
		  </div>
		</div>
</html>
<script>
	$(document).ready(function() { 
		if (<%=planilhas.isEmpty()%>) {
			$('#semPlanilhas').modal('show');
		}
		
		if (<%=erro != null%>) {
			$('#semItensPlanilhas').modal('show');
		}
	});
</script>