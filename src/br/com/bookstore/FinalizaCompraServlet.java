package br.com.bookstore;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FinalizaCompraServlet
 */
@WebServlet("/FinalizaCompraServlet")
public class FinalizaCompraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinalizaCompraServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Livro livroComprado = new Livro();
		livroComprado.setTitulo(request.getParameter("titulo"));
		livroComprado.setPreco(request.getParameter("preço"));
		livroComprado.setAutor(request.getParameter("autor"));
		Integer quantidadeLivro = Integer.parseInt(request.getParameter("quantidade"));
		
		livroComprado.finalizaCompra(quantidadeLivro);
		
		RequestDispatcher reqDispat = request.getRequestDispatcher("finalizacao.jsp");
		reqDispat.forward(request, response);
	}

}
