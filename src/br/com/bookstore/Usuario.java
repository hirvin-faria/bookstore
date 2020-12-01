package br.com.bookstore;

import java.io.PrintWriter;
import java.sql.ResultSet;

public class Usuario {
	
    

	private Integer id;
	private String name;
    private String username;
    private String password;
    private Integer tipo;  
    
    
    public Boolean cadastra() {
    	
    	// criar usuário no banco
    	
    	return true;
    }
    
    public Boolean login() {
    	
    	try {
            Dao dao= new UsuarioDAO();  // Adicionar Classe da Juliana
            if(dao.connect()){
            	try {    
            		dao.createPreparedStatement("select 1 from usuarios where login=? and senha=?"); // Consulta
            		dao.setString(1, this.username); // Valor um
            		dao.setString(2, this.password); // valor senha
            		ResultSet rs=dao.executeQuery();
            		if(rs.next()) {
            			return true;                       
            		} else {    
            			return false;
            		}
            		
            		rs.close();
            		dao.close();
            	} catch(Exception e) {
                  
            	}    
            } else {
            	return true;
            }
        }
    }
	
	public String getName() {
		return username;
	}

	public void setName(String username) {
		this.username = username;
	}
    
    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getTipo() {
		return tipo;
	}

	public void setTipo(Integer tipo) {
		this.tipo = tipo;
	}

	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id; 
	}
}
