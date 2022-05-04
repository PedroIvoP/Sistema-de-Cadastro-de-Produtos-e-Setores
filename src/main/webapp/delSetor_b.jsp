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
	

	if(controller.Setores.deleteSetorById(idDelProduto)){
		
		html="<input type=\"hidden\" id=\"msg\" name=\"msg\" value=1 />";
	}else{
		
		html="<input type=\"hidden\" id=\"msg\" name=\"msg\" value=0 />";
	}
	
	out.println(html);
%>


<script>

	function msgDB(){
		
		if(document.getElementById('msg').value == 1){
			
			window.alert("Setor deletado com sucesso!");
		}else{
			
			window.alert("ERRO ao deletar o Setor.")
		}
		
		window.location.href = "setores"
	}

	msgDB();
</script>

</body>
</html>