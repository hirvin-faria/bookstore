<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore</title>
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
	<div class="container">
	<h1>Carrinho:</h1>
	<br>
	<br>
	<p>Dados da Compra</p>
	<form action="/bookstore/FinalizaCompraServlet" method="POST">
	
		<input name="titulo" class="form-control" type="text" value="Clean Code" readonly>
		<input name="autor" class="form-control" type="text" value="Robert Cecil Martin" readonly>
		<input name="preço" class="form-control" type="text" value="80.00" readonly>
		<input name="quantidade" class="form-control" type="number" >
		
		<button type="submit" class="btn btn-primary mt-5">Comprar</button>
		
	</form>
	
		
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>