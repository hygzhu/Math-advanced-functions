import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//Java Servlet to display a set of question ids pertaining to a quizset

@WebServlet("/DisplayQuizSet")
public class DisplayQuizSet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
		//sends to doPost after accessing servlet from doGet 
		
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("Update")!=null){
			DatabaseAccess.updateDailyQuiz(request.getParameter("Update"));//updates the set quiz
			
		}
		String quizSetIDs = DatabaseAccess.getQuizID();//Retrieves all QuizSet IDs	
		int quizSetID = 0;
		String output = request.getParameter("quizSetID");//Gets quizSet parameter
		if (output ==null){
			quizSetID = Integer.parseInt(quizSetIDs.substring(0, quizSetIDs.indexOf("-"))); //If no QuizSetID requested, get first available quizSetID	
		}else{
			quizSetID = Integer.parseInt(output); //Uses current quizSetID from parameter instead of default
		}
	
		String quizSet = DatabaseAccess.getQuizSet(quizSetID);//Gets specific quiz set
		String dailyQuizSet = DatabaseAccess.getDailyQuizSet(); //gets the current quiz set
		

		response.sendRedirect("ShowQuizSet.jsp?QuizSetID="+quizSetID+"*"+quizSet+"*"+quizSetIDs+"&DailyQuizSet="+dailyQuizSet);
		//redirects to the show quiz set jsp with set parameters
		}
	

}
