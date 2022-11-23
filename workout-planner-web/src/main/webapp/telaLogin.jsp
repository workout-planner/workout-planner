<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv=”Content-Type” content=”text/html; charset=iso-8859-1″>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
  <!-- CSS only -->
<title>Worker Planner gym</title>
</head>
	<body>
	
		<button id="loginBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal">Tenho uma conta</button>
		<button id="cadastrar" type="button" class="btn btn-primary" data-toggle="modal" data-target="#cadastrarModal">Cadastrar</button>
		
		<div id="formLogin">
			<div class="box-parent-login">
				<div class="well bg-white box-login">
					<h1 class="ls-login-logo">Worker Planner gym</h1>
					<form role="form">
						<fieldset>
			 
							<div class="form-group ls-login-user" id="loginMatricula">
								<label for="userLogin">Matricula</label>
								<input class="form-control ls-login-bg-user input-lg" id="userLogin" type="text" aria-label="Usuário" placeholder="Usuário">
							</div>
							
							<div class="form-group ls-login-user" id="loginPersonal">
								<label for="userLogin">CBO</label>
								<input class="form-control ls-login-bg-user input-lg" id="userLogin" type="text" aria-label="Usuário" placeholder="Usuário">
							</div>
			 
							<div class="form-group ls-login-password">
								<label for="userPassword">Senha</label>
								<input class="form-control ls-login-bg-password input-lg" id="userPassword" type="password" aria-label="Senha" placeholder="Senha">
							</div>
			 
							<input type="submit" value="Entrar" class="btn btn-primary">
							<input id="voltar" type="button" value="Voltar" class="btn btn-primary">
			 
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
		<!-- Modal -->
		<div class="modal fade" id="cadastrarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Cadastrar</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <a type="button" class="btn btn-primary">Personal</a>
		        <a href="cadastrarAluno.jsp" class="btn btn-primary  float-right" style="">Aluno</a>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Tipo de usuario</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <a class="btn btn-primary" id="loginPersonalbtn" data-dismiss="modal">Personal</a>
		        <a class="btn btn-primary  float-right" id="loginAlunobtn" data-dismiss="modal">Aluno</a>
		      </div>
		    </div>
		  </div>
		</div>
				
		<script>
			$(document).ready(function() {  $("#formLogin").hide(); });
		
			$( "#loginPersonalbtn" ).click(function() {
				$('#formLogin').show();
				$('#cadastrar').hide();
				$('#login').hide();
				$('#loginPersonal').show();
				$('#loginMatricula').hide();
				$('#loginBtn').hide();
			});
			
			$( "#loginAlunobtn" ).click(function() {
				$('#formLogin').show();
				$('#cadastrar').hide();
				$('#login').hide();
				$('#loginMatricula').show();
				$('#loginPersonal').hide();
				$('#loginBtn').hide();
			});
			
			$( "#voltar" ).click(function() {
				$('#formLogin').hide();
				$('#cadastrar').show();
				$('#login').show();
				$('#loginBtn').show();
			});
		</script>
		
	</body>
</html>