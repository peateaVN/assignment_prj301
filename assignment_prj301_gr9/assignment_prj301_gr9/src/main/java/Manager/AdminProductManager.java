/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Model.Product;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class AdminProductManager {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();;
        String sql = "select product_ID, category_ID, title, price, image_link, status, description, size, color, rating, import_date\n"
                + "from Product";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int pID = rs.getInt(1);
                int cateID = rs.getInt(2);
                String title = rs.getString(3);
                int price = rs.getInt(4);
                String image_link = rs.getString(5);
                String status = rs.getString(6);
                String description = rs.getString(7);
                String size = rs.getString(8);
                String color = rs.getString(9);
                float rating = rs.getFloat(10);
                Date import_date = rs.getDate(11);
                list.add(new Product(pID, cateID, title, price, image_link, status, description, size, color, rating, import_date));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}
