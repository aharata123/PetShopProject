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
public class ErrorDTO implements Serializable{
    private String message;
    private String error;

    
    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
}
