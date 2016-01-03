import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//Java servlet which works in the background to display the results of all the daily quizzes to the teacher


@WebServlet("/DisplayQuizResults")
public class DisplayQuizResults extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		
		String quizSetIDs = DatabaseAccess.getQuizID();//Retrieves all QuizSet IDs
		
		int quizSetID = 0;
		
		String output = request.getParameter("quizSetID");//Gets quizSet parameter
		
		
		if (output ==null){
			
			quizSetID = Integer.parseInt(quizSetIDs.substring(0, quizSetIDs.indexOf("-"))); //If no QuizSetID requested, get first available quizSetID
			
		}else{
			
			quizSetID = Integer.parseInt(output); //Uses current quizSetID from parameter instead of default
		}
		

		String quizSet = DatabaseAccess.getQuizSet(quizSetID);//Gets specific quiz set
	
		
		String dailyQuizSet = DatabaseAccess.getDailyQuizSet();//Gets the daily quiz set ID
		
		String results = DatabaseAccess.getQuizResults(quizSetID+"");//gets results of the quiz


		response.sendRedirect("ShowQuizResults.jsp?QuizSetID="+quizSetID+"*"+quizSet+"*"+quizSetIDs+"&DailyQuizSet="+dailyQuizSet+"&Results="+results);
		//Redirects the the jsp which allows viewing of the quiz results
		
	}	
	
	
}
