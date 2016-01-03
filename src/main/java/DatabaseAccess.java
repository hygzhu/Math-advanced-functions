import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/*
 * Reference
 * Connecting to the Database with Java by MySQL open source database, Accessed May 5, 2015
	http://dev.mysql.com/doc/connector-j/en/connector-j-usagenotes-connect-drivermanager.html
	(Reference for database access methods templates)
 */

//Java servlet which contains methods that access the database

public class DatabaseAccess {

	static Connection connection;
	static String url = "jdbc:mysql://127.13.71.130:3306/math";
	static String username = "adminE96JTPc";
	static String password = "dvzAn-ZicbPk";

	// Database access codes

	public static void stopConnection() {
		if (connection != null)
			try {
				connection.close();
			} catch (SQLException ignore) {
			}
	}// stops the connection

	// Checks if user can login
	public static String login(String userInfo) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}// checks mysql driver

		try {
			connection = DriverManager.getConnection(url, username, password);

			PreparedStatement st = connection
					.prepareStatement("select * from Users");// selects the
																// users table
																// from database
			ResultSet r1 = st.executeQuery();

			while (r1.next()) {
				if ((r1.getString("Username") + r1.getString("Password"))
						.equals(userInfo)) {

					return "true";

				}// Checks if username and password are in database returns true
					// if successful
			}

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database!", e);
		} finally {
			stopConnection();
		}
		return "false";
		// returns false if login failure
	}//*example of reference 

	// verifies if unique user information already exists within the database
	public static String verifyRegister(String fullName, String uName,
			String email, String userType, String classCode) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		try {
			connection = DriverManager.getConnection(url, username, password);

			PreparedStatement st = connection
					.prepareStatement("select * from Users");// selects from
																// user table
			ResultSet r1 = st.executeQuery();

			ArrayList<String> classes = new ArrayList<String>();

			while (r1.next()) {
				classes.add(r1.getString("ClassCode"));

				if ((r1.getString("Username").equals(uName))) {
					return "invalidUser";
				}// checks for duplicate username
				if ((r1.getString("Email").equals(email))) {
					return "invalidEmail";
				}// checks duplicate email
				if (userType.equals("1")) {
					if ((r1.getString("ClassCode").equals(classCode))) {
						return "invalidClassAlreadyExists";
					} else {
						return "true";
					}
				}// if user is a teacher

			}

			for (int i = 0; i < classes.size(); i++) {
				if (classes.get(i).equals(classCode)) {
					return "true";
				}// check for legit class if student
			}
			return "invalidClassNoExist";

		//	return "true";// returns successful registration

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database!", e);
		} finally {
			stopConnection();
		}

	}

	// adds a new user to the database
	public static void addUser(String userName, String passWord,
			String fullName, String email, String userType, String classCode) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		String u = userName;
		String p = passWord;
		String n = fullName;
		String m = email;
		String t = userType;
		String c = classCode;
		// sets some variables

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;
		try {
			connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();
			statement
					.executeUpdate("INSERT INTO Users (Username,Password,FullName,Email,UserType,ClassCode) "
							+ "VALUES  ('"
							+ u
							+ "','"
							+ p
							+ "','"
							+ n
							+ "','"
							+ m + "','" + t + "','" + c + "')");// inserts a
																// user data
																// into new row
		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database!", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}

	// records the url of an uploaded image in the database
	public static String addImage(String fileName) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		String imageID = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();
			statement.executeUpdate("INSERT INTO Images (FileName) "
					+ "VALUES  ('" + fileName + "')");// adds an image link into
														// the database

			PreparedStatement st = connection
					.prepareStatement("select * from Images ORDER BY ImageID DESC");// Selects
																					// all
																					// from
																					// image
																					// table

			ResultSet r1 = st.executeQuery();

			r1.next();

			imageID = Integer.toString((r1.getInt("ImageID")));// gets the id of
																// the image

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database!", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

		return imageID + fileName;// returns the image and file name
	}

	// Adds the text of a quiz question into the database
	public static int addQuizText(String text1, String text2, String text3,
			String text4, String text5, String correctAnswer) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		String a = text1;
		String b = text2;
		String c = text3;
		String d = text4;
		String e = text5;
		// get parameters
		int quizID = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException f) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", f);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();

			statement
					.executeUpdate("INSERT INTO Quiz (Text1,Text2,Text3,Text4,Text5,Image1,Image2,Image3,Image4,Image5,CorrectAnswer) "
							+ "VALUES  ('"
							+ a
							+ "','"
							+ b
							+ "','"
							+ c
							+ "','"
							+ d
							+ "','"
							+ e
							+ "',"
							+ "'image1'"
							+ ","
							+ "'image2'"
							+ ","
							+ "'image3'"
							+ ","
							+ "'image4'"
							+ ", "
							+ "'image5'"
							+ ", '" + correctAnswer + "')");// inserts variables
															// into database

			PreparedStatement st = connection
					.prepareStatement("select * from Quiz ORDER BY QuizID DESC");// selects
																					// from
																					// quiz
																					// table

			ResultSet r1 = st.executeQuery();

			r1.next();

			quizID = (r1.getInt("QuizID"));// get quiz id

		} catch (SQLException f) {
			throw new RuntimeException("Cannot connect the database!", f);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

		return quizID;

	}

	// Adds the image urls of a quiz question to the database
	public static String addQuizImage(String Image, int quizID, int imageNumber) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		String imageID = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();
			PreparedStatement stmt = connection.prepareStatement("UPDATE Quiz "
					+ "SET image" + imageNumber + "=? WHERE QuizID=" + quizID);
			stmt.setString(1, quizID + "-" + imageNumber + "-" + Image);
			stmt.executeUpdate();// updates quiz with specific image

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database!", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

		return quizID + "-" + imageNumber + "-" + Image + "/" + imageNumber;// returns
																			// a
																			// string
																			// of
																			// the
																			// info
	}

	// retrieve quiz information compiled into a string
	public static String getQuiz(int quizID) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		String quiz = "";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();

			for (int i = 1; i <= 5; i++) {
				PreparedStatement st = connection
						.prepareStatement("select * from Quiz WHERE QuizID="
								+ quizID + " ORDER BY Text" + i + " DESC");// Select
																			// from
																			// quiz
																			// table
																			// to
																			// get
																			// info
																			// for
																			// the
																			// quiz

				ResultSet r1 = st.executeQuery();

				r1.next();

				quiz = quiz + r1.getString("Text" + i + "") + "*";
			}// gets text values

			for (int i = 1; i <= 5; i++) {
				PreparedStatement st = connection
						.prepareStatement("select * from Quiz WHERE QuizID="
								+ quizID + " ORDER BY Image" + i + " DESC");// Selects
																			// from
																			// quiz
																			// table
																			// at
																			// a
																			// specific
																			// quiz
																			// id

				ResultSet r1 = st.executeQuery();

				r1.next();

				quiz = quiz + r1.getString("Image" + i + "") + "*";
			}// gets image values

			PreparedStatement st = connection
					.prepareStatement("select * from Quiz WHERE QuizID="
							+ quizID + " ORDER BY CorrectAnswer DESC");// Selects
																		// from
																		// quiz
																		// table
																		// for
																		// correct
																		// answer
			ResultSet r1 = st.executeQuery();
			r1.next();
			quiz = quiz + r1.getString("CorrectAnswer") + "*";
			// gets correct answer

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database!", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

		return quiz;// returns the quiz info
	}

	// returns true or false depending on if the answer to a quiz question is
	// right or wrong
	public static boolean checkAnswer(int quizID, String answer) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();

			PreparedStatement st = connection
					.prepareStatement("select * from Quiz WHERE QuizID="
							+ quizID + "");// select from quiz table where quiz
											// ID is the parameter

			ResultSet r1 = st.executeQuery();

			r1.next();

			String correctAnswer = r1.getString("CorrectAnswer");// get correct
																	// answer

			if (correctAnswer.equals(answer)) {
				return true;
			}// Check for correct answer

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database!", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

		return false;// Returns that answer is false
	}

	// Get the users username using the userID
	public static String getUsername(String UserID) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);

			PreparedStatement st = connection
					.prepareStatement("select * from Users WHERE UserID='"
							+ UserID + "'");// select from users table where
											// user id is the parameter

			ResultSet r1 = st.executeQuery();

			r1.next();

			String userName = r1.getString("Username");// get the string
														// username

			return userName;

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database! ", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}

	// Get the users full name using the userID
	public static String getFullName(String UserID) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);

			PreparedStatement st = connection
					.prepareStatement("select * from Users WHERE UserID='"
							+ Integer.parseInt(UserID) + "'");// Select from
																// users table
																// where user id
																// is equal to
																// the parameter

			ResultSet r1 = st.executeQuery();

			r1.next();

			String fullName = r1.getString("FullName");// Get the full name

			return fullName;// returns the full name

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database! ", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}

	// gets the users type returned as a string
	public static String getUserType(String UserID) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);

			PreparedStatement st = connection
					.prepareStatement("select * from Users WHERE UserID='"
							+ UserID + "'");// select from users table with
											// userid equal to the parameter

			ResultSet r1 = st.executeQuery();

			r1.next();

			String userType = r1.getString("UserType");// get user's type

			return userType;// return usertype

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database! ", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}

	// get a users ID using their username
	public static int getUserID(String userUsername) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);

			PreparedStatement st = connection
					.prepareStatement("select * from Users WHERE Username='"
							+ userUsername + "'");// select from users table
													// where the username is the
													// parameter

			ResultSet r1 = st.executeQuery();

			r1.next();

			int userID = r1.getInt("UserID");// gets the user id

			return userID;// returns the user id

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database! "
					+ userUsername, e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}

	// get the ids of all the questions
	public static String getQuestionID() {

		String questions = "";

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);

			PreparedStatement st = connection
					.prepareStatement("select * from Quiz");// selects from quiz
															// table

			ResultSet r1 = st.executeQuery();

			while (r1.next()) {
				questions = questions + r1.getInt("QuizID") + "-";
			}// adds each quiz question id

			return questions;// returns the questions ids

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database! ", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}

	// Uploads a specific set of quiz questions
	public static void uploadQuizSet(String quizSet) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		int totalQuestions = 0;
		String quizSetNumber = quizSet;
		// initialize and declare variables

		for (int i = quizSetNumber.indexOf(" "); i != -1; i = quizSetNumber
				.indexOf(" ")) {
			quizSetNumber = quizSetNumber.substring(i + 1,
					quizSetNumber.length());
			totalQuestions++;
		}// Counts the number of questions

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();

			statement
					.executeUpdate("INSERT INTO QuizSet (TotalQuestions,QuizID,DailyQuizSet) "
							+ "VALUES  ('"
							+ totalQuestions
							+ "','"
							+ quizSet
							+ "','"+""+"')");// insert values into quizset table to database

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database! ", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}

	// get the ids for all quizsets
	public static String getQuizID() {

		String quiz = "";

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);

			PreparedStatement st = connection
					.prepareStatement("select * from QuizSet");// Selects all
																// elements from
																// QuizSet table

			ResultSet r1 = st.executeQuery();

			while (r1.next()) {
				quiz = quiz + r1.getInt("QuizSetID") + "-";// Adds QuizSetID to
															// string
			}

			return quiz;// returns String of QuizSet IDs

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database! ", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}

	// get information of a specific quiz set
	public static String getQuizSet(int quizSetID) {

		String quizID = "";
		String totalQuestions = "";

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);

			PreparedStatement st = connection
					.prepareStatement("select * from QuizSet WHERE QuizSetID="
							+ quizSetID);// select from quizset table

			ResultSet r1 = st.executeQuery();

			r1.next();

			quizID = r1.getString("QuizID");
			totalQuestions = r1.getString("TotalQuestions");

			return totalQuestions + "*" + quizID;// returns totalquestions and
													// quizid with a separator

		} catch (SQLException e) {
			throw new RuntimeException(
					"Cannot connect the database! The quizSetID is" + quizSetID,
					e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}

	// adds a specific quizset result when a student completeds a quiz
	public static void addResult(String userID, String quizSetID,
			String totalQuestions, String questionsCorrect, String answers) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();

			statement
					.executeUpdate("INSERT INTO QuizResults (UserID,QuizSetID,TotalQuestions,QuestionsCorrect,Answers) "
							+ "VALUES  ('"
							+ userID
							+ "','"
							+ quizSetID
							+ "','"
							+ totalQuestions
							+ "','"
							+ questionsCorrect
							+ "','"
							+ answers + "')");// inserts results into
												// quizresults table

		} catch (SQLException e) {
			throw new RuntimeException(
					"Cannot connect the database! The quizSetID is" + quizSetID,
					e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}

	// Checks if a user has already completed the specified quiz set
	public static boolean hasCompletedQuiz(String userID, String quizSetID) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);

			PreparedStatement st = connection
					.prepareStatement("select * from QuizResults");// select
																	// from quiz
																	// results
																	// table
			ResultSet r1 = st.executeQuery();

			while (r1.next()) {
				if ((r1.getString("UserID").equals(userID))
						&& r1.getString("QuizSetID").equals(quizSetID)) {

					return true;// checks if there is already a user result for
								// this quiz

				}
			}
			return false;// user has already completed the quiz

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database! ", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}

	// Get the quiz results for a specific user and quiz set
	public static String getSingleUserResults(String userID, String quizSetID) {

		String results = "";
		String questionsCorrect = "";
		String totalQuestions = "";

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();

			PreparedStatement st = connection
					.prepareStatement("select * from QuizResults WHERE QuizSetID="
							+ quizSetID + " AND UserID=" + userID);// select
																	// from quiz
																	// results
																	// table

			ResultSet r1 = st.executeQuery();

			r1.next();

			results = r1.getString("Answers");
			questionsCorrect = r1.getString("QuestionsCorrect");
			totalQuestions = r1.getString("TotalQuestions");
			return questionsCorrect + "<" + totalQuestions + ">" + results; // returns
																			// results
			// gets the results and returns them

		} catch (SQLException e) {
			throw new RuntimeException(
					"Cannot connect the database! The quizSetID is" + quizSetID,
					e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}
	}

	// Updates the daily quiz
	public static void updateDailyQuiz(String quizSetID) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);

			// String quizIDs = getQuizID();
			String quizIDs = getQuizID();

			for (String i = quizIDs; i.indexOf("-") != -1; i = i.substring(
					i.indexOf("-") + 1, i.length())) {
				PreparedStatement stmtOne = connection
						.prepareStatement("UPDATE QuizSet SET DailyQuizSet=? WHERE QuizSetID="
								+ i.substring(0, i.indexOf("-")));
				stmtOne.setString(1, "");
				stmtOne.executeUpdate();
			}// clears all rows by getting all quizSetIDs then gets substrings
				// of each id to remove the cell according

			PreparedStatement stmtTwo = connection
					.prepareStatement("UPDATE QuizSet SET DailyQuizSet=? WHERE QuizSetID="
							+ quizSetID);
			stmtTwo.setString(1, "yes");
			stmtTwo.executeUpdate();
			// updates the one quiz set id

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database!", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}

	// gets the current daily quiz set id
	public static String getDailyQuizSet() {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(url, username, password);
			PreparedStatement st = connection
					.prepareStatement("select * from QuizSet WHERE DailyQuizSet="
							+ "'yes'");// select from quiz set table

			ResultSet r1 = st.executeQuery();

			r1.next();

			String quizSetID = r1.getString("QuizSetID");

			return quizSetID;//returns the quizset ID
		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database!", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}
	//Gets the quiz results for a quizset
	public static String getQuizResults(String quizSetID) {

		String url = "jdbc:mysql://127.13.71.130:3306/math";
		String username = "adminE96JTPc";
		String password = "dvzAn-ZicbPk";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		Connection connection = null;

		try {
			String results = "";

			connection = DriverManager.getConnection(url, username, password);
			PreparedStatement st = connection
					.prepareStatement("select * from QuizResults Where QuizSetID="
							+ quizSetID);//select from quizresults table

			ResultSet r1 = st.executeQuery();

			while (r1.next()) {
				results = results + getFullName(r1.getString("UserID")) + "-"
						+ r1.getString("QuestionsCorrect") + "/"
						+ r1.getString("TotalQuestions") + "-"
						+ r1.getString("Answers") + "^";// Adds results
			}

			return results;// returns results in the format of
							// "userID-QuestionsCorrect/TotalQuestions-Answers^"

		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect the database!", e);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ignore) {
				}
		}

	}
}
