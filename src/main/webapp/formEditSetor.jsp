<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	<%@ page import="java.util.ArrayList" %>
	
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>SYS-PDV</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<style>
		label{
			text-align: right;
			font-weight: bolder;
		}
		
		legend{
			font-weight: bolder;	
		}
		
		.campoForm{
			margin-bottom: 10px;
		}
		
		#divEdit{
			background-color: lightblue;
			padding: 5px;
			border-radius: 5px;
			margin-top: 20px;
		}
		
		#formEdit{
			align-items: center;
		}
		
	</style>
</head>
<body>

	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="#">SYS-PDV</a>



		<!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>



		<!-- Navbar links -->
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="inicio">Inicio</a></li>
				<li class="nav-item"><a class="nav-link" href="produtos">Produtos</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="setores">Setores</a></li>
			</ul>
		</div>
	</nav>

	<div class="container" id="divEdit">
	
	<form method="post" action="editSetor_b.jsp" id="formEdit">
			<!-- Form Name -->
			<legend>Edição de Setores</legend>
			
			
			<%
				int id = Integer.parseInt(request.getParameter("inputIdEdit"));
			
				model.Setores s = controller.Setores.getSetorById(id);
			
			%>
			
			<!-- Text input-->
			<div class="row campoForm">
				<label class="col-md-1 control-label" for="inputNome">Id</label>
				<div class="col-md-4">
				
				<%
					out.println("<input type=\"text\" class=\"form-control input-md\" value='" + s.getSetorId() +"' disabled />");
					out.println("<input id=\"inputId\" name=\"inputId\" type=\"hidden\" value='" + s.getSetorId() +"'/>");
				
				%>

				</div>
			</div>

			<!-- Text input-->
			<div class="row campoForm">
				<label class="col-md-1 control-label" for="inputNome">Nome</label>
				<div class="col-md-4">
				
				<%
					out.println("<input id=\"inputNome\" name=\"inputNome\" type=\"text\" class=\"form-control input-md\" value='"+ s.getNome() +"' />");
				%>

				</div>
			</div>

			<!-- Button -->
			<div class="row campoForm">
				<label class="col-md-1 control-label"></label>
				<div class="col-md-4">
					<button class="btn btn-success">Editar</button>
				</div>
			</div>

	</form>
	
	</div>
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>