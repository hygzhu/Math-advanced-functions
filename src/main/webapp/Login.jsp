<!-- Not in the website, used this page to test out login functionality -->
`<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>

<body>
	<p>Login</p>

	<form name="myForm" method="post" action="Login">
		Username: <input type="text" name="username" /> <br /> 
		Password: <input type="password" name="password" /> <br /> <input type="submit"
			value="Login" />
	</form>


	<p>
		Don't have an account? <a
			href="http://math-afunctions.rhcloud.com/Register.jsp">Register
			Here</a>
	</p>
	

</body>
</html>