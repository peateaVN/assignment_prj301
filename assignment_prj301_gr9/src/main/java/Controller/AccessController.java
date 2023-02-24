/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Manager.AccessManager;
import Model.UserSession;
import Utils.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DUNGHUYNH
 */
public class AccessController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
            String path = request.getPathInfo();
            System.out.println(path);
            if (path.equals("/login")){
                
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                
//                HashMap<String,String> errors = new HashMap<String,String>();
//                boolean hasError = false;
//                
//                if (username.trim().equals("")){
//                    
//                    errors.put("username", "Username is empty");
//                    hasError = true;
//                }
//                if (password.trim().equals("")){
//                    errors.put("password", "Password is empty");
//                    hasError = true;
//                 }
//                if (hasError){
//                    
//                        request.setAttribute("errors", errors);
//                        RequestDispatcher rd = request.getRequestDispatcher("/view/login.jsp");
//                        rd.forward(request, response);     
//                    }
//                
//                else{
                    if (username == null){
                        RequestDispatcher rd = request.getRequestDispatcher("/view/login.jsp");
                        rd.forward(request, response);                
                        }
                    AccessManager manager = new AccessManager();
                    UserSession us = manager.login(username, password);
                   
                    if (us != null){
                        HttpSession ss = request.getSession(true);
                        ss.setAttribute("usersession", us);
                        response.sendRedirect(request.getContextPath()+"/Home");
                    }else{
                        HttpSession ss = request.getSession();
                        ss.setAttribute("usersession", null);
                        request.setAttribute("login-msg", "Wrong username or password");
                        RequestDispatcher rd = request.getRequestDispatcher("/view/login.jsp");
                        rd.forward(request, response);
                    }
                
            }else if(path.equals("/signup")){
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String cpassword = request.getParameter("confirmPassword");
                String accName = request.getParameter("accountName");
                String phoneNumber = request.getParameter("phonenumber");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                if (cpassword == null ){
                    RequestDispatcher rd = request.getRequestDispatcher("/view/signup.jsp");
                    rd.forward(request, response);
                }else{
                int age = Integer.parseInt(request.getParameter("age"));    
                AccessManager manager = new AccessManager();
                UserSession us = manager.signin(username, password, cpassword, accName, age, phoneNumber, email, address);
                HttpSession ss = request.getSession(true);
                ss.setAttribute("usersession", us);
                if (us != null){
                   if( us.getConfirmPassword().equals("")){
                        request.setAttribute("signup-msg", "User "+ us.getUsername() +" already exits");
                        RequestDispatcher rd = request.getRequestDispatcher("/view/signup.jsp");
                        rd.forward(request, response); 
                   }
                  
                   response.sendRedirect(request.getContextPath()+"/view/login.jsp");
                }else{
                    request.setAttribute("signup-msg", "Password not match");
                    RequestDispatcher rd = request.getRequestDispatcher("/view/signup.jsp");
                    rd.forward(request, response);
                }    
                }
            }else if (path.equals("/logout")){
                HttpSession ss = request.getSession();
                ss.setAttribute("usersession", null);
                
                request.setAttribute("login-msg", "");
                RequestDispatcher rd = request.getRequestDispatcher("/view/login.jsp");
                rd.forward(request, response);
            }

        }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AccessController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AccessController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
