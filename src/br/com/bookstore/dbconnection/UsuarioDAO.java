package br.com.bookstore.dbconnection;

import java.sql.*;

import br.com.bookstore.models.Usuario;

import static java.sql.DriverManager.println;

public class UsuarioDAO {

    private static final Dao dao = new Dao();
    private static String usarname = "usuario";
    private static String password = "123";
    
    
    public Boolean staticLogin (String nomeUsuario, String passwd) {
    	
    	if (nomeUsuario.equals(usarname) && passwd.equals(password)) {     
            return true;
    	} else {
    		return false;
    	}
    }

    //retorna o id do usuario ou -1 se não existir
    public Usuario login(String username, String passwd) throws Throwable {
        if(dao.connect()){
            try {
                dao.createPreparedStatement("select id, profile from users_conf where username=? and password=?");
                dao.setString(1, username);
                dao.setString(2, passwd);

                ResultSet rs=dao.executeQuery();
                dao.close();
                if(rs.next()) {
                    Usuario user = new Usuario();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setUsername(username);
                    user.setPassword(passwd);
                    user.setTipo(rs.getString("profile")); // Int config via banco
                    rs.close();
                    return user;
                } else {
                    return null;
                }
            } catch (Exception e) {
            	throw new Throwable("Erro na query: " + e.getMessage());
            }
        }
        throw new Throwable("Erro ao conectar ao banco: " + dao.getErro());
    }


    public Usuario register(String username, String passwd, Integer tipo) throws Throwable {
        if(dao.connect()){
            try {
                dao.createPreparedStatement("insert into users_conf(username, password, profile) values (?, ?, ?) returning *");
				
                dao.getStatement().setString(1, username);
                dao.getStatement().setString(2, passwd);
                dao.getStatement().setInt(3, tipo);

                ResultSet rs=dao.executeQuery();
                dao.close();
                if(rs.next()) {
                	Usuario user = new Usuario();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setUsername(username);
                    user.setPassword(passwd);
                    user.setTipo(rs.getString("profile")); // Int config via banco
                    rs.close();
                    return user;
                } else {
                    return null;
                }
            } catch (Exception e) {
                println(e.getMessage());
                return null;
            }
        }
        throw new Throwable("Erro ao conectar ao banco: " + dao.getErro());
    }
}
