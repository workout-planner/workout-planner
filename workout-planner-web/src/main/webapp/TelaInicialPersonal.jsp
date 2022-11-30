<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tela Inicial</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<a class="btn btn-primary btn-lg float-right" href="telaLogin.jsp">Sair</a>
	<div class="container mh-100">
		<div class="h-100 d-flex align-items-center justify-content-center flex-column">
			<h1>Personal trainer</h1>
			<div>
				<img class="img-fluid" alt="" src="images/personal-trainer.png" width="400" height="400">
			</div>
			<div>
	    		<a class="btn btn-primary w-100 mb-3" style="margin-right: 3rem" href="indexExercicio.jsp">
			    	Exercicios
	    		</a>
	    		<a class="btn btn-primary w-100 mb-3" style="margin-right: 3rem" href="Planilha.jsp">
			    	Cadastrar Planilhas
			    </a>
	    		<a class="btn btn-primary w-100 mb-3" href="PlanilhasIndex.jsp">
		    		Planilha Criadas
	    		</a>
	    		<a class="btn btn-primary w-100 mb-3" href="IndexUsuarios.jsp">
		    		Usuarios
	    		</a>
			</div>
	  	</div>
  	</div>
</body>
</html>