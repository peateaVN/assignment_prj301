/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author DUNGHUYNH
 */
public class UserSession {
    
    private String username;
    private int accessRight;
    private String password;
    private String confirmPassword;

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public Date getLoginDate() {
        return loginDate;
    }

    public int getAccessRight() {
        return accessRight;
    }

    public void setAccessRight(int accessRight) {
        this.accessRight = accessRight;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }
    private Date loginDate;

    /**
     * Get the value of username
     *
     * @return the value of username
     */
    public String getUsername() {
        return username;
    }

    /**
     * Set the value of username
     *
     * @param username new value of username
     */
    public void setUsername(String username) {
        this.username = username;
    }

}
