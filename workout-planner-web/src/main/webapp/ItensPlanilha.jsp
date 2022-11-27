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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
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
<label>Data Inicio : <%=planilha.getDataInicio() %></label>
<label>Data Fim : <%=planilha.getDataFim() %></label>
<label>Personal : <%=planilha.getPersonal().getNome() %></label>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>EXERCICIOS</th>
				<th>DESCRIÇÃO</th>
				<th>SERIES</th>
				<th>REPETIÇÕES</th>
				<th>TEMPO DESCANSO</th>
				<th>TIPO EXERCICIO</th>
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
				</tr>
			<% 
			}
			%>
		</tbody>
	</table>
	<a href="telaInicialAluno.jsp" class="btn btn-primary  float-right" >Voltar</a>
</body>
</html>