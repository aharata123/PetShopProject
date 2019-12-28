/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.controllers;

import ductn.constant.WebConstant;
import ductn.dtos.AccountDTO;
import ductn.dtos.ErrorDTO;
import ductn.models.AccountBean;
import ductn.models.ProcessBean;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LEGION
 */
public class CreateController extends HttpServlet {

    private static final String FAIL = "create.jsp";
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "myfolder/user/logged/edit-user.jsp";

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
        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        String url = ERROR;
        try {
            ProcessBean bean = new ProcessBean();
            bean.setUsername(username);
            if (bean.findByPrimaryKey() != null) {
                ErrorDTO error = new ErrorDTO();
                error.setError("Duplicate username");
                request.setAttribute(WebConstant.MESSAGE, error);
                url = FAIL;
            } else {
                AccountDTO dto = new AccountDTO(username, password, lastName, firstName);
                AccountBean accountBean = new AccountBean();
                accountBean.setDto(dto);
                accountBean.setRoleID(WebConstant.USER);
                if (accountBean.insert()) {
                    HttpSession session = request.getSession();
                    AccountDTO user = bean.findByUsername();
                    session.setAttribute("USER", user);
                    url = SUCCESS;
                    response.sendRedirect(url);
                    return;
                } else {
                    ErrorDTO error = new ErrorDTO();
                    error.setError("Something just happens");
                    request.setAttribute(WebConstant.MESSAGE, error);
                    url = FAIL;
                }
            }

        } catch (Exception e) {
            log("ERROR at CreateController : " + e.getMessage());
        } 
            request.getRequestDispatcher(url).forward(request, response);
        

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
