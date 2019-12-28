/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.controllers;

import ductn.constant.WebConstant;
import ductn.daos.PurcharseDAO;
import ductn.dtos.AccountDTO;
import ductn.dtos.ErrorDTO;
import ductn.dtos.OrdersDTO;
import ductn.models.ManagementCart;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LEGION
 */
public class CheckOutController extends HttpServlet {

    private static final String FAIL = "ViewCartController";

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
        String url = FAIL;
        try {
            HttpSession session = request.getSession(false);
            ManagementCart managercart = (ManagementCart) session.getAttribute("CART");
            String confirmQuantity = managercart.checkQuantityInDB();
//            System.out.println(managercart.getCart());
            if (confirmQuantity.equals("")) {
                String total = request.getParameter("total");
                java.util.Date uDate = new java.util.Date();
                java.sql.Date date = new Date(uDate.getTime());
                AccountDTO dto = (AccountDTO) session.getAttribute("USER");
                String username = dto.getUsername();
                OrdersDTO orders = new OrdersDTO(Integer.parseInt(total), username, date);
                PurcharseDAO dao = new PurcharseDAO();
                if (dao.checkOut(orders, managercart)) {
                    session.removeAttribute("CART");
                    session.removeAttribute("TOTAL");
                    session.setAttribute("SUCCESS", "Check out successfull");
                } else {
                    ErrorDTO error = new ErrorDTO();
                    error.setError("Error has been occur when check out. Please try again later");
                    session.setAttribute(WebConstant.MESSAGE, error);
                }

            } else {
                ErrorDTO error = new ErrorDTO();
                error.setError(confirmQuantity);
                session.setAttribute(WebConstant.MESSAGE, error);
            }
        } catch (Exception e) {
            log("ERROR AT CheckOutController : " + e.getMessage());
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
