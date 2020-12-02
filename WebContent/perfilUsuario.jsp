<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 

	String nomeUsuario = (String)request.getAttribute("nomeUsuario");
	String tipoUsuario = (String)request.getAttribute("tipoUsuario");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Perfil de Usuário</h1>
	<p><%= nomeUsuario %></p>
	<p><%= tipoUsuario %></p>
</body>
</html>