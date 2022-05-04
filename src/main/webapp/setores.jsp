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
		
		.esconder{
			display: none;
		}
		
		#cadastrar{
			background-color: lightgreen;
			padding: 5px;
			border-radius: 5px;
		}
		
		.topo div{
			background-color: black;
			color: white;
			text-align: center;
		}

		.dados div{
			border: 1px solid black;
			background-color: lightgray;
			text-align: center;
		}
		
		.espacoDados{
			margin-bottom: 10px;
		}
		
		.espacoTopo{
			margin-bottom: 5px;
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
				<li class="nav-item"><a class="nav-link" href="inicio">Inicio</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="produtos">Produtos</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="setores">Setores</a></li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<h1>Setores</h1>

		<nav class="navbar navbar-light bg-light">
			<form class="container-fluid justify-content-start">
				<button class="btn btn-info me-2" type="button" onclick="exibir(0)">Consultar</button>
				<button class="btn btn-outline-success me-2" type="button" onclick="exibir(1)">Cadastrar</button>
				<button class="btn btn-sm btn-outline-warning me-2" type="button" onclick="exibir(2)">Editar</button>
				<button class="btn btn-sm btn-outline-danger me-2" type="button" onclick="exibir(3)">Excluir</button>
			</form>
		</nav>
		
		<div class="container esconder" id="consultar">
		
			<div>
				<div class="row topo">
					<div class="col-1">ID</div>
					<div class="col-4">Nome</div>
				</div>
			<%
				ArrayList<model.Setores> setores_consulta = controller.Setores.getAll();
				
				String html = "";
				for(model.Setores s : setores_consulta){
					html += "<div class=\"row dados\">"+
								"<div class=\"col-1\">"+s.getSetorId()+"</div>"+
								"<div class=\"col-4\">"+s.getNome()+"</div>"+
								"</div>";
								
						}
						
						if(html.equals(""))
							html = "<div class='col-12 noCtt'><h3>Não há setores</h3></div>";
							
						out.println(html);
					
					%>
			</div>
			
		</div>

		<div class="container esconder" id="cadastrar">

			<form method="post" action="cadSetores_b.jsp">
				<fieldset>

					<!-- Form Name -->
					<legend>Cadastro de Setores</legend>

					<!-- Text input-->
					<div class="row campoForm">
						<label class="col-md-1 control-label" for="inputNome">Nome</label>
						<div class="col-md-4">
							<input id="inputNome" name="inputNome" type="text"
								placeholder="Nome do setor" class="form-control input-md">

						</div>
					</div>

					<!-- Button -->
					<div class="row campoForm">
						<label class="col-md-1 control-label"></label>
						<div class="col-md-4">
							<button class="btn btn-success">Cadastrar</button>
						</div>
					</div>

				</fieldset>
			</form>


		</div>

		<div class="container esconder" id="editar">
		
			<form action="formEditSetor.jsp" method="post">
			
			<div>
				<div class="row topo espacoTopo">
					<div class="col-1">ID</div>
					<div class="col-4">Nome</div>
				</div>
			<%
				html = "";	
			
				for(model.Setores s : setores_consulta){
					html += "<div class=\"row dados espacoDados\">"+
								"<div class=\"col-1\">"+s.getSetorId()+"</div>"+
								"<div class=\"col-4\">"+s.getNome()+"</div>"+
								"<button class='btn btn-warning col-1' onclick='btnEdit("+ s.getSetorId() +")'>Editar</button>"+
								"</div>";
								
								
								
						}
						
						if(html.equals(""))
							html = "<div class='col-12 noCtt'><h3>Não há setores</h3></div>";
							
						out.println(html);
					
					%>
			</div>
			
			<input type="hidden" name="inputIdEdit" id="inputIdEdit" />
			
			</form>
			
		</div>
		
		<div class="container esconder" id="excluir">
			
			<form action="delSetor_b.jsp" method="post">
			
			<div>
				<div class="row topo espacoTopo">
					<div class="col-1">ID</div>
					<div class="col-4">Nome</div>
				</div>
			<%
				
				html = "";
				for(model.Setores s : setores_consulta){
					html += "<div class=\"row dados espacoDados\">"+
								"<div class=\"col-1\">"+s.getSetorId()+"</div>"+
								"<div class=\"col-4\">"+s.getNome()+"</div>"+
								"<button class='btn btn-danger col-1' onclick='btnDel("+ s.getSetorId() +")'>Deletar</button>"+
								"</div>";
								
						}
						
						if(html.equals(""))
							html = "<div class='col-12 noCtt'><h3>Não há setores</h3></div>";
							
						out.println(html);
					
					%>
			</div>
			
			<input type="hidden" name="inputIdDel" id="inputIdDel" />
			
			</form>
			
		</div>
		
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		
		<script>
		
			function exibir(indice){
				
				 for(i = 0; i < document.getElementsByClassName('esconder').length; i++){
					 
					 document.getElementsByClassName('esconder')[i].style.display = 'none';
				 }
				 
				 document.getElementsByClassName('esconder')[indice].style.display = 'block';
			}
			
			function btnDel(idDeletar){
				
				document.getElementById('inputIdDel').value = idDeletar;
			}
			
			function btnEdit(idEditar){
				
				document.getElementById('inputIdEdit').value = idEditar;
			}
		
		</script>

</body>
</html>