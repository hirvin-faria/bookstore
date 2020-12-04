package br.com.bookstore.dbconnection;

import static java.sql.DriverManager.println;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.bookstore.models.Livro;

public class LivroDAO {
	
	private static final Dao dao = new Dao();
	private static List<Livro> lista = new ArrayList<Livro>();
	
	public List<Livro> getLivros() {
		lista.clear();
		
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
		
		return LivroDAO.lista;
	}
	
	public List<Livro> getLivrosDB() throws Throwable{
		lista.clear();
		
		if(dao.connect()){
            try {
                dao.createPreparedStatement("insert into books_conf(nome, autor, preco) values "
                		+ "(?, ?, ?),(?, ?, ?),(?, ?, ?) "
                		+ "on conflict do nothing ");
                
                dao.getStatement().setString(1, "Javascript: O Guia Definitico");
                dao.getStatement().setString(2, "R$120,00");
                dao.getStatement().setString(3, "David Flanagan");
                
                dao.getStatement().setString(4, "Clean Code");
                dao.getStatement().setString(5, "R$80,00");
                dao.getStatement().setString(6, "Robert Cecil Martin");
                
                dao.getStatement().setString(7, "Java Para Iniciantes");
                dao.getStatement().setString(8, "R$100,00");
                dao.getStatement().setString(9, "Herbert Schildt");
                
                dao.execute();
                dao.close();
                
                dao.connect();
                dao.createPreparedStatement("select id, nome, autor, preco from books_conf");
              
                ResultSet rs2=dao.executeQuery();
                dao.close();
                while(rs2.next()) {
                	Livro livroExemplo = new Livro();
                	livroExemplo.setId(rs2.getInt("id"));
            		livroExemplo.setTitulo(rs2.getString("nome"));
            		livroExemplo.setPreco(rs2.getString("preco"));
            		livroExemplo.setAutor(rs2.getString("autor"));
            		
            		lista.add(livroExemplo);                    
                }
                rs2.close();
                return LivroDAO.lista;
                
            } catch (Exception e) {
            	throw new Throwable("Erro na query: " + e.getMessage());
            }
        }
        throw new Throwable("Erro ao conectar ao banco: " + dao.getErro());
	}
}
