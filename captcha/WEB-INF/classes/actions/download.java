package actions;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Dbconnection;

public class download extends HttpServlet {

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
            String x1=request.getParameter("xx1");
            String y1=request.getParameter("yy1");
            String x2=request.getParameter("xx2");
            String y2=request.getParameter("yy2");
            
           // out.println(x1);
            
            String id=request.getQueryString();
            String fname=null;
           Connection con= Dbconnection.getConn();
          Statement st=con.createStatement();
          Statement st1=con.createStatement();
          
            
          InputStream is=null;
          ResultSet rt=st.executeQuery("select * from captcha.file where idfile='"+id+"' and (x1='"+x1+"' or y1='"+y1+"' or x2='"+x2+"' or y2='"+y2+"')");
          if(rt.next()){
         is=rt.getAsciiStream("file");
         fname=rt.getString("filename");
         
          BufferedReader br=new BufferedReader(new InputStreamReader(is));
         String temp=null;
         StringBuffer sb=new StringBuffer();
         while((temp=br.readLine())!=null){
            sb.append(temp);
         }
          br.close();
          
          response.setHeader("Content-Disposition","attachment;filename=\""+fname+"\"");        
         out.write(sb.toString());
         
          HttpSession user=request.getSession();
           String name=user.getAttribute("uname").toString();
           
             DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	   //get current date time with Date()
	     Date date = new Date();
	     System.out.println(dateFormat.format(date));
             String time=dateFormat.format(date); 
         
         st1.executeUpdate("insert into downloads (filename,name,time)values('"+fname+"','"+name+"','"+time+"')");
         
          }
          is.close();
          
         // response.sendRedirect("download.jsp");
        } 
        catch(Exception e){
            out.println("invalid coordinates....");
        }
        finally {            
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
