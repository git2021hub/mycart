
package com.learn.mycart.servlets;

import com.learn.mycart.entities.User;
import com.learn.mycart.helper.Factoryprovider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class RegisterServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            try{
                 String userName=request.getParameter("user_name");
                 String userEmail=request.getParameter("user_email");
                 String userPassword=request.getParameter("user_password");
                 String userPhone=request.getParameter("user_phone");
                 String userAddress=request.getParameter("user_address");
                 
                 // Creating User Object to Store data 
                
                 User user=new User(userName,userEmail,userPassword,userPhone,"defalult.jpg",userAddress,"normal");
                         
                Session hibernatesession= Factoryprovider.getFactory().openSession();
                Transaction tx=hibernatesession.beginTransaction();
                
                int userId=(int)hibernatesession.save(user);
                tx.commit();
                 hibernatesession.close();
                 
                  HttpSession httpsession= request.getSession();
                  httpsession.setAttribute("message","Registred Successfully !!"+userId);
                  response.sendRedirect("register.jsp");
                  return;
                  
                  
               }catch(Exception e){
                e.printStackTrace();
            }
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
