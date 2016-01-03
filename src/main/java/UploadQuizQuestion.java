
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/*
 * Reference
 * 
 * 1. Upload and serve files and Example Code by cdaley, Created on Feb 6, 2013, Accessed May 2, 2015. https://forums.openshift.com/how-to-upload-and-serve-files-using-java-servlets-on-openshift
	(Reference in quiz question upload function for images)
 */

//Java Servlet to allow uploading of quiz questions to the database and image files

@WebServlet(name = "uploads", urlPatterns = { "/uploads/*" })
@MultipartConfig
public class UploadQuizQuestion extends HttpServlet {

	private static final long serialVersionUID = 2857847752169838915L;
	int BUFFER_LENGTH = 4096;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// text upload
		String text1 = request.getParameter("text1");
		String text2 = request.getParameter("text2");
		String text3 = request.getParameter("text3");
		String text4 = request.getParameter("text4");
		String text5 = request.getParameter("text5");
		String correctAnswer = request.getParameter("CorrectAnswer");
		//get parameters
		
		int quizID = DatabaseAccess.addQuizText(text1, text2, text3, text4,
				text5, correctAnswer );//adds quiz text
		int imageNumber = 1;
		String output;

		// image upload for loop
		PrintWriter out = response.getWriter();// allows out.println()
		for (Part part : request.getParts()) {
			InputStream is = part.getInputStream(); //set it to take individual part names
			String fileName = getFileName(part);

			//checks file names
			if (fileName == null) {

			} else {

				fileName = fileName.replaceAll(" ", "");

				output = DatabaseAccess.addQuizImage(fileName, quizID,
						imageNumber);// renames
										// file
										// name

				String finalFileName = output.substring(0, output.indexOf("/"));
				imageNumber = Integer.parseInt(output.substring(output
						.indexOf("/") + 1));

				FileOutputStream os = new FileOutputStream(
						System.getenv("OPENSHIFT_DATA_DIR") + finalFileName);//allows the file to be uploaded
				byte[] bytes = new byte[BUFFER_LENGTH];
				int read = 0;
				while ((read = is.read(bytes, 0, BUFFER_LENGTH)) != -1) {
					os.write(bytes, 0, read);
				}//writes the file code
				os.flush();
				is.close();
				os.close();
				//clears outputstream and closes inputstream
				out.println(finalFileName + " was uploaded to "
						+ System.getenv("OPENSHIFT_DATA_DIR"));
			
			imageNumber++;//moves on to next image
			}//*reference 1

		}
		String quiz = DatabaseAccess.getQuiz(quizID);

		ArrayList<String> text = new ArrayList<String>(); //Arraylist for parameters


		for (int i = quiz.indexOf(" "); i != -1; i = quiz.indexOf(" ")) {

			text.add(quiz.substring(0, i));

			quiz = quiz.substring(i + 1, quiz.length());
		}


		response.sendRedirect("1_QuestionsPage.jsp");//redirects to question page
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		//retrieves specific file

		String filePath = request.getRequestURI();

		File file = new File(System.getenv("OPENSHIFT_DATA_DIR")
				+ filePath.replace("/uploads/", ""));
		InputStream input = new FileInputStream(file); 

		response.setContentLength((int) file.length());
		response.setContentType(new MimetypesFileTypeMap().getContentType(file));

		OutputStream output = response.getOutputStream();
		byte[] bytes = new byte[BUFFER_LENGTH];
		int read = 0;
		while ((read = input.read(bytes, 0, BUFFER_LENGTH)) != -1) {
			output.write(bytes, 0, read);
			output.flush();
		}

		input.close();
		output.close();
	}//*reference 1

	private String getFileName(Part part) {
		
		//gets the file name
		
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}//*reference 1

		return null;
	}
}