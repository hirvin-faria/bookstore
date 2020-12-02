package br.com.bookstore;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Adicionar Metodo POST para Login de Usuarios
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//carrega dados de usuario
		String nomeUsuario = request.getParameter("nomeusuario");
		String senha = request.getParameter("senha");

		UsuarioDAO UsuarioDAO = new UsuarioDAO();
		Usuario usuario;
		
		try {
			
			usuario = UsuarioDAO.login(nomeUsuario, senha);
			RequestDispatcher reqDispat = request.getRequestDispatcher("perfilUsuario.jsp");
			request.getSession().setAttribute("nomeUsuario", usuario.getUsername());
			request.getSession().setAttribute("tipoUsuario", usuario.getTipo());
			reqDispat.forward(request, response);
		
		} catch (Throwable e) {
	
			e.printStackTrace();
		
			RequestDispatcher reqDispat = request.getRequestDispatcher("perfilUsuario.jsp");
			request.setAttribute("errologin", "Erro ao Realizar o Login");
			reqDispat.forward(request, response);
		
		}
	}
}
