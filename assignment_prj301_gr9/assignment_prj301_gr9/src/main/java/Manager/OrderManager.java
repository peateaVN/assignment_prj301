/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Model.Order;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ADMIN
 */
public class OrderManager {
    public Order addOrder(String shipping, int price, String payment){
        String sql = "insert into [Order] ([shipping_method], [total_price], [date_ordered], [payment_method], [status])";
        String sqlAll = "select [order_ID], [shipping_method], [total_price], [date_ordered], [payment_method], [status] from [Order];";
        String sqlDESC = "select [order_ID] from [Order] ORDER BY [order_ID] DESC;";
        String sqlReset =" DBCC CHECKIDENT ([Order], RESEED, ?)";
        Order order = null;
        long millis=System.currentTimeMillis();  
        java.sql.Date date=new java.sql.Date(millis);  
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sqlDESC);
            ResultSet rs = ps.executeQuery();
            int last_oid = 0;
            
            if (rs.next()){
                last_oid = (Integer.parseInt(rs.getString("order_ID")));}
                
            ps = conn.prepareStatement(sqlReset); 
            ps.setInt(1, last_oid);
            ps.execute(); 
            
            sql += " values(?,?,?,?,'ongoing');";
            ps = conn.prepareStatement(sql);
            ps.setString(1, shipping);
            ps.setInt(2, price);
            ps.setDate(3, date);
            ps.setString(4, payment);
            ps.executeUpdate();
            
            
            ps = conn.prepareStatement(sqlAll);
            rs = ps.executeQuery();
            while (rs.next()){
                int order_id = rs.getInt("order_ID");
                if ((last_oid+1) != order_id) {
                    order = new Order();
                    order.setOrderID(last_oid +1);
                    order.setShipmethod(shipping);
                    order.setPrice(price);
                    order.setDate(date);
                    order.setPaymethod(payment);
                    order.setStatus("ongoing");
                }
            
            }
            return order;
        }catch(Exception e){
            System.out.println(e);
        }
        return order;
    }
}
