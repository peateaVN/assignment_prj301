/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Manager.SortManager;
import Manager.ProductManager;
import Model.Category;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class ShopController extends HttpServlet {

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
        
            /* TODO output your page here. You may use following sample code. */
        String path = request.getPathInfo();
        String catid = request.getParameter("category");
        
        String search = request.getParameter("search");
        
        String sort = request.getParameter("sort");
        
        if (catid == null && search == null && sort == null){
            ProductManager pd = new ProductManager();
            List<Product> list = pd.getAllProduct();
            request.setAttribute("listProduct", list);
            RequestDispatcher rd = request.getRequestDispatcher("Shop.jsp");
            rd.forward(request, response);
        }else if (catid != null ) {
            int ncatid = Integer.parseInt(catid);
            ProductManager pd = new ProductManager();
            List<Product> list = pd.searchProduct(ncatid);
            request.setAttribute("sortList", list);
            RequestDispatcher rd = request.getRequestDispatcher("Shop.jsp");
            rd.forward(request, response);
        }else if (search !=null){
            ProductManager pd = new ProductManager();
            List<Product> list = pd.searchProduct(search);
            System.out.println(search);
            System.out.println("list:"+list);
            request.setAttribute("sortList", list);
            RequestDispatcher rd = request.getRequestDispatcher("Shop.jsp");
            rd.forward(request, response);
        }else if (sort != null){
            SortManager sm = new SortManager();
            if (sort.equals("new")){
                List<Product> list = sm.sortProductByNew();
                request.setAttribute("sortList", list);
                RequestDispatcher rd = request.getRequestDispatcher("Shop.jsp");
                rd.forward(request, response);
            }
            else if (sort.equals("rating")){
                List<Product> list = sm.sortProductByRating();
                request.setAttribute("sortList", list);
                RequestDispatcher rd = request.getRequestDispatcher("Shop.jsp");
                rd.forward(request, response);
            }
            else if (sort.equals("priceLow")){
                List<Product> list = sm.sortProductByPriceAsc();
                request.setAttribute("sortList", list);
                RequestDispatcher rd = request.getRequestDispatcher("Shop.jsp");
                rd.forward(request, response);
            }
            else if (sort.equals("priceHigh")){
                List<Product> list = sm.sortProductByPriceDesc();
                request.setAttribute("sortList", list);
                RequestDispatcher rd = request.getRequestDispatcher("Shop.jsp");
                rd.forward(request, response);
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
