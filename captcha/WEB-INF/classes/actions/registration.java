package actions;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Dbconnection;

public class registration extends HttpServlet {

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
            String name=request.getParameter("name");
            String uname=request.getParameter("username");
            String pass=request.getParameter("password");
            String mail=request.getParameter("mail");
            String ph=request.getParameter("mobile");
            String uword=request.getParameter("uword");
            
          
            String an=request.getParameter("txt");
            
           // out.println(" value"+an);
            
          
            
          Connection con= Dbconnection.getConn();
          
          Statement st=con.createStatement();
          ResultSet rt=st.executeQuery("select username from user_reg where username='"+uname+"'");
          if(rt.next()){
              response.sendRedirect("register.jsp?user='exist'");
          }
          else{
         PreparedStatement ps=con.prepareStatement("insert into user_reg(username, name, password, mail, phoneno, activate,image_word,anum)value(?,?,?,?,?,?,?,?)");
         ps.setString(1, uname);
         ps.setString(2, name);
         ps.setString(3, pass);
         ps.setString(4, mail);
         ps.setString(5, ph);
         ps.setString(6, "no");
         ps.setString(7, uword);
         ps.setString(8, an);
         ps.execute();
//          Statement st=con.createStatement();
//           int i=st.executeUpdate("insert into user_reg (username,name,password,mail,phoneno,activate)values('"+uname+"','"+name+"','"+pass+"','"+mail+"','"+ph+"','no')");
//          
//           if(i!=0){
//              response.sendRedirect("register.jsp?status='registered'");
//               
//          }
         response.sendRedirect("register.jsp?status='registered'");
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
