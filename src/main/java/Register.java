import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Java servlet to allow user to register

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection;


	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String fullName = request.getParameter("fullname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String userType = request.getParameter("type");
		String classCode = request.getParameter("classcode");
		//gets parameters from jsp

		if((DatabaseAccess.verifyRegister(fullName, username, email, userType, classCode)).equals("true")){
			
			DatabaseAccess.addUser(username, password, fullName, email, userType, classCode);
			
			((HttpServletResponse) response).sendRedirect("http://math-afunctions.rhcloud.com/Login2.jsp");
			//checks if data is not duplicate and can be added to the database
			
		}else if((DatabaseAccess.verifyRegister(fullName, username, email, userType, classCode)).equals("invalidUser")){
		    response.sendRedirect( "Register2.jsp?failure=invalidUser" );//redirects if the username is invalid
		    
		}else if((DatabaseAccess.verifyRegister(fullName, username, email, userType, classCode)).equals("invalidEmail")){
			

		    response.sendRedirect( "Register2.jsp?failure=invalidEmail" );//redirects if the email is invalid
		    
		}else if((DatabaseAccess.verifyRegister(fullName, username, email, userType, classCode)).equals("invalidClassNoExist")){
			

		    response.sendRedirect( "Register2.jsp?failure=invalidClassNoExist" );//redirects if the clas does not exist
		    
		}else if((DatabaseAccess.verifyRegister(fullName, username, email, userType, classCode)).equals("invalidClassAlreadyExists")){
			

		    response.sendRedirect( "Register2.jsp?failure=invalidClassAlreadyExists" );//redirects if the class already exists
		    
		}
		
	

	}

}
