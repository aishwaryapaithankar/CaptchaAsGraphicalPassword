package actions;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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


public class upload extends HttpServlet {
final String filepath="E:/";
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
           String owner=user.getAttribute("uname").toString();
            
                      
            MultipartRequest m=new MultipartRequest(request,filepath);
           File file=m.getFile("file");
           String  x1=m.getParameter("xx1");
            String  y1=m.getParameter("yy1");
             String  x2=m.getParameter("xx2");
              String  y2=m.getParameter("yy2");
              
//           out.println(x1+" "+y1+" "+x2 +" "+y2);
               DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	   //get current date time with Date()
	     Date date = new Date();
	     System.out.println(dateFormat.format(date));
             String time=dateFormat.format(date); 
           
           InputStream is=new FileInputStream(file);
           
           Connection con=Dbconnection.getConn();
           Statement st=con.createStatement();
           PreparedStatement ps=con.prepareStatement("insert into file (filename,file,owner,x1,y1,x2,y2,time)values(?,?,?,?,?,?,?,?)");
           ps.setString(1, file.getName());
           ps.setAsciiStream(2, is);
           ps.setString(3,owner );
           ps.setString(4, x1);
           ps.setString(5, y1);
           ps.setString(6, x2);
           ps.setString(7, y2);
           ps.setString(8, time);
           boolean status= ps.execute();
          
           response.sendRedirect("upload.jsp?status='uploaded'");
//           if(status){
//               out.println("success");
//           }
//           else{
//               out.println("error");
//           }
        } 
        catch(Exception e){
            out.println(e);
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
