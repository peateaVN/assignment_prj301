/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
<<<<<<< HEAD
 * @author ADMIN
 */
public class Category {
    private int cateID;
    private String cateName;
    private String image_link;

    public Category(int cateID, String cateName, String image_link) {
        this.cateID = cateID;
        this.cateName = cateName;
        this.image_link = image_link;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public String getImage_link() {
        return image_link;
    }

    public void setImage_link(String image_link) {
        this.image_link = image_link;
    }
    
    @Override
    public String toString() {

        return "Category{" + "cateID=" + cateID + ", cateName=" + cateName + ", image_link=" + image_link + '}';
    }

}
