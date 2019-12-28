/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.daos;

import ductn.db.MyConnection;
import ductn.dtos.OrdersDTO;
import ductn.models.ManagementCart;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

/**
 *
 * @author LEGION
 */
public class PurcharseDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public boolean checkOut(OrdersDTO dto, ManagementCart managercart) throws Exception {
        boolean check = false;
        String sql = "INSERT INTO Orders(usernameid, dateorder, total) VALUES(?,?,?)";
        try {
            HashMap<String, Integer> cart = managercart.getCart();
            conn = MyConnection.getMyConnection();

            conn.setAutoCommit(false);
            preStm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preStm.setString(1, dto.getUsername());
            preStm.setDate(2, dto.getDate());
            preStm.setInt(3, dto.getTotal());
            preStm.executeUpdate();

            rs = preStm.getGeneratedKeys();
            int orderid;
            rs.next();
            orderid = rs.getInt(1);
            String sqltoDetails = "INSERT INTO Details(orderid, accessoryid, quantity) VALUES (?,?,?)";
            preStm = conn.prepareStatement(sqltoDetails);
            for (String key : cart.keySet()) {
                preStm.setInt(1, orderid);
                preStm.setInt(2, Integer.parseInt(key));
                preStm.setInt(3, cart.get(key));
                preStm.executeUpdate();
            }

            for (String key : cart.keySet()) {
                String sqltoAccessory = "SELECT quantity FROM Accessory WHERE accessoryid = ?";
                preStm = conn.prepareStatement(sqltoAccessory);
                preStm.setInt(1, Integer.parseInt(key));
                rs = preStm.executeQuery();
                rs.next();
                int quantity = rs.getInt("quantity");
                int newQuantity = quantity - cart.get(key);
                String sqloUpdateAccessory = "UPDATE Accessory SET quantity = ? WHERE accessoryid = ? ";
                preStm = conn.prepareStatement(sqloUpdateAccessory);
                preStm.setInt(1, newQuantity);
                preStm.setInt(2, Integer.parseInt(key));
                preStm.executeUpdate();
            }
            check = true;
            conn.commit();

        } catch (Exception e) {
            conn.rollback();
            throw new Exception("Transaction failed");
        }
        finally {
            closeConnection();
        }

        return check;
    }
}
