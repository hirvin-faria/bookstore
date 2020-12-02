package br.com.bookstore;

import java.sql.*;

import static java.sql.DriverManager.println;

class UsuarioDAO {

    private static final Dao dao = new Dao();

    //retorna o id do usuario ou -1 se não existir
    public Usuario login(String username, String passwd) throws Throwable {
        if(dao.connect()){
            try {
                dao.createPreparedStatement("select id, name, profile from users_conf where username=? and password=?");
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
                    user.setTipo(rs.getInt("profile"));
                    rs.close();
                    return user;
                } else {
                    return null;
                }
            } catch (Exception e) {
                println(e.getMessage());
                throw new Throwable("Erro ao fazer login: " + e.getMessage(), e);
            }
        }
        throw new Throwable("Erro ao conectar ao banco: " + dao.getErro());
    }

    public Integer register(String nome, String username, String passwd, Integer tipo) throws Throwable {
        if(dao.connect()){
            try {
                dao.createPreparedStatement("insert into users_conf(name, username, password, tipo) values (1, 2, 3, 4) returning id");
                dao.setString(1, nome);
                dao.setString(2, username);
                dao.setString(3, passwd);
                dao.setString(4, tipo.toString());

                ResultSet rs=dao.executeQuery();
                dao.close();
                if(rs.next()) {
                    Integer id = rs.getInt(1);
                    rs.close();
                    return id;
                } else {
                    return -1;
                }
            } catch (Exception e) {
                println(e.getMessage());
                throw new Throwable("Erro ao fazer cadastro: " + e.getMessage(), e);
            }
        }
        throw new Throwable("Erro ao conectar ao banco: " + dao.getErro());
    }
}
