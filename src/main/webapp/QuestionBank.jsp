<!-- Template taken from http://getbootstrap.com/getting-started/ --> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<!-- iconj.com favicon code -->
<link rel="shortcut icon" href="http://www.iconj.com/icon.php?pid=cpvk8i0sha" type="image/x-icon" />
<link rel="shortcut icon" href="http://www.iconj.com/gif_icon.php?pid=cpvk8i0sha" type="image/gif" /> 
<!-- end of iconj.com favicon code -->


<title>Question Bank</title>

<!-- Bootstrap core CSS -->
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="http://getbootstrap.com/examples/blog/blog.css"
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
<%
if (session.getAttribute("UserType").equals("1")!= true) {
	response.sendRedirect("WelcomePage.jsp");
}//If no user session, redirects to main page
%>


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
		
%>


	<div class="blog-masthead">
		<div class="container">
			<nav class="blog-nav"> <a class="blog-nav-item active"
				href="http://math-afunctions.rhcloud.com/1_MainPage.jsp">Home</a>
			<a class="blog-nav-item"
				href="http://math-afunctions.rhcloud.com/1_QuestionsPage.jsp">Question</a>
			</nav>
		</div>
	</div>

	<div class="container">

		<div class="blog-header">
			<h1 class="blog-title">Question Bank</h1>
		</div>

		<div class="row">

			<div class="col-sm-8 blog-main">

				<div class="blog-post">

					<!-- Question -->
					<div class="jumbotron">
						<h1>Quiz <%out.println(quizID); %></h1>
						<center>
							<!-- Question image and text -->
							<p class="lead"><%out.println(questionText); %></p>
							<p>
								<img src="http://math-afunctions.rhcloud.com/uploads/<%out.println(questionImage); %>"
									style="width: 304px; height: 228px">
							</p>
							<!-- Answers 1 - 4 -->
							<div class="col-lg-6">
								<button style="width: 200px; height: 175px">
										<h2>Answer 1</h2>
										<p><img src="http://math-afunctions.rhcloud.com/uploads/<%out.println(answerImage1); %>" Style="height:75px; width:100px"></p>
										<p style="font-size: 16px"><%
							if(correctAnswer.equals("1")){
								%>
								<font color="green"><%out.println(answerText1); %></font>
								<% 
							}else{
								%>
								<font color="red"><%out.println(answerText1); %></font>
								<% 
							}
							%></p>
									</a>
								</button>
							</div>

							<div class="col-lg-6">
								<button style="width: 200px; height: 175px">
										<h2>Answer 2</h2>
										<p><img src="http://math-afunctions.rhcloud.com/uploads/<%out.println(answerImage2); %>" Style="height:75px; width:100px"></p>
										<p style="font-size: 16px"><%
							if(correctAnswer.equals("2")){
								%>
								<font color="green"><%out.println(answerText2); %></font>
								<% 
							}else{
								%>
								<font color="red"><%out.println(answerText2); %></font>
								<% 
							}
							%></p>
									</a>
								</button>
							</div>

							<div class="col-lg-6">
								<button style="width: 200px; height: 175px">
										<h2>Answer 3</h2>
										<p><img src="http://math-afunctions.rhcloud.com/uploads/<%out.println(answerImage3); %>" Style="height:75px; width:100px"></p>
										<p style="font-size: 16px"><%
							if(correctAnswer.equals("3")){
								%>
								<font color="green"><%out.println(answerText3); %></font>
								<% 
							}else{
								%>
								<font color="red"><%out.println(answerText3); %></font>
								<% 
							}
							%></p>
									</a>
								</button>
							</div>

							<div class="col-lg-6">
								<button style="width: 200px; height: 175px">
										<h2>Answer 4</h2>
										<p><img src="http://math-afunctions.rhcloud.com/uploads/<%out.println(answerImage4); %>" Style="height:75px; width:100px"></p>
										<p style="font-size: 16px"><%
							if(correctAnswer.equals("4")){
								%>
								<font color="green"><%out.println(answerText4); %></font>
								<% 
							}else{
								%>
								<font color="red"><%out.println(answerText4); %></font>
								<% 
							}
							%></p>
									</a>
								</button>
							</div>
						</center>
					</div>

				</div>
				<!-- /.blog-post -->

			</div>
			<!-- /.blog-main -->

			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<h4>Question Bank</h4>
					


					
					<!-- Side bar for all the questions -->
					<div
						style="line-overflow: scroll; padding: 5px; width: 209px; height: 518px; height: 582px;">
						<style>
ul {
	list-style-type: none;
}
</style>
						<ul>
					<p>	Here are the available quiz IDs <p>
					
					<div class="dropdown">
  						
  						<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
    						<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
    						<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
    						<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
    						<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
  						</ul>
					</div>

							<%
								String questionIDs = request.getParameter("questionIDs");
						
									for (int i = questionIDs.indexOf("-"); i != -1; i = questionIDs
											.indexOf("-")) {
							%><li>
							<a href="http://math-afunctions.rhcloud.com/DisplayQuiz?quizID=<%
									out.println((questionIDs.substring(0, i)));
								%>">
								<%
									out.println((questionIDs.substring(0, i)));
								%>
								</a>
							</li>
							<%
							questionIDs = questionIDs.substring(i + 1, questionIDs.length());
									}//Prints a list of IDs from questions
							%>


						</ul>
					</div>

				</div>


			</div>
			<!-- /.blog-sidebar -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->



	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
