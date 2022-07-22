/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.mycart.servlets;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.helper.Factoryprovider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class ProductOperationServlet extends HttpServlet {

    private Category categoey;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            
           // servlet 2:
           // add category
           // add product
           
           String op=request.getParameter("operation");
           
           if(op.trim().equals("addcategory")){
               // add  category
           
                String title=request.getParameter("catTitle");
                String description=request.getParameter("catDescription");
                
               Category category = new Category();
               category.setCategoryTitle(title);
               category.setCategoryDescription(description);
               
               // category database save:
               CategoryDao categoryDao = new CategoryDao(Factoryprovider.getFactory());
               int catId=categoryDao.saveCategory(category);
               
              // out.println("Category Saved");
              // Redirect message to admin page
              
               HttpSession httpsession=request.getSession();
               httpsession.setAttribute("message", "Category Added Successfully");
               response.sendRedirect("admin.jsp");
               return;
           }else if(op.trim().equals("addproduct")){
               // add product
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
