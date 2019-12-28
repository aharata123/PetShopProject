/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.dtos;

import java.io.Serializable;

/**
 *
 * @author LEGION
 */
public class AccessoryDTO implements Serializable {
    private int accessoryID, price, quantity;
    private String name, description, image;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public AccessoryDTO() {
    }

    public AccessoryDTO(int price, String name, String description) {
        this.price = price;
        this.name = name;
        this.description = description;
    }

    public AccessoryDTO(int price, String name, String description, String image, int quantity) {
        this.price = price;
        this.name = name;
        this.description = description;
        this.image = image;
        this.quantity = quantity;
    }

    public AccessoryDTO(int accessoryID, int price, String name, String description, String image, int quantity) {
        this.accessoryID = accessoryID;
        this.price = price;
        this.name = name;
        this.description = description;
        this.image = image;
        this.quantity = quantity;
    }
    
    
    
    
    
    
    public AccessoryDTO(int accessoryID, int price, String name, String description) {
        this.accessoryID = accessoryID;
        this.price = price;
        this.name = name;
        this.description = description;
    }

    public int getAccessoryID() {
        return accessoryID;
    }

    public void setAccessoryID(int accessoryID) {
        this.accessoryID = accessoryID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }    
}
