<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>SYS-PDV</title>
<body>

<%
		String nome = request.getParameter("inputNome");
		double preco = Double.parseDouble(request.getParameter("inputPreco"));
		int setor = Integer.parseInt(request.getParameter("selectSetor"));
		
		String html = "";
		
		if(controller.Produtos.addProduto(new model.Produtos(nome, preco, setor))){
			
			html="<input type=\"hidden\" id=\"msg\" name=\"msg\" value=1 />";
		}else{
			
			html="<input type=\"hidden\" id=\"msg\" name=\"msg\" value=0 />";
		}
		
		out.println(html);
	
	%>
	
	<script>
		
		/*setTimeout(function(){
			window.location.href = "produtos"
		}, 3000);*/
		

		function msgDB(){
			
			if(document.getElementById('msg').value == 1){
				
				window.alert("Produto cadastrado com sucesso!");
			}else{
				
				window.alert("ERRO ao cadastrar o produto.")
			}
			
			window.location.href = "produtos"
		}

		msgDB()
	
	</script>

</body>
</html>