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
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="produtos">Produtos</a></li>
				<li class="nav-item"><a class="nav-link" href="setores">Setores</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<h1>Produtos</h1>

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
					<div class="col-2">Preco (R$)</div>
					<div class="col-2">Setor</div>
				</div>
			<%
				ArrayList<model.Produtos> produtos_consulta = controller.Produtos.getAll();
				
				String html = "";
				for(model.Produtos p : produtos_consulta){
					html += "<div class=\"row dados\">"+
								"<div class=\"col-1\">"+p.getProdutoId()+"</div>"+
								"<div class=\"col-4\">"+p.getNome()+"</div>"+
								"<div class=\"col-2\">"+p.getPreco()+"</div>";
								
								
								ArrayList<model.Setores> setores_consulta = controller.Setores.getAll();
								
								for(model.Setores s : setores_consulta){
									
									if(p.getSetorId() == s.getSetorId()){
										
										html += "<div class=\"col-2\">"+s.getNome()+"</div>"+
												"</div>";
									}
								}
								
						}
						
						if(html.equals(""))
							html = "<div class='col-12 noCtt'><h3>Não há produtos</h3></div>";
							
						out.println(html);
					
					%>
			</div>
			
		</div>

		<div class="container esconder" id="cadastrar">

			<form method="post" action="cadProdutos_b.jsp">
				<fieldset>

					<!-- Form Name -->
					<legend>Cadastro de Produtos</legend>

					<!-- Text input-->
					<div class="row campoForm">
						<label class="col-md-1 control-label" for="inputNome">Nome</label>
						<div class="col-md-4">
							<input id="inputNome" name="inputNome" type="text"
								placeholder="Nome do produto" class="form-control input-md">

						</div>
					</div>

					<!-- Text input-->
					<div class="row campoForm">
						<label class="col-md-1 control-label" for="inputPreco">Preço
							(R$)</label>
						<div class="col-md-2">
							<input id="inputPreco" name="inputPreco" type="text" class="form-control input-md">

						</div>
					</div>

					<!-- Select Basic -->
					<div class="row campoForm">
						<label class="col-md-1 control-label" for="selectSetor">Setor</label>
						<div class="col-md-4">
							<select id="selectSetor" name="selectSetor" class="form-control">
							
								<option disabled selected>-ESCOLHA-</option>
								
								<%
									ArrayList<model.Setores> setores_consulta = controller.Setores.getAll();
									
									for(model.Setores setor : setores_consulta){
										
										out.println("<option value="+setor.getSetorId()+">"+setor.getNome()+"</option>");
									}
								%>
								
							</select>
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
		
			<form action="formEditProduto.jsp" method="post">
			
			<div>
				<div class="row topo espacoTopo">
					<div class="col-1">ID</div>
					<div class="col-4">Nome</div>
					<div class="col-2">Preco (R$)</div>
					<div class="col-2">Setor</div>
				</div>
			<%
				
				html = "";
				for(model.Produtos p : produtos_consulta){
					html += "<div class=\"row dados espacoDados\">"+
								"<div class=\"col-1\">"+p.getProdutoId()+"</div>"+
								"<div class=\"col-4\">"+p.getNome()+"</div>"+
								"<div class=\"col-2\">"+p.getPreco()+"</div>";
								
								
								ArrayList<model.Setores> setores_edit = controller.Setores.getAll();
								
								for(model.Setores s : setores_edit){
									
									if(p.getSetorId() == s.getSetorId()){
										
										html += "<div class=\"col-2\">"+s.getNome()+"</div>"+
												"<button class='btn btn-warning col-1' onclick='btnEdit("+ p.getProdutoId() +")'>Editar</button>"+
												"</div>";
									}
								}
								
						}
						
						if(html.equals(""))
							html = "<div class='col-12 noCtt'><h3>Não há produtos</h3></div>";
							
						out.println(html);
					
					%>
			</div>
			
			<input type="hidden" name="inputIdEdit" id="inputIdEdit" />
			
			</form>
			
		</div>
		
		<div class="container esconder" id="excluir">
			
			<form action="delProduto_b.jsp" method="post">
			
			<div>
				<div class="row topo espacoTopo">
					<div class="col-1">ID</div>
					<div class="col-4">Nome</div>
					<div class="col-2">Preco (R$)</div>
					<div class="col-2">Setor</div>
				</div>
			<%
				html = "";
				for(model.Produtos p : produtos_consulta){
					html += "<div class=\"row dados espacoDados\">"+
								"<div class=\"col-1\">"+p.getProdutoId()+"</div>"+
								"<div class=\"col-4\">"+p.getNome()+"</div>"+
								"<div class=\"col-2\">"+p.getPreco()+"</div>";
								
								
								ArrayList<model.Setores> setores_del = controller.Setores.getAll();
								
								for(model.Setores s : setores_del){
									
									if(p.getSetorId() == s.getSetorId()){
										
										html += "<div class=\"col-2\">"+s.getNome()+"</div>"+
												"<button class='btn btn-danger col-1' onclick='btnDel("+ p.getProdutoId() +")'>Deletar</button>"+
												"</div>";
									}
								}
								
						}
						
						if(html.equals(""))
							html = "<div class='col-12 noCtt'><h3>Não há produtos</h3></div>";
							
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