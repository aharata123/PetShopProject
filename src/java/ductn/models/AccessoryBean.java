/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.models;

import ductn.daos.AccessoryDAO;
import ductn.dtos.AccessoryDTO;
import java.io.Serializable;

/**
 *
 * @author LEGION
 */
public class AccessoryBean implements Serializable {
    private String accessoryID;
    private AccessoryDTO dto;
    private int quantity;
     
    
    public String getAccessoryID() {
        return accessoryID;
    }

    public void setAccessoryID(String accessoryID) {
        this.accessoryID = accessoryID;
    }


    public AccessoryDTO getDto() {
        return dto;
    }

    public void setDto(AccessoryDTO dto) {
        this.dto = dto;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void findByPrimaryKey() throws Exception {
        AccessoryDAO dao = new AccessoryDAO();
        this.dto = dao.findByPrimaryKey(accessoryID, false);
    }
    
}
