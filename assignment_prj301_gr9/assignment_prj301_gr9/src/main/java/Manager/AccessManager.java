package Manager;

import Model.UserSession;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author DUNGHUYNH
 */
public class AccessManager {
    
    public UserSession login (String username, String password) throws Exception{
      String sql="select account_ID, account_username, account_password, isAdmin from Account;";
        Connection conn = DBUtils.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
        String uname= rs.getString("account_username");
        String upass= rs.getString("account_password");
        if (username.equals(uname) && password.equals(upass)){
            UserSession us =  new UserSession();
            us.setUsername(uname);
            us.setPassword(upass);
            us.setLoginDate(new Date());
            us.setAccessRight(rs.getInt("isAdmin"));
            return us;
            }
        }
        return null;
        
    }
     public UserSession signin (String username,String password, String confirm_password, String accname, int age, String phonenumber, String email, String address) throws Exception{

      String sql="insert into Account ([account_username], [account_password], [isAdmin], [account_name], [account_age], [account_phone], [account_email], [account_address], [order_ID])";
      String sqlAll="select account_ID, account_username, account_password, isAdmin from Account;";
      String sqlAlldesc="select account_ID, account_username, account_password, isAdmin from Account ORDER BY account_ID DESC;";
      String sqlReset1="SET IDENTITY_INSERT [dbo].[Account] ON;";
      String sqlReset2="SET IDENTITY_INSERT [dbo].[Account] OFF;";
      
        if (password.trim().equals(confirm_password.trim())){
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sqlAll); 
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                String uname= rs.getString("account_username");
                if(username.equals(uname)){
                   UserSession us =  new UserSession();
                   us.setUsername(username);
                   us.setConfirmPassword("");
                   return us; 
                }
            }
            ps = conn.prepareStatement(sqlAlldesc); 
            rs = ps.executeQuery();
            int last_id = 0;
            if(rs.next()){
            last_id = (Integer.parseInt(rs.getString("account_ID")));}

            sql += " values(?,?,0,?,?,?,?,?,NULL);";
            
            ps = conn.prepareStatement(sqlReset1); 
            ps.execute();

            String sqlReset =" DBCC CHECKIDENT (Account, RESEED, ?)";
            ps = conn.prepareStatement(sqlReset); 
            ps.setInt(1, last_id);
            ps.execute();
            ps = conn.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,password);
            ps.setString(3, accname);
            ps.setInt(4, age);
            ps.setString(5, phonenumber);
            ps.setString(6, email);
            ps.setString(7, address);
            ps.executeUpdate();
            
            ps = conn.prepareStatement(sqlReset2); 
            ps.execute();
            
            ps = conn.prepareStatement(sqlAll);
            rs = ps.executeQuery();
            while (rs.next()){
                String uname= rs.getString("account_username");
                if(!username.equals(uname)){
                    UserSession us =  new UserSession();
                    us.setUsername(username);
                    us.setPassword(password);
                    us.setConfirmPassword(confirm_password);
                    us.setLoginDate(new Date());
                    us.setAccessRight(rs.getInt("isAdmin"));
                    return us;
                }
               
            }
            
        }
        return null;
        
    }

}
