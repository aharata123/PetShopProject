/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.daos;

import ductn.db.MyConnection;
import ductn.dtos.AccessoryDTO;
import ductn.models.ManagementCart;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

/**
 *
 * @author LEGION
 */
public class AccessoryDAO implements Serializable {

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

    public List<AccessoryDTO> getList() throws Exception {
        List<AccessoryDTO> result = new ArrayList<>();
        String sql = "SELECT accessoryid, name, price, description, image, quantity FROM Accessory WHERE isDelete = ?";
        int id, price, quantity;
        String name, description, image;
        AccessoryDTO dto;
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setBoolean(1, false);
            rs = preStm.executeQuery();
            while (rs.next()) {
                id = rs.getInt("accessoryid");
                price = rs.getInt("price");
                name = rs.getString("name");
                description = rs.getString("description");
                image = rs.getString("image");
                quantity = rs.getInt("quantity");
                dto = new AccessoryDTO(id, price, name, description, image, quantity);
                result.add(dto);
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insert(AccessoryDTO dto) throws Exception {
        boolean check = false;
        String sql = "INSERT INTO Accessory (name, price, description, isDelete, image, quantity) VALUES (?,?,?,?,?,?)";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getName());
            preStm.setInt(2, dto.getPrice());
            preStm.setString(3, dto.getDescription());
            preStm.setBoolean(4, false);
            preStm.setString(5, dto.getImage());
            preStm.setInt(6, dto.getQuantity());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }

        return check;
    }

    public boolean delete(String id) throws Exception {
        boolean check = false;
        String sql = "UPDATE Accessory SET isDelete = ? WHERE accessoryid = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setBoolean(1, true);
            preStm.setString(2, id);
            check = preStm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }

        return check;
    }

    public AccessoryDTO findByPrimaryKey(String id, boolean isDelete) throws Exception {
        AccessoryDTO dto = null;
        String sql = "SELECT accessoryid, name, price, description, image, quantity FROM Accessory WHERE isDelete = ? AND accessoryid = ?";
        int price, ID, quantity;
        String name, description, image;
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setBoolean(1, isDelete);
            preStm.setString(2, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                ID = rs.getInt("accessoryid");
                price = rs.getInt("price");
                name = rs.getString("name");
                description = rs.getString("description");
                image = rs.getString("image");
                quantity = rs.getInt("quantity");
                dto = new AccessoryDTO(ID, price, name, description, image, quantity);
            }

        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean update(AccessoryDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "UPDATE Accessory SET name = ?, price = ?, description = ?, image = ?, quantity = ? WHERE accessoryid = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getName());
            preStm.setInt(2, dto.getPrice());
            preStm.setString(3, dto.getDescription());
            preStm.setString(4, dto.getImage());
            preStm.setInt(5, dto.getQuantity());
            preStm.setInt(6, dto.getAccessoryID());
            check = preStm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }

        return check;
    }

    public List<AccessoryDTO> findByAccessoryName(String search) throws Exception {
        List<AccessoryDTO> result = new ArrayList<>();
        try {
            int id, price, quantity;
            String name, description, image;
            AccessoryDTO dto;
            String sql = "SELECT accessoryid, name, price, description, image, quantity FROM Accessory WHERE name LIKE ? AND isDelete = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + search + "%");
            preStm.setBoolean(2, false);
            rs = preStm.executeQuery();
            while (rs.next()) {
                id = rs.getInt("accessoryid");
                name = rs.getString("name");
                price = rs.getInt("price");
                description = rs.getString("description");
                image = rs.getString("image");
                quantity = rs.getInt("quantity");
                dto = new AccessoryDTO(id, price, name, description, image, quantity);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public String checkQuantity(HashMap<String, Integer> cart) throws Exception {
        String purchase = "";
        try {
            String sql = "SELECT name, quantity FROM Accessory WHERE accessoryid = ?";
            Set<String> allKey = cart.keySet();
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            int quantity, warehouse;
            for (String key : allKey) {
                preStm.setString(1, key);
                quantity = cart.get(key);
                rs = preStm.executeQuery();
                if (rs.next()) {
                    warehouse = rs.getInt("quantity");
                    if (quantity > rs.getInt("quantity")) {
                        purchase = purchase + rs.getString("name") + " only have " + rs.getInt("quantity") + " left" +",";
                    }
                } else {
                    return "cannot find";
                }
            }
            if(!purchase.equals("")) {
                purchase = purchase.substring(0, purchase.lastIndexOf(","));
            }

        } finally {
            closeConnection();
        }

        return purchase;
    }
}
