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
		
		String html = "";
		
		if(controller.Setores.addSetor(nome)){
			
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
				
				window.alert("Setor cadastrado com sucesso!");
			}else{
				
				window.alert("ERRO ao cadastrar o setor.")
			}
			
			window.location.href = "setores"
		}

		msgDB()
	
	</script>

</body>
</html>