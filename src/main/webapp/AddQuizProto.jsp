<!-- Template taken from http://getbootstrap.com/getting-started/ --> 
<!-- Older Version of Quiz Creation, not in use -->
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
    <link rel="icon" href="../../favicon.ico">

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

    <div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="http://math-afunctions.rhcloud.com/UserMainPage.jsp">Home</a></li>
            <li role="presentation"><a href="http://math-afunctions.rhcloud.com/Quiz.jsp#">Quiz Home</a></li>
            <li role="presentation"><a href="http://math-afunctions.rhcloud.com/Questions.jsp#">Questions Home</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Project name</h3>
      </div>

      <div class="jumbotron">
        <h1>Question Creator</h1>
        <p class="lead">Create your question here!</p>
      </div>

    <form action="/uploads" enctype="multipart/form-data" method="post">
		
		<!-- Question image and text input -->
		<strong>Question:</strong> <input type="text" name="text1" />
		<br><br>
		<strong>Upload Image</strong>
		<input type="file" id="inputName" class="form-control" name="uploadFile" accept="image/*"
			onchange="loadFile(event)" placeholder="Full Name" require autofocus> 
		<img id="img1" /> 
		<br><br>
		
		<!-- First answer image and text input -->
		<strong>Answer 1:</strong> <input type="text" name="text2" />
		<br><br>
		<strong>Upload Image</strong>
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile2(event)"> 
		<img id="img2" /> 
		<br><br>
		
		<!-- Second answer image and text input -->
		<strong>Answer 2:</strong> <input type="text" name="text3" />
		<br><br>
		<strong>Upload Image</strong>
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile3(event)"> 
		<img id="img3" /> 
		<br><br>
		
		<!-- Third answer image and text input -->
		<strong>Answer 3:</strong> <input type="text" name="text4" />
		<br><br>
		<strong>Upload Image</strong>
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile4(event)"> 
		<img id="img4" />
		<br><br>
		
		<!-- Fourth answer image and text input -->
		<strong>Answer 4:</strong> <input type="text" name="text5" />
		<br><br>
		<strong>Upload Image</strong>
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile5(event)"> 
		<img id="img5" /> 
		<br><br>
		
		<!-- Choosing the right answer: radio -->
		<p><strong>Correct Answer:</strong></p>
		<input type="radio" name="CorrectAnswer" value="1">Answer 1<br>
		<input type="radio" name="CorrectAnswer" value="2">Answer 2<br>
		<input type="radio" name="CorrectAnswer" value="3">Answer 3<br>
		<input type="radio" name="CorrectAnswer" value="4">Answer 4<br>
		
		<div></div>
		<input type="submit"/>
	</form>

		
	<!-- Javascript for uploading images -->
	<script>
		var loadFile = function(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('img1');
				output.src = reader.result;
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
