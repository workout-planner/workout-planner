<%@page import="java.util.ArrayList"%>
<%@page import="Models.PlanilhaExercicio"%>
<%@page import="java.util.List"%>
<%@page import="Repository.PlanilhaExercicioRepository"%>
<%@page import="Models.Personal"%>
<%@page import="Models.UsuarioLogado"%>
<%@page import="Models.Pessoa"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Pessoa usuarioLogado = UsuarioLogado.getUsuarioLogado();
	Personal personal = (Personal) usuarioLogado;
	PlanilhaExercicioRepository _repositorio = new PlanilhaExercicioRepository();
	List<PlanilhaExercicio> planilhas = new ArrayList<PlanilhaExercicio>();
	planilhas = _repositorio.buscarPlanilhasPorPersonal(personal);
%>
<h1 class="text-center">Planilhas de treino cadastradas por você</h1>
<div class="container">
	<div class="table-responsive">
		<table class="table table-sm table-hover table-bordered table-striped">
			<thead>
				<tr>
					<th>Tabela</th>
					<th>DATA INICIO</th>
					<th>DATA FIM</th>
					<th>ALUNO</th>
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
						<td><%= planilha.getAluno().getNome() %></td>
						<td>
							<a onclick="excluir(<%=planilha.getId()%>)" data-toggle="modal" data-target="#modal-confirmacao-excluir" >
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
								  <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
								</svg>
							</a> 
						</td>
					</tr>
				<% 
				}
				%>
			</tbody>
		</table>
		<a class="btn btn-primary btn-lg" href="TelaInicialPersonal.jsp">Voltar</a>
		<input id="idExcluir" type="hidden">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	</div>
</div>
	<div id="modal-confirmacao-excluir" tabindex="-1" class="modal fade" role="dialog">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title">Exclusão de planilha</h4>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <p>Tem certeza que deseja excluir essa planilha?</p>
	                <div class="alert alert-warning" role="alert">
	                    Essa ação não pode ser desfeita.
	                </div>
	            </div>
	            <div class="modal-footer">
	                <div class="row">
	                    <div class="col-md-6">
	                        <button class="btn btn-primary form-control" onclick="excluirAction()">Excluir</button>
	                    </div>
	                    <div class="col-md-6">
	                        <button type="button" class="btn btn-default form-control" data-dismiss="modal">Cancelar</button>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>

<script>
 	function excluir(id) {
 		$("#idExcluir").val(id);
	}
 	
 	function excluirAction() {
 		var id = $("#idExcluir").val();
 		window.location.href = "<%= request.getContextPath()%>/PlanilhaExercicioPersonalServelet?id=" + id;
 	}
</script>