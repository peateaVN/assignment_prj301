/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Model.Category;
import Model.Product;
import Utils.DBUtils;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ACER
 */
public class ProductManager {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();

        String sql = "select [product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date] from Product ";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getFloat(10),
                        rs.getDate(11)
                ));
            }

            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchProduct(int cateId) {
        List<Product> list = new ArrayList<>();
        String sql = "select [product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date] from [Product] where [category_ID] = ? ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cateId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getFloat(10),
                        rs.getDate(11)
                ));
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public List<Product> searchProductByPid(int pId) {
        List<Product> list = new ArrayList<>();
        String sql = "select [product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date] from [Product] where [product_ID] = ? ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getFloat(10),
                        rs.getDate(11)
                ));
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public List<Product> searchProduct(String searchByTitle) {
        List<Product> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            String sql = "select * from Product where title like ? ;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchByTitle + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getFloat(10),
                        rs.getDate(11)
                ));
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void createProduct(String pID, String cateID, String title, String price, String image_link, String status, String description, String size, String color, String rating, String import_date) {
        String sql = "insert into Product (product_ID, category_ID, title, price, image_link, status, description, size, color, rating, import_date)\n"
                + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pID);
            ps.setString(2, cateID);
            ps.setString(3, title);
            ps.setString(4, price);
            ps.setString(5, image_link);
            ps.setString(6, status);
            ps.setString(7, description);
            ps.setString(8, size);
            ps.setString(9, color);
            ps.setString(10, rating);
            ps.setString(11, import_date);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    

    public void updateProductByID(String pID, String title, String price, String image_link, String status, String description, String size, String color, String rating, String import_date) {
        String sql = "update Product set title = ?, price = ?, image_link = ?, status = ?, description =  ?, size = ?, color = ?, rating = ?, import_date = ?\n"
                + "where product_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, price);
            ps.setString(3, image_link);
            ps.setString(4, status);
            ps.setString(5, description);
            ps.setString(6, size);
            ps.setString(7, color);
            ps.setString(8, rating);
            ps.setString(9, import_date);
            ps.setString(10, pID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void updateProductByID(String pID, String cateID, String title, String price, String image_link, String status, String description, String size, String color, String rating, String import_date) {
        String sql = "update Product set category_ID = ?, title = ?, price = ?, image_link = ?, status = ?, description = ?, size = ?, color = ?, rating = ?, import_date = ?\n"
                + "where product_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cateID);
            ps.setString(2, title);
            ps.setString(3, price);
            ps.setString(4, image_link);
            ps.setString(5, status);
            ps.setString(6, description);
            ps.setString(7, size);
            ps.setString(8, color);
            ps.setString(9, rating);
            ps.setString(10, import_date);
            ps.setString(11, pID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteProductByID(String pID){
        String sql = "delete Product where product_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public String checkDuplicateID(String id) {
        String sql = "select product_ID from Product";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String pID = rs.getString(1);
                if (pID.equals(id)) {
                    return null;
                }
            }
        } catch (Exception e) {
        }
        return id;
    }

    public Product getProductByID(String id) {
        String sql = "select * from Product where product_ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getFloat(10),
                        rs.getDate(11));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public Product searchProductByPidP(int pId){
        Product list = null;
        String sql = "select [product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date] from [Product] where [product_ID] = ? ";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list = new Product();
                list.setpID(rs.getInt("product_ID"));
                list.setCateID(rs.getInt("category_ID"));
                list.setTitle(rs.getString("title"));
                list.setPrice(rs.getInt("price"));
                list.setImage_link(rs.getString("image_link"));
                list.setStatus(rs.getString("status"));
                list.setDescription(rs.getString("description"));
                list.setSize(rs.getString("size"));
                list.setColor(rs.getString("color"));
                list.setRating(rs.getInt("rating"));
                list.setImport_date(rs.getDate("import_date"));
            }
           conn.close();
        } catch (Exception e){ 
            System.out.println(e);
        }
        return list;
       }
    
    
    
    public static void main(String[] args) {
        ProductManager pd = new ProductManager();
        List<Product> list = pd.searchProduct("T-shirt");
        for (Product i : list) {
            System.err.println(i);
        }
    }
}
