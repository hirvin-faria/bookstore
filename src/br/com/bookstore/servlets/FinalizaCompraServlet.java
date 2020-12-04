package br.com.bookstore.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.bookstore.models.Livro;
import br.com.bookstore.dbconnection.CompraDAO;

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
		
		//CompraDAO dao = new CompraDAO();
		try {
			//Usuario user = dao.register(userId, livroId, quantidadeLivro, preco);
			livroComprado.finalizaCompra(quantidadeLivro);
			
			RequestDispatcher reqDispat = request.getRequestDispatcher("finalizacao.jsp");
			reqDispat.forward(request, response);
			
		}catch(Throwable e) { System.out.println(e); }
		
		
	}

}
