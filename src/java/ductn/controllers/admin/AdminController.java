/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.controllers.admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LEGION
 */
@MultipartConfig
public class AdminController extends HttpServlet {
    private static final String HOME = "HomeController";
    private static final String SHOW = "ShowAllController";
    private static final String ERROR = "error.jsp";
    private static final String DASHBOARD = "dashboard.jsp";
    private static final String DELETE = "DeleteController";
    private static final String EDIT = "EditController";
    private static final String UPDATE = "UpdateController";
    private static final String SEARCH = "SearchController";
    private static final String SEARCHUSER = "SearchUserController";
    private static final String DELETEUSER = "DeleteUserController";
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
            if(action.equals("Login")) {
                url = HOME;
            } else if (action.equals("Show")) {
                url = SHOW;
            } else if (action.equals("Dashboard")) {
                url = DASHBOARD;
            } else if (action.equals("Delete")) {
                url = DELETE;
            } else if (action.equals("Edit")) {
                url = EDIT;
            } else if (action.equals("Update")) {
                url = UPDATE;
            } else if (action.equals("Search")) {
                url = SEARCH;
            } else if (action.equals("SearchUser")) {
                url = SEARCHUSER;
            } else if (action.equals("DeleteUser")) {
                url = DELETEUSER;
            }
            else {
                url = ERROR;
            }
           
      } catch (Exception e) {
          log("Error at AdminController : " + e.getMessage());
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
