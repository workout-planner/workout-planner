<%@page import="java.util.List"%>
<%@page import="Models.PlanilhaExercicio"%>
<%@page import="Models.ItensPlanilha"%>
<%@page import="Dao.Dao"%>
<%@page import="Repository.ItensPlanilhaRepository"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%			
	ItensPlanilhaRepository _repositorio = new ItensPlanilhaRepository();
	Dao<PlanilhaExercicio, Integer> daoPlanilha = new Dao<PlanilhaExercicio, Integer>();

	String planilhaIdText = request.getAttribute("id").toString();
	int planilhaId = Integer.parseInt(planilhaIdText);
	
	PlanilhaExercicio planilha = daoPlanilha.findById(PlanilhaExercicio.class, planilhaId).get();
	
	List<ItensPlanilha> itens = _repositorio.BuscarPorPlanilha(planilha);
%>
<h1 class="text-center"><%=planilha.getNomeTabela() %></h1>
<div class="container">
	<ul class="list-inline row">
	  <li class="col-sm-4 text-center">Data Inicio : <%=planilha.getDataInicio() %></li>
	  <li class="col-sm-4 text-center">Data Fim : <%=planilha.getDataFim() %></li>
	  <li class="col-sm-4 text-center">Personal : <%=planilha.getPersonal().getNome() %></li>
	</ul>
		<div class="table-responsive">
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>EXERCICIOS</th>
						<th>DESCRIÇÃO</th>
						<th>SERIES</th>
						<th>REPETIÇÕES</th>
						<th>TEMPO DESCANSO</th>
						<th>TIPO EXERCICIO</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<% 
					int i = 0;
					for (ItensPlanilha item : itens) {
					%>
						<tr>
							<td data-align="center"><%= item.getExercicio().getNome() %></td>
							<td data-align="center"><%= item.getExercicio().getDesricao() %></td>
							<td data-align="center"><%= item.getSeries() %></td>
							<td data-align="center"><%= item.getRepeticoes() %></td>
							<td data-align="center"><%= item.getTempoDescanso() %> segundos</td>
							<td data-align="center"><%= item.getExercicio().getTipoExercicio() %></td>
							<td>
								<div class="form-check form-switch">
								  <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked">
								</div> 
							</td>
						</tr>
					<% 
					}
					%>
				</tbody>
			</table>
		</div>
		<a href="telaInicialAluno.jsp" class="btn btn-primary  float-right" >Voltar</a>
	</div>
</body>
</html>