<!-- Duplicate of show quiz -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style=" width : 1070px; height : 167px;">
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


</body>
</html>