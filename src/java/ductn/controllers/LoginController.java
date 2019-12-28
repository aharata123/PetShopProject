/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.controllers;

import ductn.constant.WebConstant;
import ductn.daos.PetDAO;
import ductn.dtos.AccountDTO;
import ductn.dtos.ErrorDTO;
import ductn.dtos.PetDTO;
import ductn.models.ProcessBean;
import java.io.IOException;
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
public class LoginController extends HttpServlet {
private static final String ADMIN = "myfolder/admin/AdminController";
private static final String USER = "myfolder/user/logged/UserController"; 
private final String INVALID = "login.jsp";
private final String ERROR = "error.jsp";
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String url = ERROR;
        try {
            ProcessBean bean = new ProcessBean();
            bean.setUsername(username);
            bean.setPassword(password);
            int role = bean.login();
            if (role == WebConstant.FAIL) {
                url = INVALID;
                ErrorDTO error = new ErrorDTO();
                error.setMessage("Username or Password incorrect");
                request.setAttribute("INVALID", error);
            } else if (role == WebConstant.ADMIN) {
                HttpSession session = request.getSession();
                AccountDTO admin = bean.findByPrimaryKey();
                session.setAttribute("ADMIN", admin);
                url = ADMIN;              
                
            } else if (role == WebConstant.USER) {
                HttpSession session = request.getSession();
                AccountDTO user = bean.findByUsername();
                session.setAttribute("USER", user);
                
                PetDAO dao = new PetDAO();
                List<PetDTO> list = dao.searchByOwner(username);
                session.setAttribute("LISTPET", list);
                url = USER;
            }
            
            
        } catch (Exception e) {
            log("Error at LoginController : " + e.getMessage());
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
