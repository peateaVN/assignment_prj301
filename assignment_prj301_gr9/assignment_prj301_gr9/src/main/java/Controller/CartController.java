/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Manager.CartManager;
import Manager.ProductManager;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CartController", urlPatterns = {"/Cart"})
public class CartController extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String pid= request.getParameter("pID");
            String dpid = request.getParameter("id");
            String quantity = request.getParameter("product-quanity");
            
            String action = request.getParameter("action");
            
            if (pid == null ){
            ProductManager pd = new ProductManager();
            List<Product> list = pd.getAllProduct();
            request.setAttribute("listProduct", list);
            RequestDispatcher rd = request.getRequestDispatcher("Shop.jsp");
            rd.forward(request, response);
        }else if (pid != null && quantity != null && action == null) {
            int npid = Integer.parseInt(pid);
            int nquan = Integer.parseInt(quantity);
            ProductManager pd = new ProductManager();
            Product list = pd.searchProductByPidP(npid);
            HttpSession session = request.getSession();
            if (session == null){
                session = request.getSession(true);
            }
            CartManager cart = (CartManager) session.getAttribute("cart");
            if (cart == null) {
                cart = new CartManager();
            }
            cart.add(npid, nquan, list);
            
            session.setAttribute("cart", cart);
            RequestDispatcher rd = request.getRequestDispatcher("Cart.jsp");
            rd.forward(request, response);
        }else if (action.equals("Remove")){           
            int npid = Integer.parseInt(dpid);
            HttpSession session = request.getSession();            
            if (session != null){
                CartManager cart = (CartManager) session.getAttribute("cart");               
                if (cart != null){
                    if (cart.getCart().containsKey(npid)){                       
                        cart.remove(npid);
                        session.setAttribute("cart", cart);
                        RequestDispatcher rd = request.getRequestDispatcher("Cart.jsp");
                        rd.forward(request, response);
                    }
                }
            }
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
