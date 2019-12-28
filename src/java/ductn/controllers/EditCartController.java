/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.controllers;

import ductn.models.AccessoryBean;
import ductn.models.ManagementCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LEGION
 */
public class EditCartController extends HttpServlet {
private static final String SUCCESS = "edit-cart.jsp";
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
        String url = SUCCESS;
        try {
            String itemID = request.getParameter("itemID");
            String quantity = request.getParameter("quantity");
            HttpSession session = request.getSession(false);
            ManagementCart managercart = (ManagementCart) session.getAttribute("CART");
            List<AccessoryBean> result = new ArrayList<>();
            
            if (Integer.parseInt(quantity) <= 0) {
               
            } else if (managercart == null) {

            } else {
                if (managercart.getCart().containsKey(itemID)) {
                    managercart.getCart().put(itemID, Integer.parseInt(quantity));
                    for (String key : managercart.getCart().keySet()) {
                        int quantityItem = managercart.getCart().get(key);
                        AccessoryBean bean = new AccessoryBean();
                        bean.setAccessoryID(key);
                        bean.findByPrimaryKey();
                        bean.setQuantity(quantityItem);
                        result.add(bean);
                    }
                    session.setAttribute("TOTAL", managercart.getTotalItems());
                    session.setAttribute("VIEWCART", result);
                    session.setAttribute("CART", managercart);
//                    System.out.println(managercart.getCart());
                }

            }

        } catch (Exception e) {
//             log("ERROR AT EditCartController : " + e.getMessage());
        }
        finally {
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
