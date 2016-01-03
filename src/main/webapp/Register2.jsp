<!-- Template taken from http://getbootstrap.com/getting-started/ --> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- iconj.com favicon code -->
	<link rel="shortcut icon" href="http://www.iconj.com/icon.php?pid=uh6iyjirgy" type="image/x-icon" />
	<link rel="shortcut icon" href="http://www.iconj.com/gif_icon.php?pid=uh6iyjirgy" type="image/gif" /> 
	<!-- end of iconj.com favicon code -->

    <title>Register</title>

    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/signin/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="http://getbootstrap.com/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">
		<!-- Main Body -->
      <form class="form-signin" method="post" action="Register">
        <h2 class="form-signin-heading">Register</h2>
        <label for="inputName" class="sr-only">Email address</label>
        <input type="text" id="inputName" class="form-control" name="fullname" placeholder="Full Name" required autofocus/>
        
        <p></p>
        <label for="inputEmail" class="sr-only">Password</label>
        <input type="text" name="email" id="inputPassword" class="form-control" placeholder="Email" required/>
        
        <p></p>
        <label for="inputUsername" class="sr-only">Password</label>
        <input type="text" id="inputPassword" class="form-control" name="username" placeholder="Username" required/>
      
        <p></p>
        <label for="inputPassword" class="sr-only">Retype Password</label>
        <input type="password" id="inputPassword" class="form-control" name="password" placeholder="Password" required/>
    
    	<p></p>
        <label for="inputClass" class="sr-only">Class Code</label>
        <input type="text" id="inputClass" class="form-control" name="classcode" placeholder="Class Code" required>
        
        <div></div>
        <input type="radio" name="type" value="0"> I am a student 
        <input type="radio" name="type" value="1"> I am a teacher 
        <div></div>
        
        <button class="btn btn-lg btn-primary btn-block" type="submit" value="Register">Register</button>
        
        Already have an account? Login <a href="http://math-afunctions.rhcloud.com/Login2.jsp">here</a>
      </form>
   
<!-- Error messages -->
<%
    String fooParameter = request.getParameter( "failure" );
    if ( fooParameter == null )
    {

    }
    else if(fooParameter.equals("invalidUser"))
    {
%>
    <div class="alert alert-warning alert-dismissible" role="alert">
  	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  	<strong>Warning!</strong> Username has been taken.
	</div>
<%
    }else if(fooParameter.equals("invalidEmail"))
    {
%>
    <div class="alert alert-warning alert-dismissible" role="alert">
  	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  	<strong>Warning!</strong> Email has been taken.
	</div>
<%
    }else if(fooParameter.equals("invalidClassNoExist"))
    {
%>
    <div class="alert alert-warning alert-dismissible" role="alert">
  	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  	<strong>Warning!</strong> Class does not exist.
	</div>
<%
    }else if(fooParameter.equals("invalidClassAlreadyExists"))
    {
%>
    <div class="alert alert-warning alert-dismissible" role="alert">
  	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  	<strong>Warning!</strong> Class already exists.
	</div>
<%
    }
%>


    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>