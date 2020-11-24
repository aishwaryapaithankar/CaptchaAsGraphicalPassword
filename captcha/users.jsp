<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Captcha As A Graphical Password : A New Security Primitive Based On Hard AI Problem </title>

<!-- SET: FAVICON -->
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<!-- END: FAVICON -->

<!-- SET: STYLESHEET -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- END: STYLESHEET -->

<!-- SET: SCRIPTS -->
<script type="text/javascript"></script>
<!-- END: SCRIPTS -->

<meta name="description" content="Your description"/>
<meta name="keywords" content="keyword1 keyword2"/>

<!--[if lt IE 8]>
<style type="text/css">
	.header-container	{ padding-bottom:0;}
	.welcome	{ padding-top:12px;}
    .container	{ padding-bottom:0;}
    .footer-in	{ padding-bottom:0;}
</style>
<![endif]-->

<style>
    table,tr,td{
        border-collapse: collapse;
        border-style: solid;
    }
    table{
        width: 750px;
    }
    td{
        text-align: center;
       
    }
    a{
        color: #666666;
    }
</style>
</head>

<body>

<!-- wrapper starts -->
<div class="wrapper"> 
  
  <!-- Header Starts -->
  <div class="header">
    <div class="header-container">
         <p style="font-size: 25px;color: #ffffff"> Captcha as Graphical Passwords-A New Security
Primitive Based on Hard AI Problems</p>
      <div class="logo"> <a href="#"></a> </div>
      <div class="toll-free">
        <p></p>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <!-- Header ends --> 
  
  <!-- Nav start -->
  <div class="nav">
    <div class="nav-in">
     <ul>
          
        <li><a href="">Users</a></li>
        <li><a href="activities.jsp">Activities</a></li>
        <li><a href="home.jsp">Logout</a></li>
     
     
      </ul>
      <div class="clear"></div>
    </div>
  </div>
  <!-- Nav end --> 
  
  <!-- maincontent Starts -->
  <div class="container">
    <div class="container-in"> <img src="images/container-bg.jpg" width="940" height="327" alt="img" />
    
      
       
        </div>
    
     
      <div class="clear"></div>
      <%
Connection con=Dbconnection.getConn();
Statement st =con.createStatement();
ResultSet rt=st.executeQuery("SELECT * FROM `captcha`.`user_reg`");   
%>
      <div class="welcome" >
          <center style="color: #666666">
          <table>
              <tr style="background-color: burlywood;font-size: 15px;color: #666666">
                  <td>USERNAME</td><td>NAME</td><td>PASSWORD</td><td>MAILID</td><td>PHONE NO</td><td>STATUS</td><td>ACTIVATE</td>
              </tr>
              <%
while(rt.next()){
    
String id=rt.getString("iduser_reg");
%>
<tr style="font-size: 15px;">
                 <td><%=rt.getString("username")%></td><td><%=rt.getString("name")%></td><td>******</td><td><%=rt.getString("mail")%></td> <td><%=rt.getString("phoneno")%></td> <td><%=rt.getString("activate")%></td>
                 <% if(rt.getString("activate").equalsIgnoreCase("no")){
                                     %>
                                     <td><a href="activate?<%=id%>" style="color: #666666">Activate</a></td> 
                 <%}
                  else{
                     %>
                  <td><a href="deactivate?<%=id%>" style="color: #666666">Deactivate</a></td>
                 <%
 }                 
%>
              </tr>
              <%
}              
%>
          </table>
          </center>
        <p><a href="#"></a></p>
      </div>
      <div class="bottom-cont1">
        <h6></h6>
        <p> </p>
      </div>
      <div class="bottom-cont1">
        <h6></h6>
        <ul>
          <li><a href="#"></a></li>
          <li><a href="#"></a></li>
          <li><a href="#"></a></li>
          <li><a href="#"></a></li>
          <li><a href="#"></a></li>
          <li><a href="#"></a></li>
          <li><a href="#"> </a></li>
          <li><a href="#"></a></li>
        </ul>
      </div>
      <div class="bottom-cont1 last">
        <h6></h6>
        <span></span>
        <p></p>
        <span></span>
        <p></p>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <!-- aincontent ends --> 
  
  <!-- footer starts -->
  <div class="footer">
    <div class="footer-in">
      <div class="social-icons">
        <ul>
          <li><a href="#"></a></li>
          <li><a href="#"></a></li>
          <li class="last"></a></li>
        </ul>
        <div class="clear"></div>
      </div>
      <div class="copy">
   
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <!-- footer ends --> 
  
</div>
<!-- wrapper ends -->

</body>
</html>
