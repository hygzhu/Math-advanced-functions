import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Java Servlet to display a specific quiz question and info related to it

@WebServlet("/DisplayQuiz")
public class DisplayQuizQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		//sends to doPost after accessing servlet from doGet 

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String questionIDs = DatabaseAccess.getQuestionID();
		int quizID = 0;
		String output = request.getParameter("quizID");
		//get required variables from database or parameters
		
		
		if (output ==null){
			quizID = Integer.parseInt(questionIDs.substring(0, 1));
		}else{
			quizID = Integer.parseInt(output);
		}//checks if there is a question id requested, if not just uses first question ID in database
		

		String quiz = DatabaseAccess.getQuiz(quizID);//Gets a string of quiz Info

		ArrayList<String> text = new ArrayList<String>();//new array list for quiz info sections

		for (int i = quiz.indexOf("*"); i != -1; i = quiz.indexOf("*")) {

			text.add(quiz.substring(0, i));

			quiz = quiz.substring(i + 1, quiz.length());
		}//splits output into arrayList

		response.sendRedirect("QuestionBank.jsp?QuizID=" + quizID + "&Text1="
				+ text.get(0) + "&Text2=" + text.get(1) + "&Text3="
				+ text.get(2) + "&Text4=" + text.get(3) + "&Text5="
				+ text.get(4) + "&Image1=" + text.get(5) + "&Image2="
				+ text.get(6) + "&Image3=" + text.get(7) + "&Image4="
				+ text.get(8) + "&Image5=" + text.get(9) + "&CorrectAnswer="
				+ text.get(10)+ "&questionIDs="+questionIDs);
		//redirects to the question bank with set parameters
	}

}
