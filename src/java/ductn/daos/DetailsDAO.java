/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.daos;

import ductn.db.MyConnection;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

/**
 *
 * @author LEGION
 */
public class DetailsDAO implements Serializable {

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

    public HashMap<String, Integer> findByOrderID(int orderid) throws Exception {
        HashMap<String, Integer> cart = new HashMap<>();
        try {
            String sql = "SELECT accessoryid, quantity FROM Details WHERE orderid = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, orderid);
            rs = preStm.executeQuery();
            while(rs.next()) {
                String id = rs.getString("accessoryid");
                int quantity = rs.getInt("quantity");
                cart.put(id, quantity);
            }            
        } finally {
            closeConnection();
        }

        return cart;
    }
}
