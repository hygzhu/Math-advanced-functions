
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//Java servlet which logs the user out and eliminates the session


@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);//Directs to doPost
	}
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        
	    	response.setContentType("text/html");
	        //invalidate the session if exists
	        HttpSession session = request.getSession(false);
	        System.out.println("User="+session.getAttribute("user"));
	        if(session != null){
	            session.invalidate();
	        }
	        response.sendRedirect("WelcomePage.jsp");//redirects to welcome page
}
	    }
