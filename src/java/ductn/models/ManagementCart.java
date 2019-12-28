/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.models;

import ductn.daos.AccessoryDAO;
import java.io.Serializable;
import java.util.HashMap;

/**
 *
 * @author LEGION
 */
public class ManagementCart implements Serializable{
    private HashMap<String, Integer> cart; 
    
    
//    String : id, Integer : quantity
    public ManagementCart(HashMap<String, Integer> cart) {
        this.cart = cart;
    }

    public ManagementCart() {
    }

    public HashMap<String, Integer> getCart() {
        return cart;
    }

    public void setCart(HashMap<String, Integer> cart) {
        this.cart = cart;
    }

    public int getTotalItems() {
        int quantity = 0;
        for(String key : cart.keySet()) {
            int items = cart.get(key);
            quantity = quantity + items;
        }
        return quantity;
    }
    
    public String checkQuantityInDB()  throws Exception{
        AccessoryDAO dao = new AccessoryDAO();
        return dao.checkQuantity(cart);
    }
    
}
