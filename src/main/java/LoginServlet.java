import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * References
 * 
 * 1. Java servlet tutorial and Example Code by Pankaj, Created Aug 10, 2013, Accessed April 30, 2015. http://www.journaldev.com/1877/java-servlet-tutorial-with-examples-for-beginners
	(Reference for all java servlets as a general Template)
 * 
 * 2. Managing Java servlet Sessions by Pankaj, Created Aug 12, 2013, Accessed May 7, 2015
	http://www.journaldev.com/1907/java-servlet-session-management-tutorial-with-examples-of-cookies-httpsession-and-url-rewriting
	(Reference for Java session management)
 * 
 */


//Java servlet to allow users to login after checking with the database
@WebServlet("/LoginServlet")//*reference 2
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		String userInfo = request.getParameter("username")
				+ request.getParameter("password"); //Gets username and password in a string
	
		if (DatabaseAccess.login(userInfo).equals("true")) {

			HttpSession session = request.getSession();
			// setting session to expiry in 30 mins
			session.setMaxInactiveInterval(30 * 60);
			//adds attributes to the session
			String userID = DatabaseAccess.getUserID(request.getParameter("username"))+"";
			session.setAttribute("UserID",userID);
			session.setAttribute("Username", request.getParameter("username"));
			session.setAttribute("UserType", DatabaseAccess.getUserType(userID));//sets session attribute
			session.setAttribute("FullName", DatabaseAccess.getFullName(userID));//sets session attribute
			//*reference 1

			response.sendRedirect("http://math-afunctions.rhcloud.com/1_MainPage.jsp");
				//redirect to main page

			return;

		} else if (DatabaseAccess.login(userInfo).equals("false")) {

			response.sendRedirect("Login2.jsp?failure=invalidLogin"); //redirects to login with failed login

		}

	}

}
