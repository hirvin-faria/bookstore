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
	
	<!-- area do CSS -->
	<style>
	
	*
	{
	    padding: 0;
	    margin: 0;
	    font-family: 'Inconsolata', monospace;
	    box-sizing: border-box;	
	}
	
	
	#produtos
	{
	    max-width: 900px;
	    margin: 0 auto;
	    padding: 0 2%;
	    display: flex;
	    text-align: center;
	    /*flex-wrap: wrap; responsivo aqui! */
	}
	
	#carrinho
	{
	    max-width: 900px;
	    margin: auto;
	    padding: 0 2%;
	    display: black;
	    /* text-align: center; */
	}
	
	
	
	.produto-single
	{
	    width: 33.3%;
	    margin-right: 2%;
	    /* padding: 0, 20px; */
	    margin-top: 20px;
	    margin-bottom: 20px;
	    /* border: 1px solid silver; */
	    font-size: 1.1em;
	}
	
	.produto-single img
	{
	    max-width: 100%;
	}
	
	.produto-single a
	{
	    text-decoration: none;
	    color: white;
	    background-color: #5fb382;
	    display: block;
	    padding: 4px 0;
	    font-size: 18px;
	}
	
	
	#finalizar-compra	
	
	{
	    text-decoration: none;
	    margin-top: 10px;
	    color: white;
	    background-color: #5fb382;
	    padding: 10px 5px;
	}
	
	h2
	{
	    background-color: #4c3282;
	    text-align: center;
	    padding: 10px 0;
	    color: white;
	    font-weight: bold;
	}
	
	h2:hover
	{
	    color: yellow
	}
	
	.info-single-checkout
	{
	    text-align: center;
	    padding: 10px 0;
	    font-size: 1.1em;
	    font-weight: bold;
	    text-align: left;
	    padding: 5px;
	}
	
	/* area do media query */
	
	</style>


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

<script>

        inicializarLoja = () => {
            var containerProdutos = document.getElementById('produtos');
            itens.map((val)=>{
                containerProdutos.innerHTML += `
                
                <div class="produto-single">
                    <img src="`+val.img+`"/>
                    <p>`+val.nome+`</p>
                    <br>
                    <p>Preço R$: `+val.precoUnitario+`</p>
                    <br>
                    <a key="`+val.id+`" href="#">Comprar<a/>
                </div>

                `;
            })

        }

inicializarLoja();

        atualizarCarrinho = () => 
        {
            var containerCarrinho = document.getElementById('carrinho');
            containerCarrinho.innerHTML = "";
            itens.map((val)=>{
                if(val.quantidade > 0)
                containerCarrinho.innerHTML += `
                <div class="info-single-checkout"
                <p>Livro: `+val.nome+`</p>
                <p>Quantidade: `+val.quantidade+` </p>
                <p>Preço final: `+val.quantidade * val.precoUnitario+` </p>        
                <p>Comprador: `+val.comprador+` </p>        
                <br>        
                <a id="finalizar-compra" key="`+val.id+`" href="index2.html">Finalizar a compra<a/>        
                </div>        
        
                `;        

            })        
        }        
        

     var links = document.getElementsByTagName('a');        
            for(var i = 0; i < links.length; i++)        
            {        
                links[i].addEventListener("click", function(){        
                    let key = this.getAttribute('key');        
                    itens[key].quantidade++;        
                    atualizarCarrinho();        
                    return false;        
                })        
            }           
</script>
</body>
</html>