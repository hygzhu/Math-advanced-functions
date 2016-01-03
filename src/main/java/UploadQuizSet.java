import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UploadQuizSet")

public class UploadQuizSet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection;
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
			String questionIDs = DatabaseAccess.getQuestionID();
			response.sendRedirect("UploadQuizSet.jsp?questionIDs="+questionIDs);
		
	
		
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String quizSet = request.getParameter("questionsInput");

		
		  PrintWriter out = response.getWriter();
	      out.println("The quiz set is: "+quizSet);
	   
		DatabaseAccess.uploadQuizSet(quizSet);

	response.sendRedirect("1_MainPage.jsp");
		
	
		
		
		}

}
