/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author ACER
 */
public class Product {
    private int pID;
    private int cateID;
    private String title;
    private int price;   
    private String image_link; 
    private String status;
    private String description;
    private String size;
    private String color;
    private float rating;
    private Date import_date;

    public Product(int pID, int cateID, String title, int price, String image_link, String status, String description, String size, String color, float rating, Date import_date) {
        this.pID = pID;
        this.cateID = cateID;
        this.title = title;
        this.price = price;
        this.image_link = image_link;
        this.status = status;
        this.description = description;
        this.size = size;
        this.color = color;
        this.rating = rating;
        this.import_date = import_date;
    }

    public int getpID() {
        return pID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage_link() {
        return image_link;
    }

    public void setImage_link(String image_link) {
        this.image_link = image_link;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public Date getImport_date() {
        return import_date;
    }

    public void setImport_date(Date import_date) {
        this.import_date = import_date;
    }

    @Override
    public String toString() {
        return "Product{" + "pID=" + pID + ", cateID=" + cateID + ", title=" + title + ", price=" + price + ", image_link=" + image_link + ", status=" + status + ", description=" + description + ", size=" + size + ", color=" + color + ", rating=" + rating + ", import_date=" + import_date + '}';
    }

   
}
