/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Model.Product;
import Utils.DBUtils;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author ACER
 */
public class ProductManager {
    public List<Product> getAllProduct(){
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
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
        } catch (Exception e){ 
        }
        return list;
    }
    
    public static void main(String[] args) {
        ProductManager pd = new ProductManager();
        List<Product> list = pd.getAllProduct();
        for (Product i : list){
        System.err.println(i);
    }
    }
}
