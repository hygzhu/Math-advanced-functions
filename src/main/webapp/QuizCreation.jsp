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

    <title>Question Creator</title>

    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">

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
		//allow access only if session exists
		String userID = null;	
		String username = null;
			
		if (session.getAttribute("UserID") == null) {
			response.sendRedirect("WelcomePage.jsp");
		} else{
			
		userID = (String) session.getAttribute("UserID");
		username = (String) session.getAttribute("Username");
		//gets session attribute
		
		}
	%>

    <div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="http://math-afunctions.rhcloud.com/1_MainPage.jsp">Home</a></li>
            <li role="presentation"><a href="http://math-afunctions.rhcloud.com/1_QuizSetsPage.jsp">Quiz Home</a></li>
            <li role="presentation"><a href="http://math-afunctions.rhcloud.com/1_QuestionsPage.jsp">Questions Home</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Math-AF</h3>
      </div>

      <div class="jumbotron">
        <h1>Question Creator</h1>
        <p class="lead">Create your question here!</p>
      </div>

<center>
    <form action="/uploads" enctype="multipart/form-data" method="post">
		
        <label for="inputName" class="sr-only">Email address</label>
		
		<!-- Question -->
		<strong>Question:</strong> <input type="text" name="text1" />
		<br><br>
		<strong>Upload Image</strong>
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile(event)"> 
		<img id="img1" /> 
		<br><br>
		
		<!-- Answer 1 -->
		<strong>Answer 1:</strong> <input type="text" name="text2" />
		<br><br>
		<strong>Upload Image</strong>
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile2(event)"> 
		<img id="img2" /> 
		<br><br>
		
		<!-- Answer 2 -->
		<strong>Answer 2:</strong> <input type="text" name="text3" />
		<br><br>
		<strong>Upload Image</strong>
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile3(event)"> 
		<img id="img3" /> 
		<br><br>
		
		<!-- Answer 3 -->
		<strong>Answer 3:</strong> <input type="text" name="text4" />
		<br><br>
		<strong>Upload Image</strong>
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile4(event)"> 
		<img id="img4" />
		<br><br>
		
		<!-- Question 4 -->
		<strong>Answer 4:</strong> <input type="text" name="text5" />
		<br><br>
		<strong>Upload Image</strong>
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile5(event)"> 
		<img id="img5" /> 
		<br><br>
		
		<!-- Choosing correct answer -->
		<p><strong>Correct Answer:</strong></p>
		<input type="radio" name="CorrectAnswer" value="1">Answer 1<br>
		<input type="radio" name="CorrectAnswer" value="2">Answer 2<br>
		<input type="radio" name="CorrectAnswer" value="3">Answer 3<br>
		<input type="radio" name="CorrectAnswer" value="4">Answer 4<br>
		
		<div></div>
		<input type="submit"/>
	</form>
</center>
		

	<script>

	/*
	
	Reference
	Image preview JavaScript, Stack Overflow by nKron, Created Nov 27, 2014, Accessed May 7, 2015
	http://stackoverflow.com/questions/4459379/preview-an-image-before-it-is-uploaded
	(Reference for Image preview javascript)
	
	*/

	
		var loadFile = function(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('img1');
				output.src = reader.result;
				canvas.width=150
			    canvas.height=150
			};
			reader.readAsDataURL(event.target.files[0]);
		};
		var loadFile2 = function(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output2 = document.getElementById('img2');
				output2.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);
		};
		var loadFile3 = function(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output3 = document.getElementById('img3');
				output3.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);
		};
		var loadFile4 = function(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output4 = document.getElementById('img4');
				output4.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);
		};
		var loadFile5 = function(event) {
			var reader = new FileReader();
			reader.onload = function() { 	
				var output5 = document.getElementById('img5');
				output5.src = reader.result;
				
			};
			reader.readAsDataURL(event.target.files[0]);
		};
	</script>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>