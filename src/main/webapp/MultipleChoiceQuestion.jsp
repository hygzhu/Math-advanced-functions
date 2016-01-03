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

<title>Quiz</title>

<!-- Bootstrap core CSS -->
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css"
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

		String quizID = request.getParameter("QuizID");
		String questionImage = request.getParameter("Image1");
		String answerImage1 = request.getParameter("Image2");
		String answerImage2 = request.getParameter("Image3");
		String answerImage3 = request.getParameter("Image4");
		String answerImage4 = request.getParameter("Image5");
		String questionText = request.getParameter("Text1");
		String answerText1 = request.getParameter("Text2");
		String answerText2 = request.getParameter("Text3");
		String answerText3 = request.getParameter("Text4");
		String answerText4 = request.getParameter("Text5");
		String correctAnswer = request.getParameter("CorrectAnswer");
		String quizSetID = request.getParameter("QuizSetID");
		String totalQuestions = request.getParameter("TotalQuestions");
		

		//allow access only if session exists
		String userID = null;	
		String username = null;
			
		if (session.getAttribute("UserType").equals("0")!= true) {
			response.sendRedirect("WelcomePage.jsp");
		}//If no user session, redirects to main page
		
		if (session.getAttribute("hasCompletedQuiz") != null) {
			response.sendRedirect("ScoreScreen.jsp");
		}//If user has already completed quiz, redirects to score screen
		
		
	%>

	<div class="container">
		<div class="header clearfix">
			<nav>
			
			</nav>
			<h3 class="text-muted">Math-AF</h3>
		</div>

		<!-- Start of Quiz -->
		<div class="jumbotron">
			<h1>Question <%out.println(session.getAttribute("quizCompletion")); %></h1>
			<p class="lead"><%out.println(questionText); %></p>
			<p>
			<!-- Gets the image from the server -->
				<img
					src='http://math-afunctions.rhcloud.com/uploads/<%out.println(questionImage);%>'
					style="width: 304px; height: 228px">
					
			</p>
		</div>
		<!-- Answers begin -->
<center>
	<div class="row marketing">
        <div class="col-lg-6">	
		<!-- Answer 1 -->
		<p>
			<!-- Gets the image from the server -->
				<img
					src='http://math-afunctions.rhcloud.com/uploads/<%out.println(answerImage1);%>'
					style="width: 200px; height: 228px">
					
		</p>
		<div></div>
		<form action="/CheckAnswer">
			<input type="hidden" name="Answer" value="1"/>
			<input type="hidden" name="quizID" value= <%out.println(quizID);%>/>
			<input type="hidden" name="quizSetID" value= <%out.println(quizSetID);%>/>
			<input type="submit" name="Answer1" value="<%out.println(answerText1); %>" style="height:50px; width:200px">
		</form>
		
		<!-- Answer 2 -->
		<p>
			<!-- Gets the image from the server -->
				<img
					src='http://math-afunctions.rhcloud.com/uploads/<%out.println(answerImage2);%>'
					style="width: 200px; height: 228px">
					
		</p>
		<div></div>
		<form action="/CheckAnswer">
			<input type="hidden" name="Answer" value="2"/>
			<input type="hidden" name="quizID" value= <%out.println(quizID);%>/>
			<input type="hidden" name="quizSetID" value= <%out.println(quizSetID);%>/>
			<input type="submit" name="Answer2" value="<%out.println(answerText2); %>" style="height:50px; width:200px">
		</form>
		</div>
		<div class="col-lg-6">
		<!-- Answer 3 -->
		<p>
			<!-- Gets the image from the server -->
				<img
					src='http://math-afunctions.rhcloud.com/uploads/<%out.println(answerImage3);%>'
					style="width: 200px; height: 228px">
					
		</p>
		<div></div>
		<form action="/CheckAnswer">
			<input type="hidden" name="Answer" value="3"/>
			<input type="hidden" name="quizID" value= <%out.println(quizID);%>/>
			<input type="hidden" name="quizSetID" value= <%out.println(quizSetID);%>/>
			<input type="submit" name="Answer2" value="<%out.println(answerText3); %>" style="height:50px; width:200px">
		</form>
		
		<!-- Answer 4 -->
		<p>
			<!-- Gets the image from the server -->
				<img
					src='http://math-afunctions.rhcloud.com/uploads/<%out.println(answerImage4);%>'
					style="width: 200px; height: 228px">
					
		</p>
		<div></div>
		<form action="/CheckAnswer">
			<input type="hidden" name="Answer" value="4"/>
			<input type="hidden" name="quizID" value= <%out.println(quizID);%>/>
			<input type="hidden" name="quizSetID" value= <%out.println(quizSetID);%>/>
			<input type="submit" name="Answer2" value="<%out.println(answerText4); %>" style="height:50px; width:200px">
		</form>
		</div>
	</div> 
</center>
		
		<!-- old code that might still come in handy -->
		<!-- 
		
		<center>
			<div class="row marketing">
				<div class="col-lg-6">
					<button style="width: 200px; height: 250px">
						<a href="http://google.com">
							<h2>Answer 1</h2>
							<img src="http://i.imgur.com/rQLjLs5.jpg" height="150px" width="150px">
							<p>Rational Function</p>
						</a>
					</button>
				</div>

				<div class="col-lg-6">
					<button style="width: 200px; height: 250px">
						<a href="http://google.com">
							<h2>Answer 2</h2>
							<img src="http://i.imgur.com/rQLjLs5.jpg" height="150px" width="150px">
							<p>Logarithmic Function</p>
						</a>
					</button>
				</div>
		</center>
		<center>
			<div class="col-lg-6">
				<button style="width: 200px; height: 250px">
					<a href="http://google.com">
						<h2>Answer 3</h2>
						<img src="http://i.imgur.com/rQLjLs5.jpg" height="150px" width="150px">
						<p>Exponential Function</p>
					</a>
				</button>
			</div>

			<div class="col-lg-6">
				<button style="width: 200px; height: 250px">
					<a href="http://google.com">
						<h2>Answer 4</h2>
						<img src="http://i.imgur.com/rQLjLs5.jpg" height="150px" width="150px">
						<p>Squareroot function</p>
					</a>
				</button>
			</div>
		</center>
		-->
	</div>
	<!-- /container -->

 	
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
