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

    <title>Set Quiz</title>

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
<% String questionIDs = "";

if (session.getAttribute("UserType").equals("1")!= true) {
	response.sendRedirect("WelcomePage.jsp");
}//If no user session, redirects to main page

%>

    <div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="http://math-afunctions.rhcloud.com/1_MainPage.jsp">Home</a></li>
            <li role="presentation"><a href="http://math-afunctions.rhcloud.com/1_QuizSetsPage.jsp">Quiz Home</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Math-AF</h3>
      </div>

      <div class="jumbotron">
        <h1>Create a quiz set</h1>
        <p class="lead">Create new quizzes here! Press the submit button when you are done!</p>
      </div>
	<!-- Avaliable Questions -->
      <div class="row marketing">
        <div class="col-lg-6">
          <ul>
		<p>Here are the available quiz IDs</p>

			<%
				questionIDs = request.getParameter("questionIDs");

				for (int i = questionIDs.indexOf("-"); i != -1; i = questionIDs
						.indexOf("-")) {
			%>
		
		<li><a
			href="http://math-afunctions.rhcloud.com/DisplayQuiz?quizID=<%out.println((questionIDs.substring(0, i)));%>">
				<%
					out.println((questionIDs.substring(0, i)));
				%>
		</a></li>

		
		<button onclick="addQuestion(<%out.println((questionIDs.substring(0, i)));%>)"
				style="width: 100px; height: 20px">
				<p style="font-size: 12px">Add to quiz</p>
			</button>



		<%
			questionIDs = questionIDs
						.substring(i + 1, questionIDs.length());
			}//Prints a list of IDs from questions
		%>


	</ul>
	
	<button
				onclick="removeLastQuestion()"
				style="width: 200px; height: 20px">
				<p style="font-size: 12px">Remove Last quiz questions</p>
	</button>
	
	<script>

		var quizSet= "";
		function addQuestion(id) {

			quizSet = quizSet+ id+" ";
			document.getElementById("questionsInput").value = quizSet;
			document.getElementById("questions").innerHTML = quizSet;
		

		}
		function removeLastQuestion(){
			quizSet = quizSet.substring(0,quizSet.length-1);
			quizSet = quizSet.substring(0,quizSet.lastIndexOf(" "));
			quizSet = quizSet + " ";
			document.getElementById("questionsInput").value = quizSet;
			document.getElementById("questions").innerHTML = quizSet;
		
			}
		function checkform(){
			alert(document.getElementById("questionsInput").value);
			return true;
			}
		
</script>
        </div>

        <div class="col-lg-6">
<!-- Displays added questions -->
<p>Here are the questions you have added</p>
<p id="questions"></p>

<form action="UploadQuizSet" method="post">
<input type="hidden" name="questionsInput" id="questionsInput" value=""/>
<button type="submit">Submit</button>
</form>

        </div>
      </div>

   



    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
