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
	<div class="container mt-3">
		<div class="row" >
			<div class="col-sm">
			
				<h3>Login</h3>
				<form action="/bookstore/LoginServlet" method="POST">
				  <div class="form-group">
				    <label for="exampleInputEmail1">Nome de usuario</label>
				    <input name="nomeusuario" type="text" class="form-control" placeholder="Nome de Usuário">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Senha</label>
				    <input name="senha" type="password" class="form-control" placeholder="Password">
				  </div>
				  <button type="submit" class="btn btn-primary">Logar</button>
				</form>
				
			</div>
			<div class="col-sm">
				
				<h3>Cadastrar</h3>
				<form method="post" action="/bookstore/CadastrarUsuario">
					<div class="form-group">
				    	<label for="exampleInputEmail1">Nome de usuario</label>
				    	<input name="nomeusuario" type="text" class="form-control" placeholder="Nome de Usuário">
				  	</div>
					<div class="form-group">
					    <label for="exampleInputPassword1">Senha</label>
					    <input name="senha" type="password" class="form-control" placeholder="Password">
					</div>
				  	<button type="submit" class="btn btn-primary">Cadastrar</button>
				</form>
				
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>