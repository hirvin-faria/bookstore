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
		Usuario usuario = new Usuario();
		
		// seta os dados do usuário
		usuario.setUsername(nomeUsuario);
		usuario.setPassword(senha);
		
		// Chama o metodo de login
		Boolean loginStatus = true; //usuario.login();
		
		
		if(loginStatus) {
			// Cria sessão com os dados do usuário logado
			RequestDispatcher reqDispat = request.getRequestDispatcher("listaLivros.jsp");
			request.getSession().setAttribute("usuario", usuario.getUsername());
			request.getSession().setAttribute("tipo", usuario.getTipo());
			reqDispat.forward(request, response);
				
		} else {
			// Solicitar ao Lucas a implementação do Erro de Login
			// Envia erro de login
			RequestDispatcher reqDispat = request.getRequestDispatcher("login.jsp");
			request.setAttribute("errologin", "Erro ao Realizar o Login");
			reqDispat.forward(request, response);
		
		}
	}
}
