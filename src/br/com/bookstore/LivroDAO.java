package br.com.bookstore;

import java.util.ArrayList;
import java.util.List;

public class LivroDAO {
	
	private static List<Livro> lista = new ArrayList<Livro>();
	
	static {
		Livro livroExemplo = new Livro();
		livroExemplo.setTitulo("Javascript: O Guia Definitico");
		livroExemplo.setPreco("R$120,00");
		livroExemplo.setAutor("David Flanagan");
		
		Livro livroExemplo2 = new Livro();
		livroExemplo2.setTitulo("Clean Code");
		livroExemplo2.setPreco("R$80,00");
		livroExemplo2.setAutor("Robert Cecil Martin");
		
		Livro livroExemplo3 = new Livro();
		livroExemplo3.setTitulo("Java Para Iniciantes");
		livroExemplo3.setPreco("R$100,00");
		livroExemplo3.setAutor("Herbert Schildt");
		
		
		lista.add(livroExemplo);
		lista.add(livroExemplo2);
		lista.add(livroExemplo3);
	}
	
	public List<Livro> getLivros() {
		return LivroDAO.lista;
	}
}
