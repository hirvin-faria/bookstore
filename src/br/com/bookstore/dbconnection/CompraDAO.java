package br.com.bookstore.dbconnection;

import java.sql.*;

import static java.sql.DriverManager.println;


public class CompraDAO {

    private static final Dao dao = new Dao();

    //retorna o id do usuario ou -1 se não existir
    public Boolean finalizarCompra(Integer userId, Integer bookId, Integer numItens, String precoFinal) throws Throwable {
        if(dao.connect()){
            try {
                dao.createPreparedStatement("insert into users_purchases(user_id, book_id, num_itens, preco_final) values(?, ?, ?, ?)");
                dao.getStatement().setInt(1,userId);
                dao.getStatement().setInt(2,bookId);
                dao.getStatement().setInt(3,numItens);
                dao.getStatement().setString(4,precoFinal);

                ResultSet rs=dao.executeQuery();
                dao.close();
                if(rs.next()) {
                    rs.close();
                    return true;
                } else {
                    return false;
                }
            } catch (Exception e) {
            	throw new Throwable("Erro na query: " + e.getMessage());
            }
        }
        throw new Throwable("Erro ao conectar ao banco: " + dao.getErro());
    }
}
