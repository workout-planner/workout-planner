<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv=”Content-Type” content=”text/html; charset=iso-8859-1″>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
  <!-- CSS only -->
<style>
	html {
		height: 100%;
	}
</style>
<title>Worker Planner gym</title>
</head>
	<body class="h-100">
		<%
			String erro = null;
			String erroUser = null;
			String sucesso = null;
			if (request.getAttribute("message") != null)
			{
				erro = request.getAttribute("message").toString();
				erroUser = request.getAttribute("erro").toString();
			}
			
			if (request.getAttribute("sucesso") != null)
			{
				sucesso = request.getAttribute("sucesso").toString();
			}
		%>
		
			<div class="row h-100 d-flex align-items-center justify-content-center">
				<div class="col-md-7 border rounded" style="padding: 5rem; background-color: #e9e8ed">
					<h1 class="h3 mb-3 fw-normal text-center">Workout Planner gym</h1>
					<div class="text-center">
						<img class="mb-4" src="images/hand.png" alt="" width="80" height="80">	
					</div>
					<button id="loginBtn" type="button" class="btn btn-primary w-100 mb-3" data-toggle="modal" data-target="#loginModal">Tenho uma conta</button>
					<button id="cadastrar" type="button" class="btn btn-secondary w-100 mb-3" data-toggle="modal" data-target="#cadastrarModal">Cadastrar</button>
					<form class="card-body cardbody-color p-lg-5" action="LoginServelet" method="post" id="formLogin">
					<div id="loginMatricula">
					<label for="userLogin">Matricula</label>	
						<div class="form-floating" id="loginMatricula">
							<input name="matricula" class="form-control mb-3" id="userLogin" type="text" aria-label="Usuário" placeholder="Usuário">
						</div>
					</div>
					<div id="loginPersonal">
						<label for="userLogin">CBO</label>
						<div class="form-floating mb-3" id="loginPersonal">
							<input name="cbo" class="form-control mb-3" id="userLogin" type="text" aria-label="Usuário" placeholder="Usuário">
						</div>
					</div>
						<label>Senha</label>
						<div class="form-floating mb-3">
							<input name="senha" class="form-control mb-3" id="userPassword" type="password" aria-label="Senha" placeholder="Senha">
						</div>
			
						<button class="w-100 btn btn-lg btn-primary mb-3" type="submit">Entrar</button>
						<input id="voltar" type="button" value="Voltar" class="btn btn-secondary">
					</form>
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
		        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<a class="btn btn-primary" data-toggle="modal" data-target="#modalSenha">Personal</a>
		        <a href="cadastrarAluno.jsp" class="btn btn-primary float-end" style="">Aluno</a>
	          </div>
		    </div>
		  </div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title text-center" id="exampleModalLabel">Tipo de usuario</h5>
		        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <a class="btn btn-primary" id="loginPersonalbtn" data-dismiss="modal">Personal</a>
		        <a class="btn btn-primary float-end" id="loginAlunobtn" data-dismiss="modal">Aluno</a>
		      </div>
		    </div>
		  </div>
		</div>
		
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
		
		<!-- Modal -->
		<div class="modal fade" id="modalSucesso" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">SUCESSO</h5>
		        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body .text-danger">
		       	<label><%= sucesso%></label>
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
		<div class="modal fade" id="modalSenha" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Insira a senha para cadastrar um personal</h5>
		        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <input type="password"id="senhaPersonal">
		      <div class="modal-footer">
			      <div class="col-md-12">
	                <div class="col-md-12">
	                	<button id="buttonSenha"class="btn btn-danger form-control" data-dismiss="modal">OK</button>
	                </div>
            	  </div>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="modalSenhaErro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Senha incorreta</h5>
		        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
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
				
		<script>
			$(document).ready(function() { 
				if (<%=erro != null%>)
				{
					if(<%=erroUser == "personal" %>)
						loginPersonal();
					else
						loginAluno();
					
					$('#modalErro').modal('show');
				}
				else
					$("#formLogin").hide();
				
				if (<%=sucesso != null%>){
					$('#modalSucesso').modal('show');
				}
			});
			
			$( "#loginPersonalbtn" ).click(function() {
				loginPersonal();
			});
			
			$( "#PersonalCadastrarModal" ).click(function() {
				loginPersonal();
			});
			
			$( "#loginAlunobtn" ).click(function() {
				loginAluno();
			});
			
			$( "#voltar" ).click(function() {
				$('#formLogin').hide();
				$('#cadastrar').show();
				$('#login').show();
				$('#loginBtn').show();
			});
			
			$( "#buttonSenha" ).click(function() {
				var senha = $("#senhaPersonal").val();
				if (senha == "1234")
				{
					window.location.assign("http://localhost:8080/workout-planner-web/cadastrarPersonal.jsp");
					$("#senhaPersonal").val("");
				}
				else
				{
					$('#modalSenhaErro').modal('show');
					$("#senhaPersonal").val("");
				}
					
					
			});
			
			function loginPersonal()
			{
				$('#formLogin').show();
				$('#cadastrar').hide();
				$('#login').hide();
				$('#loginPersonal').show();
				$('#loginMatricula').hide();
				$('#loginBtn').hide();
			}
			
			function loginAluno() 
			{
				$('#formLogin').show();
				$('#cadastrar').hide();
				$('#login').hide();
				$('#loginMatricula').show();
				$('#loginPersonal').hide();
				$('#loginBtn').hide();
			}
		</script>
	</body>
</html>