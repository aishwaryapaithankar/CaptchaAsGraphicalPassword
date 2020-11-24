<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Captcha As A Graphical Password : A New Security Primitive Based On Hard AI Problem </title>

<!-- SET: FAVICON -->
<link rel="shortcut icon"  href="images/applications.png" />
<!-- END: FAVICON -->

<!-- SET: STYLESHEET -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- END: STYLESHEET -->


<script type="text/javascript"></script>
<script type="text/javascript" src="md5.js"></script>
<script type="text/javascript" src="jcap.js"></script>


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
<script>
    function validation(){
        var uname=document.ureg.username.value;
        var pass=document.ureg.password.value;
        var cpass=document.ureg.cpassword.value;
        var mail=document.ureg.mail.value;
        var name=document.ureg.name.value;
        var ph=document.ureg.mobile.value;
        
        if(name==0){
            alert("Enter name");
            document.ureg.name.focus();
            return false;
        }
        if(uname==0){
            alert("Enter username");
            document.ureg.username.focus();
            return false;
        }
        if(pass==0){
            alert("Enter password");
            document.ureg.password.focus();
            return false;
        }
        if(cpass!=pass){
            alert("Incorrect password");
            document.ureg.cpassword.focus();
            return false;
        }
        
        
        if(mail==0){
            alert("Enter mailid");
            document.ureg.mail.focus();
            return false;
        }
        if(ph==0){
            alert("Enter your mobile no");
            document.ureg.mobile.focus();
            return false;
        }
         if(isNaN(ph)){
                 alert("Invalid phoneno");
                 document.ureg.mobile.focus();
                 return  false;
            }
         if(document.ureg.uword.value==0){
                 alert("Enter word and select repected image");
                document.ureg.uword.focus();
                 return  false;
            }
    }
</script>
<style>
    input{
        width: 200px;
        height: 20px;
    }
</style>

</head>

<body>
<%
if(request.getParameter("status")!=null){
   out.println("<script>alert('Registered !...')</script>"); 
}
if(request.getParameter("user")!=null){
   out.println("<script>alert('username already exist...'); document.ureg.username.focus();</script>"); 
}
%>
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
          <li class="last"><a href="home.jsp">Home </a></li>
        <li><a href="register.jsp">Register Page</a></li>
        <li><a href="userid.jsp">User Login</a></li>
        <li><a href="admin.jsp">Admin</a></li>
       
      </ul>
      <div class="clear"></div>
    </div>
  </div>
  <!-- Nav end --> 
  
  <!-- maincontent Starts -->
  <div class="container">
    <div class="container-in"> <img src="images/container-bg.jpg" width="940" height="327" alt="img" />
        
        <center>
     
            <h2 style="color: sienna">USER REGISTRATION</h2><br></br>
             <fieldset>
    
                 <form action="registration" name="ureg" method="post"  onsubmit="return validation()"> 
<!--                  USERNAME:<br>-->
<input type="text" name="name" placeholder="Enter your name" ><br></br>
<input type="text" name="username" placeholder="Enter username"><br></br>
<!--                  PASSWORD:<br>-->
<input type="password" name="password" placeholder="Enter password" maxlength="6"><br></br>
    <input type="password" name="cpassword" placeholder="confirm your password" maxlength="6"><br></br>
<input type="email" name="mail" placeholder="Enter your email"><br></br>
<input type="text" name="mobile" placeholder="Enter your mobile no" maxlength="10"><br></br>
    <fieldset>
    <p>Enter code and select respected image:</p> <br>

        <input type="hidden" id="txt" value="" name="txt"/>
        
        <script type="text/javascript"> sjcap();</script><br></br>
    </fieldset>
    <input type="submit"onclick="return jcap3();" value="REGISTER"style="background-color: yellowgreen;color: white; height: 25px"><br></br>
                                                         
    <input type="reset" value="RESET" style="color: #ffffff;background-color: tomato;"></input>               

		</form>
                                       </fieldset>
                                       </center>
        
        </div>
    
     
      <div class="clear"></div>
      <div class="welcome">
        <h5></h5>
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
