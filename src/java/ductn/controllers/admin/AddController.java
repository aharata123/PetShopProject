/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ductn.controllers.admin;

import ductn.constant.WebConstant;
import ductn.dtos.AccessoryDTO;
import ductn.dtos.ErrorDTO;
import ductn.models.ProcessBean;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author LEGION
 */
@MultipartConfig
public class AddController extends HttpServlet {

    private static final String url = "ShowAllController";

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
        Part filePart = request.getPart("img"); // Retrieves <input type="file" name="file">
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
//        System.out.println("file name : " + fileName);
        
        
        
        String name = request.getParameter("txtName");
        String price = request.getParameter("txtPrice");
        String description = request.getParameter("txtDescription");
        String quantity = request.getParameter("txtQuantity");
        try {
            ProcessBean bean = new ProcessBean();
            AccessoryDTO dto = new AccessoryDTO(Integer.parseInt(price), name, description,fileName, Integer.parseInt(quantity));
            bean.setAcessoryDTO(dto);
            uploadImg(request, fileName, filePart);
            if (bean.insertAccessory()) {
                HttpSession session = request.getSession(false);
                ErrorDTO mess = new ErrorDTO();
                mess.setMessage("Add Successfull");
                session.setAttribute(WebConstant.MESSAGE, mess);

            } else {
                HttpSession session = request.getSession(false);
                ErrorDTO mess = new ErrorDTO();
                mess.setError("Add Failed");
                session.setAttribute(WebConstant.MESSAGE, mess);
            }

        } catch (Exception e) {
            log("Error at AddController : " + e.getMessage());
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

    private void uploadImg(HttpServletRequest request, String fileName, Part filePart) throws Exception {
//        String app = request.getServletContext().getRealPath("");
//        for(int i = 0; i < 3; i++) {
//        int end = app.lastIndexOf("\\");
//        app = app.substring(0, end);
//        }
        
//        System.out.println(app);
        File uploads = new File("C:/Upload");
        if(!uploads.exists()) {
            uploads.mkdir();
        }
        File file = new File(uploads,fileName);

        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
    }

}
