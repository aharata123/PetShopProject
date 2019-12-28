/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.daos;

import ductn.db.MyConnection;
import ductn.dtos.PetDTO;
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
public class PetDAO implements Serializable {

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

    public List<PetDTO> searchByOwner(String owner) throws Exception {
        List<PetDTO> result = new ArrayList<>();
        try {
            PetDTO dto;
            String sql = "SELECT petid, name, age, typeid FROM Pet WHERE owner = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, owner);
            rs = preStm.executeQuery();
            while (rs.next()) {
                int petId = rs.getInt("petid");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                int typeid = rs.getInt("typeid");
                dto = new PetDTO(name, age, typeid, petId);
                result.add(dto);
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updatePet(PetDTO dto) throws Exception {
        boolean check = false;
        String sql = "UPDATE Pet SET name = ?, age = ?, typeid = ? WHERE petid = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getName());
            preStm.setInt(2, dto.getAge());
            preStm.setInt(3, dto.getTypeId());
            preStm.setInt(4, dto.getPetId());
            check = preStm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }

        return check;
    }

    public boolean insertPet(PetDTO dto) throws Exception {
        boolean check = false;
        String sql = "INSERT INTO Pet(owner, name, age, typeid) VALUES(?,?,?,?)";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getOwner());
            preStm.setString(2, dto.getName());
            preStm.setInt(3, dto.getAge());
            preStm.setInt(4, dto.getTypeId());
            check = preStm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean deletePet(int id) throws Exception {
        boolean check = false;
        String sql = "DELETE FROM Pet WHERE petid = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, id);
            check = preStm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }

        return check;
    }
}
