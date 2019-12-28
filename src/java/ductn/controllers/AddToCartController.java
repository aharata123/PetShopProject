/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.controllers;

import ductn.constant.WebConstant;
import ductn.dtos.AccountDTO;
import ductn.dtos.ErrorDTO;
import ductn.models.ManagementCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LEGION
 */
public class AddToCartController extends HttpServlet {

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
        String url = "ShowProductController";
        String itemID = request.getParameter("itemID");
        try {
            HttpSession session = request.getSession();
            AccountDTO user = (AccountDTO) session.getAttribute("USER");
            ManagementCart managerCart = (ManagementCart) session.getAttribute("CART");
            if (user != null) {
                if (managerCart == null) {
                    HashMap<String, Integer> cart = new HashMap<>();
                    cart.put(itemID, 1);
                    managerCart = new ManagementCart(cart);
                } else {
                    HashMap<String, Integer> cart = managerCart.getCart();
                    if (cart.containsKey(itemID)) {
                        int quantity = cart.get(itemID);
                        cart.put(itemID, quantity + 1);
                    } else {
                        cart.put(itemID, 1);
                    }
                    managerCart.setCart(cart);
                }
            } else {
                if (managerCart == null) {
                    HashMap<String, Integer> cart = new HashMap<>();
                    cart.put(itemID, 1);
                    managerCart = new ManagementCart(cart);
                } else {
                    HashMap<String, Integer> cart = managerCart.getCart();
                    if (cart.containsKey(itemID)) {
                        int quantity = cart.get(itemID);
                        cart.put(itemID, quantity + 1);
                    } else {
                        cart.put(itemID, 1);
                    }
                    managerCart.setCart(cart);
                }
            }

            session.setAttribute("CART", managerCart);
            session.setAttribute("TOTAL", managerCart.getTotalItems());
            ErrorDTO mess = new ErrorDTO();
            mess.setMessage("Add to cart successfully");
            session.setAttribute(WebConstant.MESSAGE, mess);
//            System.out.println(managerCart.getCart());
//            System.out.println(managerCart.getTotalItems());
        } catch (Exception e) {
            log("Error At AddToCartController : " + e.getMessage());
        } finally {
            response.sendRedirect(url);
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
