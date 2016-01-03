import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//Java servlet to check the answer of a questions during the run quiz process 

@WebServlet("/CheckAnswer")
public class CheckAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		// sends to doPost after accessing servlet from doGet

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String answer = request.getParameter("Answer");//Gets the asnwer parameter
		int quizSetID = Integer.parseInt(request.getParameter("quizSetID")); //gets the quizSetId
		int quizID = Integer.parseInt(request.getParameter("quizID"));//gets the quiz question id

		HttpSession session = request.getSession();// get session

		String score = (String) session.getAttribute("score");//Gets current score

		if (DatabaseAccess.checkAnswer(quizID, answer) == true) {

			session.setAttribute("score", score + "*1");// adds a score
			response.sendRedirect("RunQuiz?QuizSetID=" + quizSetID); //redirects to run quiz

		} else {
			session.setAttribute("score", score + "*0");// adds a score
			response.sendRedirect("RunQuiz?QuizSetID=" + quizSetID);//redirects to run quiz

		}

	}


}
