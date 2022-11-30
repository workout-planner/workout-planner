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
%>
	<div class="container">
	<h5>Planilhas de treino</h5>
		<table class="table table-bordered table-striped">
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
				int i = 0;
				for (PlanilhaExercicio planilha : planilhas) {
				%>
					<tr>
						<td><%= i++ %></td>
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
	</div>
</body>
</html>