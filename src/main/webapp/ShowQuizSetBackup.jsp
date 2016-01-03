<!-- Duplicate Page -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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




%>

<p>The quiz set being displayed has the Id of <% out.println(quizSetID); %><br> It has <% out.println(numberOfQuestions); %> questions.</p>

<p>Here is a list of the question Ids belonging to this quiz set</p>
<ul> 
<%
for (int i = totalQuestions.indexOf(" "); i != -1; i = totalQuestions.indexOf(" ")) {

%><li><% out.println(totalQuestions.substring(0, i));%></li><%

totalQuestions = totalQuestions.substring(i + 1, totalQuestions.length());
}//splits remaining output

%>
</ul>

<p>Here is a list of your other quiz set IDS</p>

<ul> 
<%
for (int i = allQuizSetIDs.indexOf("-"); i != -1; i = allQuizSetIDs.indexOf("-")) {

%><li><a href="http://math-afunctions.rhcloud.com/DisplayQuizSet?quizSetID=<%out.println((allQuizSetIDs.substring(0, i)));%>"><% out.println(allQuizSetIDs.substring(0, i));%></a></li><%

allQuizSetIDs = allQuizSetIDs.substring(i + 1, allQuizSetIDs.length());

}//splits remaining output

%>
</ul>


</body>
</html>