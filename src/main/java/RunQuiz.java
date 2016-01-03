
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//Java servlet which runs the quiz for students

@WebServlet("/RunQuiz")
public class RunQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String quizSetID = "";
		String output = request.getParameter("QuizSetID");//Gets quizSet parameter
		
		if (output ==null){	
			quizSetID = DatabaseAccess.getDailyQuizSet()  ; //If no QuizSetID requested, get first available quizSetID
		}else{
			quizSetID = output; //Uses current quizSetID from parameter instead of default
		}
		
		HttpSession session = request.getSession();//get session
		boolean hasCompletedquiz = DatabaseAccess.hasCompletedQuiz((String) session.getAttribute("UserID"), quizSetID);//checks if already completed quiz
		
		if(hasCompletedquiz==true){
			
			String results = DatabaseAccess.getSingleUserResults((String) session.getAttribute("UserID"), quizSetID);
			
			String totalQuestions = results.substring(results.indexOf("<")+1, results.indexOf(">"));
			String score = results.substring(results.indexOf(">")+1, results.length());
			session.setAttribute("score", null+score); //sets score as session attribute
			
			response.sendRedirect("ScoreScreen.jsp?QuizSetID="+quizSetID+"&TotalQuestions="+totalQuestions);//Sends to score screen if all questions are completed
			//sends user to score screen if quiz already completed
			
		}else if (session.getAttribute("UserID") == null) {
			response.sendRedirect("WelcomePage.jsp");//If no user session, redirects to main page
		}else{
		
		
		String info = DatabaseAccess.getQuizSet(Integer.parseInt(quizSetID));//get quiz set output
		String totalQuestions = info.substring(0,info.indexOf("*"));//amount of questions
		String questionIDs = info.substring(info.indexOf("*")+1, info.length());//list of question ids
		int completedQuestions;
		
		
		String quizCompletion = (String) session.getAttribute("quizCompletion");//gets completion parameter
		if(quizCompletion==null){
		completedQuestions = 0;
		session.setAttribute("quizCompletion", "1/"+totalQuestions);//adds the completion parameter
		}else{
		completedQuestions = Integer.parseInt(quizCompletion.substring(0,quizCompletion.indexOf("/")))+1;//gets completed questions
		session.setAttribute("quizCompletion", completedQuestions+"/"+totalQuestions);//resets attribute
		}
		
		if(completedQuestions > Integer.parseInt(totalQuestions)){
		
		String answers = (String) session.getAttribute("score");
		answers = answers.substring(4,answers.length());//removes null in the score
		String answersCounter = answers; //used to find correct questions
		
		int questionsRight = 0;
	
		for(int i = Integer.parseInt(totalQuestions); i>0; i--){
			if (Integer.parseInt(answersCounter.substring(1,2))==1){
				questionsRight++;//increases questions right
			}
			answersCounter = answersCounter.substring(2,answersCounter.length());//reduce answers string length
		}
		String questionsCorrect = ""+questionsRight;//turns into string
		
		DatabaseAccess.addResult((String) session.getAttribute("UserID"), quizSetID, totalQuestions, questionsCorrect, answers);//saves score in database
		response.sendRedirect("ScoreScreen.jsp?QuizSetID="+quizSetID+"&TotalQuestions="+totalQuestions);//Sends to score screen if all questions are completed	
		
		}else{
		
		questionIDs = questionIDs+" ";
		
		for (int i = completedQuestions; i>1; i--){
			
		questionIDs = questionIDs.substring(questionIDs.indexOf(" ")+1,questionIDs.length());//shortens question ids left depending on how many have been completed
		//String index is out of range fix
		}
		
		questionIDs = " "+questionIDs;
		
		questionIDs = questionIDs.substring(questionIDs.indexOf(" ")+1, questionIDs.length());
		int quizID = Integer.parseInt(questionIDs.substring(0,questionIDs.indexOf(" ")));
		//splits strings to determine the id of the questions being sent as a parameter
		String quiz = DatabaseAccess.getQuiz(quizID);
		ArrayList<String> text = new ArrayList<String>();

		for (int i = quiz.indexOf("*"); i != -1; i = quiz.indexOf("*")) {

			text.add(quiz.substring(0, i));

			quiz = quiz.substring(i + 1, quiz.length());
		}//gets the info for the quiz question
		
		
		response.sendRedirect("MultipleChoiceQuestion.jsp?QuizID=" + quizID + "&Text1="
				+ text.get(0) + "&Text2=" + text.get(1) + "&Text3="
				+ text.get(2) + "&Text4=" + text.get(3) + "&Text5="
				+ text.get(4) + "&Image1=" + text.get(5) + "&Image2="
				+ text.get(6) + "&Image3=" + text.get(7) + "&Image4="
				+ text.get(8) + "&Image5=" + text.get(9) + "&CorrectAnswer="
				+ text.get(10)+"&QuizSetID="+quizSetID+"&TotalQuestions="+totalQuestions);
		}//redirects to the multiple choice questions
		}

	}




}