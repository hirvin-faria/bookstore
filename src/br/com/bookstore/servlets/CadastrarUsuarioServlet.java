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
 * Servlet implementation class CadastrarUsuario
 */
@WebServlet("/CadastrarUsuario")
public class CadastrarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Adicionar Metodo POST para Cadastro de Usuarios
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Carrega dados de usuario
		String nomeUsuario = request.getParameter("nomeusuario");
		String senha = request.getParameter("senha");
		System.out.println(nomeUsuario);
		System.out.println(senha);
				
		// Chama o metodo de login
		UsuarioDAO dao = new UsuarioDAO();
		
		try {
			Usuario user = dao.register(nomeUsuario, senha, 1);
			
			if(user != null) {
				// Cria sessão com os dados do usuário logado
				RequestDispatcher reqDispat = request.getRequestDispatcher("perfilUsuario.jsp");
				request.getSession().setAttribute("nomeUsuario", user.getUsername());
				request.getSession().setAttribute("tipoUsuario", user.getTipo());
				reqDispat.forward(request, response);
				System.out.println("deu bom");
			} else {
				// Solicitar ao Lucas a implementação do Erro de Cadastro
				// Envia erro de cadastro
				RequestDispatcher reqDispat = request.getRequestDispatcher("perfilUsuario.jsp");
				request.setAttribute("errologin", "Erro ao Realizar o Login");
				reqDispat.forward(request, response);
				System.out.println("deu ruim");
			}
		}catch(Throwable e) { System.out.println(e); }
	}
}
