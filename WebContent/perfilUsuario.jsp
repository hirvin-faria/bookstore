<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 

	String nomeUsuario = (String)request.getSession().getAttribute("nomeUsuario");
	String tipoUsuario = (String)request.getSession().getAttribute("tipoUsuario");
	String erroLogin = (String)request.getSession().getAttribute("errologin");
%>


<!DOCTYPE html>
<html>
<head>
    <title>Bookstore</title>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Dosis&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<header>
	<nav class="navbar navbar-dark bg-dark">
  		<a class="navbar-brand" href="#">Bookstore</a>
	</nav>       
</header>
<div class="container mt-3">

<%
	if(erroLogin == null) {
%>
	<h1>Perfil de Usuário</h1>
	<div class="card" style="width: 18rem;">
	  <img class="card-img-top" src="https://lh3.googleusercontent.com/proxy/weCCysukZJZDp1O1_Ot1Qy6l9TvliDJ5vNjYLMvy1Up6WZaNPqNNH0rIYPSUFQU_GBRLfCMQDWuF-6CeDVL30R3dfVdxva4RXKpc_xZpvNOndTG8A2EBBgRRzRnzCn1y2S9pikFJYt5vlHgju5VO" alt="Card image cap">
	  <div class="card-body">
	    <h5 class="card-title"><%= nomeUsuario %></h5>
	    <p class="card-text"></p>
	    <a href="/bookstore/ListaLivros" class="btn btn-primary">Loja</a>
	  </div>
	</div>
	<p></p>

<%} else { %>

	<div class="alert alert-danger" role="alert">
	  <%= erroLogin %>
	</div>	
	
<%} %>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
