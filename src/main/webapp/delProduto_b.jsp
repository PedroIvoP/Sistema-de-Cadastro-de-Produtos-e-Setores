<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>SYS-PDV</title>
</head>
<body>


<%
	int idDelProduto = Integer.parseInt(request.getParameter("inputIdDel"));
	String html = "";
	

	if(controller.Produtos.deleteProdutoById(idDelProduto)){
		
		html="<input type=\"hidden\" id=\"msg\" name=\"msg\" value=1 />";
	}else{
		
		html="<input type=\"hidden\" id=\"msg\" name=\"msg\" value=0 />";
	}
	
	out.println(html);
%>


<script>

	function msgDB(){
		
		if(document.getElementById('msg').value == 1){
			
			window.alert("Produto deletado com sucesso!");
		}else{
			
			window.alert("ERRO ao deletar o produto.")
		}
		
		window.location.href = "produtos"
	}

	msgDB();
</script>

</body>
</html>