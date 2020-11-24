package actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Dbconnection;
import pack.MailUtil;
public class user_login extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
                      HttpSession user=request.getSession();
                      String uname=user.getAttribute("uname").toString();
            
           //String uname=request.getParameter("username");
            String pass=request.getParameter("password");
            String uword=request.getParameter("uword");
            
          Connection con= Dbconnection.getConn();
          Statement st=con.createStatement();
          Statement st1=con.createStatement();
          ResultSet rt=st.executeQuery("select * from user_reg where username='"+uname+"'");
          if(rt.next()){
              String p=rt.getString("password");
              String uw=rt.getString("image_word");
              String activate=rt.getString("activate");
              
              if(pass.equalsIgnoreCase(p)){
                  if(uw.equalsIgnoreCase(uword)){
                      
                  if(activate.equalsIgnoreCase("yes")){

                      //out.println("success");
                       response.sendRedirect("user_page.jsp");
                  }
                  else{
                      out.println("Your not Yet Activeted");
                  }
                  }
                  else{
                      String[] mail=new String[]{rt.getString("mail")};

                      String sub="Account";
                      String msg="your account has been blocked due to some person tried to access your account just now....";
                     
                      new MailUtil().sendMail(mail,mail, sub, msg);
                      st1.executeUpdate("update user_reg set activate='no' where username='"+uname+"'");
                      response.sendRedirect("user_login.jsp?status='invalid'");
                  }
              }
              else{
                  out.println("incorrect password");
              }
          }
          else{
              out.println("Incorrect username");
          }
        }
        catch(Exception e){
            out.println(e);
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
