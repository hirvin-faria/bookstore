package br.com.bookstore.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.bookstore.dbconnection.LivroDAO;
import br.com.bookstore.models.Livro;

/**
 * Servlet implementation class ListaLivrosServlet
 */
@WebServlet("/ListaLivros")
public class ListaLivrosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * retorna a lista de livros disponiveis
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Exibindo lista de livros disponiveis");
		
		LivroDAO livroDAO = new LivroDAO();
		
		try {
			List<Livro> livros = livroDAO.getLivrosDB();
			if(livros == null) {
				System.out.println("Livros null: deu ruim na query banco");
				livros = livroDAO.getLivros();
			}
			
			RequestDispatcher reqDispat = request.getRequestDispatcher("listaLivros.jsp");
			request.setAttribute("livros", livros);
			reqDispat.forward(request, response);
		}catch(Throwable e) { 
			System.out.println(e); 
			
			List<Livro> livros = livroDAO.getLivros();
			RequestDispatcher reqDispat = request.getRequestDispatcher("listaLivros.jsp");
			request.setAttribute("livros", livros);
			reqDispat.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
