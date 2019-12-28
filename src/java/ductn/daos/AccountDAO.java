/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.daos;

import ductn.constant.WebConstant;
import ductn.db.MyConnection;
import ductn.dtos.AccountDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LEGION
 */
public class AccountDAO implements Serializable {

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

    public int login(String username, String password) throws Exception {
        int role = WebConstant.FAIL;
        try {
            String sql = "SELECT roleid FROM Account WHERE username = ? AND password = ? AND isdeleted = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, password);
            preStm.setBoolean(3, false);
            rs = preStm.executeQuery();
            if (rs.next()) {
                role = rs.getInt("roleid");
            }

        } finally {
            closeConnection();
        }
        return role;
    }

    public AccountDTO findByPrimaryKey(String id) throws Exception {
        AccountDTO dto = null;
        try {
            String sql = "SELECT password, lastname, firstname FROM Account WHERE username = ? AND isdeleted = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            preStm.setBoolean(2, false);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String password = rs.getString("password");
                String lastName = rs.getString("lastname");
                String firstName = rs.getString("firstname");
                dto = new AccountDTO(id, password, lastName, firstName);
            }

        } finally {
            closeConnection();
        }

        return dto;
    }

    public AccountDTO findByUser(String id) throws Exception {
        AccountDTO dto = null;
        try {
            String sql = "SELECT password, lastname, firstname, address, phonenumber, email, roleid FROM Account WHERE username = ? AND isdeleted = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            preStm.setBoolean(2, false);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String password = rs.getString("password");
                String lastName = rs.getString("lastname");
                String firstName = rs.getString("firstname");
                String address = rs.getString("address");
                String phonenum = rs.getString("phonenumber");
                String email = rs.getString("email");
                int roleid = rs.getInt("roleid");
                dto = new AccountDTO(id, password, lastName, firstName, email, phonenum, address, roleid);
            }

        } finally {
            closeConnection();
        }

        return dto;
    }

    public boolean insert(AccountDTO dto, int roleID) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO Account(username, password, lastname, firstname, roleid, isdeleted) VALUES (?,?,?,?,?,?)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getUsername());
            preStm.setString(2, dto.getPassword());
            preStm.setString(3, dto.getLastName());
            preStm.setString(4, dto.getFirstName());
            preStm.setInt(5, roleID);
            preStm.setBoolean(6, false);
            check = preStm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }

        return check;
    }

    public boolean update(AccountDTO dto, int roleID) throws Exception {
        boolean check = false;
        try {
            String sql = "UPDATE Account SET password = ?, lastname = ?, firstname = ?, roleid = ?, address = ?, phonenumber = ?, email = ?, isdeleted = ? WHERE username = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getPassword());
            preStm.setString(2, dto.getLastName());
            preStm.setString(3, dto.getFirstName());
            preStm.setInt(4, roleID);
            preStm.setString(5, dto.getAddress());
            preStm.setString(6, dto.getPhoneNum());
            preStm.setString(7, dto.getEmail());
            preStm.setBoolean(8, false);
            preStm.setString(9, dto.getUsername());
            check = preStm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }

        return check;
    }

    public List<AccountDTO> search(String name) throws Exception {
        List<AccountDTO> result = new ArrayList<>();
        try {
            String username;
            String password;
            String lastName;
            String firstName;
            String email;
            String phoneNum;
            String address;
            String sql = "SELECT username, password, lastName, firstName, email, phonenumber, address, roleid FROM Account WHERE username LIKE ? AND isdeleted = ?";
            int roleId;
            AccountDTO dto;
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            preStm.setBoolean(2, false);
            rs = preStm.executeQuery();
              while (rs.next()) {
                username = rs.getString("username");
                password = rs.getString("password");
                lastName = rs.getString("lastName");
                firstName = rs.getString("firstName");
                email = rs.getString("email");
                phoneNum = rs.getString("phonenumber");
                address = rs.getString("address");
                roleId = rs.getInt("roleid");
                dto = new AccountDTO(username, password, lastName, firstName, email, phoneNum, address, roleId);
                result.add(dto);
            }

        } finally {
            closeConnection();
        }

        return result;
    }
    
    public boolean deleteAccount(String username) throws Exception {
        boolean check = false;
        String sql = "UPDATE Account SET isdeleted = ? WHERE username = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setBoolean(1, true);
            preStm.setString(2, username);
            check = preStm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }
        
        return check;
    }
}
