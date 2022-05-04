<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	<%@ page import="java.util.ArrayList" %>
	
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>SYS-PDV</title>
</head>
<body>

	<%
		int id = Integer.parseInt(request.getParameter("inputId"));
		String nome = request.getParameter("inputNome");
		double preco = Double.parseDouble(request.getParameter("inputPreco"));
		int setorId = Integer.parseInt(request.getParameter("selectSetor"));
		
		String html = "";
		
		if(controller.Produtos.updtProduto(id, nome, preco, setorId)){
			
			html="<input type=\"hidden\" id=\"msg\" name=\"msg\" value=1 />";
		}else{
			
			html="<input type=\"hidden\" id=\"msg\" name=\"msg\" value=0 />";
		}
		
		out.println(html);
	%>


	<script>

		function msgDB(){
			
			if(document.getElementById('msg').value == 1){
				
				window.alert("Produto editado com sucesso!");
			}else{
				
				window.alert("ERRO ao editar o produto.")
			}
			
			window.location.href = "produtos"
		}

		msgDB();
	</script>

	</body>
	</html>