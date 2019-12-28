/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.models;

import ductn.daos.AccessoryDAO;
import ductn.daos.AccountDAO;
import ductn.dtos.AccessoryDTO;
import ductn.dtos.AccountDTO;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author LEGION
 */
public class ProcessBean implements Serializable{
    private String username;
    private String password;
    
    private AccessoryDTO acessoryDTO;
    private String accessoryID;
    private boolean isDelete;
    private String search;

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }
    
    

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }
    

    public String getAccessoryID() {
        return accessoryID;
    }

    public void setAccessoryID(String accessoryID) {
        this.accessoryID = accessoryID;
    }

    public AccessoryDTO getAcessoryDTO() {
        return acessoryDTO;
    }

    public void setAcessoryDTO(AccessoryDTO acessoryDTO) {
        this.acessoryDTO = acessoryDTO;
    }

    public ProcessBean() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public int login() throws Exception {
        AccountDAO dao = new AccountDAO();
        return dao.login(username, password);
    }
    
    public AccountDTO findByPrimaryKey() throws Exception {
        AccountDAO dao = new AccountDAO();
        return dao.findByPrimaryKey(username);
    }
    
    public AccountDTO findByUsername() throws Exception {
        AccountDAO dao = new AccountDAO();
        return dao.findByUser(username);
    }
    
    public List<AccessoryDTO> getAllAccessories() throws Exception{
        AccessoryDAO dao = new AccessoryDAO();
        return dao.getList();
    }
    
    public boolean insertAccessory() throws Exception {
        AccessoryDAO dao = new AccessoryDAO();
        return dao.insert(acessoryDTO);
    }
    
    public boolean deleteAccessory() throws Exception {
        AccessoryDAO dao = new AccessoryDAO();
        return dao.delete(accessoryID);
    }

    public AccessoryDTO findAcessoryByPrimaryKey() throws Exception {
        AccessoryDAO dao = new AccessoryDAO();
        return dao.findByPrimaryKey(accessoryID, isDelete);
    }
    
    public boolean updateAccessory() throws Exception {
        AccessoryDAO dao = new AccessoryDAO();
        return dao.update(acessoryDTO);
    }
    
    public List<AccessoryDTO> findByAccessoryName() throws Exception {
        AccessoryDAO dao = new AccessoryDAO();
        return dao.findByAccessoryName(search);
    }
}
