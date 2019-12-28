/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.daos;

import ductn.db.MyConnection;
import ductn.dtos.OrdersDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LEGION
 */
public class OrdersDAO implements Serializable{
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
    
    public List<OrdersDTO> findOrderByUsername(String username) throws Exception {
        List<OrdersDTO> result = new ArrayList<>();
        String sql = "SELECT orderid, dateorder, total FROM Orders WHERE usernameid = ?";
        try {
            OrdersDTO dto;
            int orderid;
            Date date;
            int total;
           conn = MyConnection.getMyConnection();
           preStm = conn.prepareStatement(sql);
           preStm.setString(1, username);
           rs = preStm.executeQuery();
            while (rs.next()) {                
                orderid = rs.getInt("orderid");
                date = rs.getDate("dateorder");
                total = rs.getInt("total");
                dto = new OrdersDTO(orderid, total, date);
                result.add(dto);
            }
            
        } finally {
            closeConnection();
        }
        
        return result;
    } 
}
