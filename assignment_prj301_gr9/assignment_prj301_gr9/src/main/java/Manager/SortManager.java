/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Model.Category;
import Model.Product;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class SortManager {
    public List<Category> getAllCategory(){
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Category (rs.getInt(1),
                                    rs.getString(2),
                                    rs.getString(3)
                                    ));
                

                
            }
        } catch (Exception e){ 
        }
        return list;
    }
    
    public List<Product> sortProductByNew() {
        List<Product> list = new ArrayList<>();

        String sql = "select [product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date] "
                + "from Product order by [import_date] desc ";

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
    
    public List<Product> sortProductByRating() {
        List<Product> list = new ArrayList<>();

        String sql = "select [product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date] from Product order by [rating] desc ";

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

    public List<Product> sortProductByPriceAsc() {
        List<Product> list = new ArrayList<>();
        
        String sql = "select [product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date] "
                + "from Product order by [price] asc ";
        
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
    
    public List<Product> sortProductByPriceDesc() {
        List<Product> list = new ArrayList<>();

        String sql = "select [product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date] "
                + "from Product order by [price] desc ";

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
    
    public static void main(String[] args) {
        SortManager sm = new SortManager();
        List<Product> list1 = sm.sortProductByRating();
        for (Product i : list1){
            System.out.println(i);
        }
    }
}
