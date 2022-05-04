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
		
		String html = "";
		
		if(controller.Setores.updtSetor(id, nome)){
			
			html="<input type=\"hidden\" id=\"msg\" name=\"msg\" value=1 />";
		}else{
			
			html="<input type=\"hidden\" id=\"msg\" name=\"msg\" value=0 />";
		}
		
		out.println(html);
	%>


	<script>

		function msgDB(){
			
			if(document.getElementById('msg').value == 1){
				
				window.alert("Setor editado com sucesso!");
			}else{
				
				window.alert("ERRO ao editar o setor.")
			}
			
			window.location.href = "setores"
		}

		msgDB();
	</script> 

	</body>
	</html>