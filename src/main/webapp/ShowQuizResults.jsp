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

    <title>Student Scores</title>

    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/sticky-footer-navbar/sticky-footer-navbar.css" rel="stylesheet">

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
		String quizSet = request.getParameter("QuizSetID");//gets parameter
		String quizSetID = quizSet.substring(0,quizSet.indexOf("*"));//Get current quiz set ID
		quizSet = quizSet.substring(quizSet.indexOf("*")+1, quizSet.length());//Shortens output
		String numberOfQuestions= quizSet.substring(0,quizSet.indexOf("*"));//Get number of questions;
		quizSet = quizSet.substring(quizSet.indexOf("*")+1, quizSet.length());//Shortens outputs
		String totalQuestions = quizSet.substring(0,quizSet.indexOf("*"));//Get the number of quiz questions as first array element
		quizSet = quizSet.substring(quizSet.indexOf("*")+1, quizSet.length());//Shortens output to contain only quizIDs
		String allQuizSetIDs = quizSet;//remaining string become the quiz set ids
		String dailyQuizSet = request.getParameter("DailyQuizSet");//get daily quiz set
		String results = request.getParameter("Results");

%>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Math AF</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="http://math-afunctions.rhcloud.com/1_MainPage.jsp">Home</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <!-- Begin page content -->
    <div class="container">
      <div class="page-header">
        <h1>Student Scores</h1>
      </div>
      <p class="lead">This page displays all of your quiz IDs and how your students did on these quizzes</p>
    	<p>Here is a list of your other quiz set IDs. The daily quiz id is <%out.println(dailyQuizSet);%>. The quizset results being viewed is from quizSet <%out.println(quizSetID);%> </p>
        <ul> 
        <%
        for (int i = allQuizSetIDs.indexOf("-"); i != -1; i = allQuizSetIDs.indexOf("-")) {
        %><li><a href="http://math-afunctions.rhcloud.com/DisplayQuizResults?quizSetID=<%out.println((allQuizSetIDs.substring(0, i)));%>"><% out.println(allQuizSetIDs.substring(0, i));%>
        </a></li><%
        allQuizSetIDs = allQuizSetIDs.substring(i + 1, allQuizSetIDs.length());
        }//splits remaining output
        %>
        </ul>
        
        <!-- Student results begins -->
        <p>Here are a list of student results for this quiz</p>
        <ul> 
        <%
        if(results.equals("")){
        	out.println("There are no student results for this quiz set");
        }else{
        
        for (int i = results.indexOf("^"); i != -1; i = results.indexOf("^")) {
        %><li>
        Name: <% out.println(results.substring(0,results.indexOf("-"))); results = results.substring(results.indexOf("-")+1);//shortens results%> 
        <br> Correct Questions: <% out.println(results.substring(0,results.indexOf("-"))); results = results.substring(results.indexOf("-")+1);//shortens results%> 
        <br> Results: <% 
        int questionCounter = 1;
        
        String resultsSubString = "";
        if(results.indexOf("^")==-1){
        	resultsSubString = results;//The last set of results to prevent index out of range exception for oncoming for loop
        }else{
           resultsSubString = results.substring(0,results.indexOf("^"));
        }
        
        
        for(int j = resultsSubString.length(); j>0; j= j-2  ){
        	
        	if(resultsSubString.substring(1,2).equals("1")){
        		
        		out.println("Q"+questionCounter+"= correct");
        	}else{
        		out.println("Q"+questionCounter+"= incorrect");
        	}
        	results = results.substring(2);
        	questionCounter++;
        }
        
        %>
        
        </li><%
        if(results.indexOf("^")!=-1){
            results = results.substring(results.indexOf("^")+1);
        }//prevents index out of range at final result set
   
        }//splits remaining output
        
        
        }
        %>
        </ul>
    </div>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
