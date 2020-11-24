<%@page import="java.sql.ResultSet"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<script type="text/javascript">
<!--

var Point = 1;
var X1, Y1, X2, Y2;

function FindPosition(oElement)
{
  if( typeof( oElement.offsetParent ) != "undefined" )
  {
    for( var posX = 0, posY = 0; oElement; oElement = oElement.offsetParent )
    {
      posX += oElement.offsetLeft;
      posY += oElement.offsetTop;
    }
    return [ posX, posY ];
  }
  else
  {
    return [ oElement.x, oElement.y ];
  }
}
 
function GetCoordinates(e)
{
 var PosX = 0;
 var PosY = 0;
 var ImgPos;
 ImgPos = FindPosition(myImg);
 if (!e) var e = window.event;
 if (e.pageX || e.pageY)
 {
  PosX = e.pageX;
  PosY = e.pageY;
 }
 else if (e.clientX || e.clientY)
   {
    PosX = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
    PosY = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
 }
 PosX = PosX - ImgPos[0];
 PosY = PosY - ImgPos[1];
 if (Point == 1)
 {
   X1 = PosX;
   Y1 = PosY;
   Point = 2;
 
   document.getElementById("x1").value = PosX;
   document.getElementById("y1").value = PosY;
//   document.getElementById("x1").innerHTML = PosX;
//   document.getElementById("y1").innerHTML = PosY;
 }
 else
 {
   X2 = PosX;
   Y2 = PosY;
   Point = 3;
   
    <%
String x2="<script>document.writeln(PosX)</script>";   
String y2="<script>document.writeln(PosY)</script>";  
%>
   document.getElementById("x2").value = PosX;
   document.getElementById("y2").value = PosY;
   document.form1.drawbutton.disabled = false;
 }
}

function Clear()
{
  Point = 1;
  document.getElementById("x1").innerHTML = '';
  document.getElementById("y1").innerHTML = '';
  document.getElementById("x2").innerHTML = '';
  document.getElementById("y2").innerHTML = '';
  document.form1.drawbutton.disabled = true;
  myImg.src = "rectangle.asp";
}

function Draw()
{
  myImg.src = "rectangle.asp?x1=" + X1 + "&y1=" + Y1 + "&x2=" + X2 + "&y2=" + Y2;
  document.form1.drawbutton.disabled = true;
}

function Initialisation()
{ 
  document.form1.drawbutton.disabled = true
}

//-->
</script>

</head>

<body onload="Initialisation();">
<%
if(request.getParameter("status")!=null){
    out.println("<script>alert('uploded...')</script>");
}
%>
<!-- wrapper starts -->
<div class="wrapper"> 
  
  <!-- Header Starts -->
  <div class="header">
    <div class="header-container">
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
          
        <li><a href="">Upload</a></li>
        <li><a href="download.jsp">Download</a></li>
      <li class="last"><a href="home.jsp">Logout </a></li>
        
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
      <div class="welcome">
<!--          <%
String id=request.getQueryString();

HttpSession user=request.getSession();  
String u=user.getAttribute("uname").toString();  

Connection con=Dbconnection.getConn();
Statement st=con.createStatement();
ResultSet rt=st.executeQuery("select filename from file where idfile='"+id+"'");
String fname=null;
while(rt.next()){
  fname=rt.getString("filename");  
}

%>    
%>
<center><h5 style="color: brown">  Welcome ! <%=u%></h5></center>-->
<center>
    
<div STYLE="">
    <p>Click on the image to set the coordinates.</p><br>
        

    <img src="images/ajith.jpg" width="400" height="300" alt="" id="myImgId" /><br>
    <br>
 <form  action="download?<%=id%>"name="form1" method="post" onsubmit="">
        
        <h5>FileName :<%=fname%></h5><br>
            <p><strong>First Point:</strong></p><br>
    <p>X: <input type="text" id="x1" name="xx1"></input></p><br>
<p>Y: <input type="text" id="y1" name="yy1"></input></p><br>
<p><strong>Second Point:</strong></p><br>
<p>X: <input type="text" id="x2" name="xx2"></input></p><br>
    <p>Y: <input type="text" id="y2"  name="yy2"></input></p><br></br>
  

        <input type="submit" value="submit" style="background-color: cadetblue;width: 80px"></input>
        <input type="reset" value="Reset" style="background-color: tomato;width: 70px"
</br>
</form>

<script type="text/javascript">

var myImg = document.getElementById("myImgId");
myImg.onmousedown = GetCoordinates; 
//-->
</script>

</div>
</center>
          
        <p><a href="#"></a></p>
      </div>
      <div class="bottom-cont1">
        <h6></h6>
        <p> </p>
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
