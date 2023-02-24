/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Model.Product;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class CartManager {
     private HashMap<Integer, Product> cart; 

    public HashMap<Integer, Product> getCart() {
        return cart;
    }

    public void setCart(HashMap<Integer, Product> cart) {
        this.cart = cart;
    }
    public boolean add(int pid, int quantity, Product p){
        boolean check = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();           
            p.setQuantity( quantity);
        }
//        ProductManager pm = new ProductManager();
//        List<Product> list = pm.searchProductByPid(pid);
        
        if (this.cart.containsKey(pid)) {
            
            int currentQuantity = p.getQuantity();
            
            p.setQuantity(currentQuantity + quantity);
              
        }else{
            p.setQuantity(quantity);
        }
        
        check = true;
        cart.put(pid,p);
        return check;
    }
    public boolean remove(int pid) {
        boolean check = false;
        if(this.cart!=null) {
            if(this.cart.containsKey(pid)) {
                this.cart.remove(pid);
                check = true;
            }
        }
        return check;
    }
}
