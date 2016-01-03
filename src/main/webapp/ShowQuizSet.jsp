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


    <title>Quiz Set</title>

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

<% if (session.getAttribute("UserType").equals("1")!= true) {
	response.sendRedirect("WelcomePage.jsp");
}//If no user session, redirects to main page %>

  <body>

	
	<%
		String questionIDs = "";
		String quizSet = request.getParameter("QuizSetID");//gets parameter
		String quizSetID = quizSet.substring(0,quizSet.indexOf("*"));//Get current quiz set ID
		quizSet = quizSet.substring(quizSet.indexOf("*")+1, quizSet.length());//Shortens output
		String numberOfQuestions= quizSet.substring(0,quizSet.indexOf("*"));//Get number of questions;
		quizSet = quizSet.substring(quizSet.indexOf("*")+1, quizSet.length());//Shortens outputs
		String totalQuestions = quizSet.substring(0,quizSet.indexOf("*"));//Get the number of quiz questions as first array element
		quizSet = quizSet.substring(quizSet.indexOf("*")+1, quizSet.length());//Shortens output to contain only quizIDs
		String allQuizSetIDs = quizSet;//remaining string become the quiz set ids
		String dailyQuizSet = request.getParameter("DailyQuizSet");//get daily quiz set
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
        <h1>Quiz Set Bank</h1>
        <p class="lead">This page displays all the quiz sets, and the individual questions in each set.</p>
        <p><a class="btn btn-lg btn-success" href="" role="button">Create a new quiz set</a></p>
      </div>
	<!-- Lists all the quiz sets -->
      <div class="row marketing">
        <div class="col-lg-6">
        <p>Here is a list of your other quiz set IDS. The current quiz set id is <%out.println(dailyQuizSet);%></p>
        <ul> 
        <%
        for (int i = allQuizSetIDs.indexOf("-"); i != -1; i = allQuizSetIDs.indexOf("-")) {
        %><li><a href="http://math-afunctions.rhcloud.com/DisplayQuizSet?quizSetID=<%out.println((allQuizSetIDs.substring(0, i)));%>"><% out.println(allQuizSetIDs.substring(0, i));%>
        </a><a href ="http://math-afunctions.rhcloud.com/DisplayQuizSet?quizSetID=<%out.println((allQuizSetIDs.substring(0, i)));%>&Update=<%out.println((allQuizSetIDs.substring(0, i)));%>">Click to add as today's quiz</a></li><%
        allQuizSetIDs = allQuizSetIDs.substring(i + 1, allQuizSetIDs.length());
        }//splits remaining output
        %>
        </ul>
        </div>
	
		<!-- Lists all of the quizzes in a quiz set -->
        <div class="col-lg-6">
          <p>The quiz set being displayed has the Id of <% out.println(quizSetID); %><br> It has <% out.println(numberOfQuestions); %> questions.</p>	
          <p>Here is a list of the question Ids belonging to this quiz set</p>
          <ul> 
          <%
          for (int i = totalQuestions.indexOf(" "); i != -1; i = totalQuestions.indexOf(" ")) {
          %><li><a href="http://math-afunctions.rhcloud.com/DisplayQuiz?quizID=<% out.println((totalQuestions.substring(0, i))); %>"><% out.println((totalQuestions.substring(0, i))); %></a></li><%
          totalQuestions = totalQuestions.substring(i + 1, totalQuestions.length());
          }//splits remaining output
          %>
          </ul>
        </div>
      </div>

     
    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
