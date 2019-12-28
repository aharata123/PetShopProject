/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LEGION
 */
public class MainController extends HttpServlet {
private static final String ERROR = "error.jsp";
private static final String LOGIN = "LoginController";
private static final String CREATE = "CreateController";
private static final String PRODUCT = "ShowProductController";
private static final String ADDCART = "AddToCartController";
private static final String VIEWCART = "ViewCartController";
private static final String EDITCART = "EditCartController";
private static final String REMOVEITEM = "RemoveItemController";


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
        String url = ERROR;
        String action = request.getParameter("action");
        try {
            if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("Create")) {
                url = CREATE;
            } else if (action.equals("ShowProduct")) {
                url = PRODUCT;
            } else if (action.equals("AddToCart")) {
                url = ADDCART;
            } else if (action.equals("ViewCart")) {
                url = VIEWCART;
            } else if (action.equals("EditCart")) {
                url = EDITCART;
            } else if (action.equals("RemoveItem")) {
                url = REMOVEITEM;
            }
            else {
                
            } 
        } catch (Exception e) {
            log("Error At MainController : " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
