package br.com.bookstore.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.bookstore.dbconnection.UsuarioDAO;
import br.com.bookstore.models.Usuario;

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
		System.out.println(nomeUsuario);
		System.out.println(senha);

		UsuarioDAO UsuarioDAO = new UsuarioDAO();
		
		Boolean statusLogin = UsuarioDAO.staticLogin(nomeUsuario, senha);
		System.out.println(statusLogin);
		if(statusLogin) {
			Usuario usuario = new Usuario();
			usuario.setId(0);
			usuario.setName("Convidado");
			usuario.setUsername(nomeUsuario);
			usuario.setPassword(senha);
			usuario.setTipo("user");
			
			
			RequestDispatcher reqDispat = request.getRequestDispatcher("perfilUsuario.jsp");
			request.getSession().setAttribute("nomeUsuario", usuario.getUsername());
			request.getSession().setAttribute("tipoUsuario", usuario.getTipo());
			reqDispat.forward(request, response);
		
		} else {
			RequestDispatcher reqDispat = request.getRequestDispatcher("perfilUsuario.jsp");
			request.setAttribute("errologin", "Erro ao Realizar o Login");
			reqDispat.forward(request, response);
		}
		
		
		
		
		try {
			
		} catch (Throwable e) {
	
			e.printStackTrace();
		
		}
	}
}
