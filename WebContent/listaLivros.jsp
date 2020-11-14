<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, br.com.bookstore.Livro" %>

<% 

	List<Livro> livros = (List<Livro>)request.getAttribute("livros"); 

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
<main>
	<section class="container mt-3">
		<div class="row">
    		<div class="col-8">
      			<h2>Livros Disponiveis</h2>                
    			<p>Nossos livros disponiveis para compra</p>
    		</div>
    		<div class="col-4 ">
      			<a href="login.jsp"><button type="button" class="btn btn-primary" ">Login</button></a>
    		</div>
    	</div>
		<table class="table mt-5">
        	<thead>
	           	<tr>
	            	<th scope="col">Título</th>
	                <th scope="col">Autor</th>
	                <th scope="col">Preço</th>
	                <th scope="col">Comprar</th>
	         	</tr>
      		</thead>
          	<tbody id="lista-livros">
          	<%for (Livro livro : livros) { %>
            	<tr class="livro">
	               	<td class="info-titulo"><%= livro.getTitulo() %></td>
	                <td class="info-genero"><%= livro.getAutor() %></td>
	                <td class="info-editora"><%= livro.getPreco() %></td>
	                <td class="info-avaliacao"><button type="button" class="btn btn-success">Comprar</button></td>
              	</tr>
            <%}%>
          	</tbody>
      	</table>
	</section>
</main>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>