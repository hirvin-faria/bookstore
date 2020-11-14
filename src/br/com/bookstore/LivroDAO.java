package br.com.bookstore;

import java.util.ArrayList;
import java.util.List;

public class LivroDAO {
	
	private static List<Livro> lista = new ArrayList<Livro>();
	
	static {
		Livro livroExemplo = new Livro();
		livroExemplo.setTitulo("Livro 1");
		livroExemplo.setPreco("R$100,00");
		livroExemplo.setAutor("Autor Livro 1");
		
		Livro livroExemplo2 = new Livro();
		livroExemplo2.setTitulo("Livro 2");
		livroExemplo2.setPreco("R$80,00");
		livroExemplo2.setAutor("Autor Livro 2");
		
		lista.add(livroExemplo);
		lista.add(livroExemplo2);
	}
	
	public List<Livro> getLivros() {
		return LivroDAO.lista;
	}
}
