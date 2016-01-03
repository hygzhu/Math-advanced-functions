<!-- Template taken from http://getbootstrap.com/getting-started/ --> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head><meta name="viewport" content="width=device-width, initial-scale=1">
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

<title>Homepage</title>

<!-- Bootstrap core CSS -->
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="http://getbootstrap.com/examples/offcanvas/offcanvas.css"
	rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="http://getbootstrap.com/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>


	<%
		//allow access only if session exists
		String userID = null;	
		String username = null;
		
			
		if (session.getAttribute("UserType").equals("1")) {
		userID = (String) session.getAttribute("UserID");
		username = (String) session.getAttribute("Username");
		String fullName = (String) session.getAttribute("FullName");
		
		
		
		//gets session attribute user allow if user is teacher and displays teacher page
		%>

<!-- Navigation bar at the top of the page -->
	<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="http://math-afunctions.rhcloud.com/1_MainPage.jsp">Math
				AF</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="http://math-afunctions.rhcloud.com/1_MainPage.jsp">Home</a></li>
				<li><a href="http://math-afunctions.rhcloud.com/1_QuestionsPage.jsp">Quiz Questions</a></li>
				<li><a href="http://math-afunctions.rhcloud.com/1_QuizSetsPage.jsp">Quiz Sets</a></li>
				<!-- Displays what user is logged in the current session -->
				<li><a>Username:<b><%out.println(username);%></b></a></li>
				<li><a href="http://math-afunctions.rhcloud.com/Logout">Sign Out</a></li>
			</ul>

		</div>
		<!-- /.nav-collapse -->
	</div>
	<!-- /.container --> </nav>
	<!-- /.navbar -->
	


	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">

			<div class="col-xs-12 col-sm-9">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">Toggle nav</button>
				</p>
				<div class="jumbotron">
					<h1>Welcome <%out.println(fullName);%>!</h1>
					<p>This is the main page!</p>
					 <h4>For mobile</h4>
            <p><a href="http://math-afunctions.rhcloud.com/1_MainPage.jsp">Homepage</a></p>
					<p><a href="http://math-afunctions.rhcloud.com/1_QuestionsPage.jsp#">Questions</a></p>
					<p><a href="http://math-afunctions.rhcloud.com/1_QuizSetsPage.jsp#">Quiz</a></p>
				</div>
				<div class="row"></div>
				<!--/row-->
			</div>
			<!--/.col-xs-12.col-sm-9-->
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<div class="list-group">
					<a href="http://google.com" class="list-group-item active">Important
						Links</a> <a href="http://google.com" class="list-group-item">Google</a>
				</div>
			</div>
			<!--/.sidebar-offcanvas-->
		</div>
		<!--/row-->
		<hr>



	</div>
	<!--/.container-->

<!-- Page for students -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

	<script src="offcanvas.js"></script>
		
		<% 
		} else if(session.getAttribute("UserType").equals("0")) {
			userID = (String) session.getAttribute("UserID");
			username = (String) session.getAttribute("Username");
			//gets session attribute user allow if user is student
			String fullName = (String) session.getAttribute("FullName");
		%> 
		
<!-- Navigation bar at the top of the page -->
		<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="http://math-afunctions.rhcloud.com/1_MainPage.jsp">Math
				AF</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="http://math-afunctions.rhcloud.com/1_MainPage.jsp">Home</a></li>
			
				<li><a href="http://math-afunctions.rhcloud.com/1_QuizSetsPage.jsp">Quiz</a></li>
				<li><a>Username:<b> <%out.println(username);%></b></a></li>
				<li><a href="http://math-afunctions.rhcloud.com/Logout">Sign Out</a></li>
			</ul>

		</div>
		<!-- /.nav-collapse -->
	</div>
	<!-- /.container --> </nav>
	<!-- /.navbar -->

	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">

			<div class="col-xs-12 col-sm-9">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">Toggle nav</button>
				</p>
				<div class="jumbotron">
					<h1>Welcome <%out.println(fullName);%>!</h1>
					<p>This is the main page!</p>
					<h4>For Mobile</h4>
					<p><a href="http://math-afunctions.rhcloud.com/1_MainPage.jsp">Homepage</a></p>
					<p><a href="http://math-afunctions.rhcloud.com/1_QuizSetsPage.jsp#">Quiz</a></p>
				</div>
				<div class="row"></div>
				<!--/row-->
			<!-- Side bar Column -->
			</div>
			<!--/.col-xs-12.col-sm-9-->
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<div class="list-group">
					<a href="http://google.com" class="list-group-item active">Important
						Links</a> <a href="http://google.com" class="list-group-item">Google</a>
				</div>
			</div>
			<!--/.sidebar-offcanvas-->
		</div>
		<!--/row-->
		<hr>



	</div>
	<!--/.container-->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

	<script src="offcanvas.js"></script>
		<% 		
		}else{
		
			
			
			
		response.sendRedirect("WelcomePage.jsp");//sends users back to main page if neither student or teacher
		}
	%>

</body>
</html>
