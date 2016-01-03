<!-- Intro screen  -->
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

    <title>Math-AF</title>

    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/cover/cover.css" rel="stylesheet">

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
  
  	<%
		//sends user into user main page if they have not logged out
		String user = null;	
			
		if (session.getAttribute("UserID") != null) {
			response.sendRedirect("1_MainPage.jsp");
		} else{
			
		user = (String) session.getAttribute("UserID");
		}
	%>
  

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">Math-AF</h3>
              <nav>
              <!-- Top bar, navigation -->
                <ul class="nav masthead-nav">
                  <li class="active"><a href="http://math-afunctions.rhcloud.com/UserMainPage.jsp">Home</a></li>
                  <li><a href="http://math-afunctions.rhcloud.com/Login2.jsp">Login</a></li>
                  <li><a href="http://math-afunctions.rhcloud.com/Register2.jsp">Register</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
            <h1 class="cover-heading">Math AFunctions</h1>
            <p class="lead">A Math Tool</p>
            <p class="lead">
            <!-- Big button in the middle -->
              <a href="http://math-afunctions.rhcloud.com/Register2.jsp" class="btn btn-lg btn-default">Register</a>
            </p>
          </div>

          <div class="mastfoot">
            <div class="inner">
            
            </div>
          </div>
 
        </div>

      </div>

    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="http://getbootstrap.com/examples/cover/z"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>