/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Model.User;
import Model.UserSession;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class AdminManager {
    public List<User> getAllUser(){
        List<User> us = new ArrayList<>();;
        String sql="select account_ID, account_username, account_password, isAdmin, account_name, account_age, account_email, account_address from Account;";
        try{
        Connection conn = DBUtils.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
//            us.setUserID(rs.getInt("account_ID"));
//            us.setUsername(rs.getString("account_username"));
//            us.setPassword(rs.getString("account_password"));
//            us.setAccessRight(rs.getInt("isAdmin"));
//            us.setName(rs.getString("account_name"));
//            us.setAge(rs.getInt("account_age"));
//            us.setEmail(rs.getString("account_email"));
//            us.setAddress(rs.getString("account_address"));
              us.add(new User(
                      rs.getInt(1),
                      rs.getString(2),
                      rs.getString(3),
                      rs.getInt(4),
                      rs.getString(5),
                      rs.getInt(6),
                      rs.getString(7),
                      rs.getString(8)
                       ));
            }
            
        }catch (Exception e){
            System.out.println(e);
        }
        return us;
    }
        
    }

