/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.dtos;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author LEGION
 */
public class OrdersDTO implements Serializable {
    private int orderid, total;
    private String username;
    private Date date;

    public OrdersDTO(int total, String username, Date date) {
        this.total = total;
        this.username = username;
        this.date = date;
    }

    public OrdersDTO(int orderid, int total, Date date) {
        this.orderid = orderid;
        this.total = total;
        this.date = date;
    }
    
    
    
    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
