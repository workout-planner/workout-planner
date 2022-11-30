<%@page import="java.util.ArrayList"%>
<%@page import="Models.Aluno"%>
<%@page import="Repository.AlunoRepository"%>
<%@page import="java.util.List"%>
<%@page import="Models.Pessoa"%>
<%@page import="Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Alunos Registrados</title>
</head>
<body>
<%
	List<Aluno> alunos = new ArrayList<Aluno>();
	AlunoRepository daoUsuario = new AlunoRepository();
	List<Pessoa> usuarios = daoUsuario.buscarAll();
	for (Pessoa aluno : usuarios)
	{
		alunos.add((Aluno)aluno);
	}
	
	String erro = null;
	if (request.getAttribute("error") != null) {
		erro = request.getAttribute("error").toString();
	}
%>
<a class="btn btn-primary btn-lg" href="TelaInicialPersonal.jsp">Voltar</a>
<div class="container">
	<h1 class="text-center">Lista de usuarios</h1>
	<div class="table-responsive table-striped">
		<table class="table table-sm table-hover table-bordered table-striped">
			<thead>
				<tr>
					<th>NOME</th>
					<th>DATA NASCIMENTO</th>
					<th>MATRICULA</th>
					<th>PLANO</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<% 
			for (Aluno usuario : alunos) {
			%>
				<tr>
					<td><%= usuario.getNome() %></td>
					<td><%= usuario.getDataNascimento() %></td>
					<td><%= usuario.getMatricula() %></td>
					<td><%= usuario.getPlano() %></td>
					<td>
						<a href="EditarAluno.jsp?id=<%=usuario.getId()%>">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
						  <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
						</svg>
						</a> 
					</td>
					<td>
						<a onclick="excluir(<%=usuario.getId()%>)" data-toggle="modal" data-target="#modal-confirmacao-excluir" >
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
	</div>
</div>
<input type="hidden"id="idExcluir">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
<!-- Modal -->
		<div class="modal fade" id="modal-confirmacao-excluir" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
	                <h4 class="modal-title">Exclusão do aluno</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body .text-danger">
		       	<p>Tem certeza que deseja excluir esse aluno?</p>
	                <div class="alert alert-warning" role="alert">
	                    Essa ação não pode ser desfeita.
	                </div>
		      </div>
		      <div class="modal-footer">
			      <div class="row">
	                    <div class="col-md-6">
	                        <button class="btn btn-primary form-control" data-dismiss="modal" onclick="excluirAction()">Excluir</button>
	                    </div>
	                    <div class="col-md-6">
	                        <button type="button" class="btn btn-default form-control" data-dismiss="modal">Cancelar</button>
	                    </div>
	                </div>
		      </div>
		    </div>
		  </div>
		</div>
<!-- Modal -->
		<div class="modal fade" id="modalErro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
	                <h4 class="modal-title">Exclusão do aluno falhou</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body .text-danger">
		       	<p><%=erro %></p>
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
<script>
	$(document).ready(function() { 
		if (<%=erro != null%>)
		{	
			$("#modalErro").modal('show');
		}
		
	});
	
 	function excluir(id) {
 		$("#idExcluir").val(id);
	}
 	
 	function excluirAction() {
 		var id = $("#idExcluir").val();
 		window.location.href = "<%= request.getContextPath()%>/UsuarioServelet?id=" + id;
 	}
</script>