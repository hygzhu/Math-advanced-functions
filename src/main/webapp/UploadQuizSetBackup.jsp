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

<% String questionIDs = "";
%>



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
				style="width: 50px; height: 50px">
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
				style="width: 50px; height: 50px">
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
		
</script>

<p>Here are the questions you have added</p>
<p id="questions"></p>

<form action="UploadQuizSet" method="post">
<input type="hidden" name="questionsInput" id="questionsInput" value="" />
<button type="submit">Submit</button>
</form>



</body>
</html>