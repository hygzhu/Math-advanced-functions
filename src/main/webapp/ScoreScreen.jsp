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

    <title>Score Screen</title>

    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/sticky-footer/sticky-footer.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="http://getbootstrap.com/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
<%

if (session.getAttribute("UserType").equals("0")!= true) {
	response.sendRedirect("WelcomePage.jsp");
}//If no user session, redirects to main page

%>
  <body>
	
	<%  String quizSetID = request.getParameter("QuizSetID");
		String totalQuestions = request.getParameter("TotalQuestions");
		
		String score = (String) session.getAttribute("score");
		score = score.substring(4,score.length());//removes null in the score
		
		int questionsRight = 0;
		
		for(int i = Integer.parseInt(totalQuestions); i>0; i--){
			if (Integer.parseInt(score.substring(1,2))==1){
				questionsRight++;//increases questions right
			}
			score = score.substring(2,score.length());//reduce score string length
		}
		
	%>

    <!-- Begin page content -->
    <div class="container">
      <div class="page-header">
        <h1>You have completed today's quiz!!</h1>
      </div>
 	     <p class="lead">You got <% out.println(questionsRight); %> questions right out of <% out.println(totalQuestions); %> questions!</p>
      
      <p><a href="http://math-afunctions.rhcloud.com/1_QuizSetsPage.jsp">Return to main page</a></p>
    </div>



    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
