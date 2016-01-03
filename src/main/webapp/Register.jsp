<!-- Early register prototype to test register functionality -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
	<p>Create an account</p>

	<form name="myForm" method="post" action="Register">
		Full name: <input type="text" name="fullname"> <br>
		Create Username: <input type="text" name="username"> <br>
		Create Password: <input type="password" name="password"> <br>
		Email: <input type="text" name="email"> <br> <input
			type="radio" name="type" value="0"> I am a student <input
			type="radio" name="type" value="1"> I am a teacher <br>
		Add class code: <input type="text" value="" name="classcode">
		<input type="submit" value="Register" />

	</form>
<%
    String fooParameter = request.getParameter( "failure" );
    if ( fooParameter == null )
    {

    }
    else if(fooParameter.equals("invalidUser"))
    {
%>
    <p>Username already Exists!</p>
<%
    }else if(fooParameter.equals("invalidEmail"))
    {
%>
    <p>Email is already taken!</p>
<%
    }else if(fooParameter.equals("invalidClassNoExist"))
    {
%>
    <p>Class not found!</p>
<%
    }else if(fooParameter.equals("invalidClassAlreadyExists"))
    {
%>
    <p>Class code already used!</p>
<%
    }
%>

	<p>
		Already have an account? <a
			href="http://math-afunctions.rhcloud.com/Login.jsp">Login Here</a>
	</p>

</body>
</html>