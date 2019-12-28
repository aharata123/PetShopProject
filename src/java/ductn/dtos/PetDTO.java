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
public class PetDTO implements Serializable{
    private String name;
    private int age, typeId, petId;
    private String owner;

    public PetDTO(String name, int age, int typeId, String owner) {
        this.name = name;
        this.age = age;
        this.typeId = typeId;
        this.owner = owner;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public PetDTO(String name, int age, int typeId, int petId) {
        this.name = name;
        this.age = age;
        this.typeId = typeId;
        this.petId = petId;
    }

    public int getPetId() {
        return petId;
    }

    public void setPetId(int petId) {
        this.petId = petId;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }
}
