/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.models;

import ductn.daos.AccountDAO;
import ductn.dtos.AccountDTO;
import java.io.Serializable;

/**
 *
 * @author LEGION
 */
public class AccountBean implements Serializable{
    private AccountDTO dto;
    private int roleID;

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
    
    
    public AccountDTO getDto() {
        return dto;
    }

    public void setDto(AccountDTO dto) {
        this.dto = dto;
    }
    
    public boolean insert() throws Exception {
        AccountDAO dao = new AccountDAO();
        return dao.insert(dto, roleID);
    }
    
    public boolean update() throws Exception {
        AccountDAO dao = new AccountDAO();
        return dao.update(dto, roleID);
    }
}
