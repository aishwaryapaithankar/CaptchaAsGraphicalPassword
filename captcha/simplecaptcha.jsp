<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Captcha As A Graphical Password : A New Security Primitive Based On Hard AI Problem </title>
<link href="styles.css" type="text/css" rel="stylesheet" />
</head>
<body>
<center>
<h3>Simple CAPTCHA Example</h3>
<img id="captcha" src="<c:url value="images/cap.jpg"  />" width="450">

<!--<img id="captcha" src="images/cap.jpg" width="350" height="150">-->
<form action="captchasubmit.jsp" method="post">
    <input type="text" name="answer" /><br>
<input type="submit" value="Submit">
</form>
</center>
</body>
</html>
