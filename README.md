# math-advanced-functions
Project made in Grade 12 (Early 2015)

A PDF of the design document has been added in the repository

1.0 Introduction
The program Math Advanced Functions is a web based application that is designed to give the teacher
of MHF4U aid to student progress throughout the course by giving daily quizzes. The
teacher uses this data at anytime throughout the course to get a snapshot of which
students are understanding the material and which ones need extra help. They can
also, at the end of the quiz, use the total collected data to help give a final mark to
the student.

2.0 Production
2.1 Website Design
The design of the webpage was created during the paper prototype stage of
production and all team members had contributed to the structure. Each web page
was outlined and predicted features and functionality were shown and displayed.

2.2 Application Design
The overall design of navigation and function for users was made along the design of
the website itself since it was required that a graphics user interface was to be
determined before features could be decided.

2.3 Team Roles
Haoyang Zhu ‐ Lead programmer and Management​: This role required to program the
backend of the application including managing a database and programming
corresponding Java Servlets for various web pages. In addition to programming, this
role required the practice of making sure the team stayed on track and completed
work on due dates.

YiYang Jiang ‐ Secondary programmer and website designer​: This role required to
program the frontend of the coding mainly composed of HTML and CSS with help of
the lead programmer for JavaScript and allowing the web pages to be connected with
Java Servlets. This role is also response for the implementation of website design and
changes throughout the implementation.

3.0 Functionality

3.1 Openshift by RedHat
The application was hosted for free on Openshift which is a service platform by
Redhat. The web domain it was registered as is called math‐afunctions.rhcloud.com
and has free storage provided by openshift. Along with the application, it includes the
following cartridges: Tomcat 7, MySQL 5.5 and phpMyAdmin 4.0. Overall, any coding
wa done in Eclipse and updates were uploaded to the server.

3.2 Java Servlets
All web pages were coded as JSP (Java Servlet Page) as opposed to the standard HTML
page so that they could be coupled with the JAVA servlets and become more dynamic
than a standard html page. All JSP pages had standard HTML, Javascript and CSS
references while still being able to support JAVA code while connecting to the
servlet. Each servlet has two important methods called doGet and doPost which are
accessed through the servlet URL or an HTML form made in a JSP.

3.3 Java HTML Session
To save user data and login information in the browser, Java HTML sessions were
used. A session is created when the login servlet is accessed and assigns attributes to
the session depending on the usertype that logs in. Throughout the application, the
sessions are used to regulate and restrict user access so that student accounts cannot
access teacher pages and vice‐versa.

3.4 MySQL Database and phpMyAdmin
To save user data and information in a permanent location, a MySQL database was
used and was accessed through Java code and MySQL commands. The phpMyAdmin
cartridge on the application allowed a visual representation of the database and
creation of data tables with specific structures was done.

5.0 Menus and Web Pages
Most of the pages share the same url between student and teacher, however, there
are restrictions put onto each pages so that when a user that is a student goes to say
the Main Menu, it will redirect them to a student version of that page, and same thing
happens with the teacher. There is also a restriction that whenever someone has a
copy of the url, and uses that to go to a certain page without logging in, it won't allow
them to. Only after the user has logged in can they go to different pages through
pasting the url. The styles of the pages also change depending on the functionality of
the page. If the pages are made for displaying questions, they all have the same style,
if it's used for quiz sets, it also has a particular style

5.1 Welcome page
This web page is the first page that the users will see when they use the website. It
has a clean and minimalistic view to it, which helps the user easily navigate to where
to they want to be. There are two buttons at the top bar for logging in and
registering. At the middle of the page, there is the main title of the website and our
program. Another registration button is placed there to help the new users to get
started.

5.2 Login
This is the login screen, it has two spaces for the user to input their username and
password. If they do not have an account, there is a button at the end of the signin
that redirects them to the register page.

5.3 Register
This is the register page, it has 5 spaces for text: full name, email, username,
password, and class code. The user can choose what type of an account they sign up
with by clicking one of the radio buttons at the bottom. If the user created a teacher
account, the user can create any class code. If the user created a student account,
the class code has to be the same as their teacher’s. At the bottom, it has a option to
return to the login screen if the user has already created an account.
5.4 Main Menu

After users login, this is the first page they see. If they logged in with a teacher
account, the an image similar to the first image will display. This page contains more
buttons in the top navigation bar as teachers has more privileges in the page. (Quiz
Questions, and Quiz Sets). For the student, the only option for them is to do the
current quiz. so the only other navigation bar button is Quiz. After those buttons is
the a placement button to state the username of the current user, and the one after
that is used to sign out and end the current session. On the right side, there is a list
called important links. The teacher may choose to put links to useful websites or to
extra practice questions.
5.5 Quiz Set Page (Students)

Students will use this page to access their daily quiz. The top navigation bar stays
there so the user can still go back to the main menu. The format of this page stays
the same as the main menu, and when the student is ready to do the quiz, they can
click on the button in the body of the page.

5.6 Quiz Questions (Students)
This is the screen the students see when they are doing the quiz. It has the question
at the very top, along with the image. The answer texts are clickable and once
clicked will direct them to the next question. At the top it says which question it is. In
this case, it is the first question out of 3 total questions (⅓).

Once the student has finished all the questions in the question set, it leads them to
this screen which will tell them how many questions they got right out of the total
number of questions. In this case, it is 0/3. At the end, there is a button that directs
them back to the home page.

5.7 Questions page (Teachers)
This page is only accessible by a teacher account. When they arrive, there are 2
options in the body of the page: view previous questions and create a new question. It
has the same format as Main Menu.

5.8 Quiz Set Page (Teachers)
The page is also only accessible to to a teacher account. There are 3 options on this
page: view previous quizzes, create a new quiz set, and see student scores. The
client, Ms.D requested that quizzes should be longer than simply one questions, and
quiz sets was the solution to that problem. Quiz sets are sets of questions the make of
a quiz.

5.9 Question Bank (Teachers)
The colour of the top bar changed from black to blue because it goes from a
navigation page to a “bank” page. The top bar only contains links to go back to the
Questions, as from there, the user can choose further options for navigation. On this
page, the right side has a scroll down menu used to all the questions in the database.

There is no scroll bar displayed right now as there are not enough questions to fill up
the space. However once there are more questions, the scrollbar will appear. On the
left side, the current selected question is being displayed. Currently, it is the
question with the ID of 7. It comes with 4 answers, the right answer text is displayed
in green while the wrong answers are displayed in red. By clicking on other question
numbers on the right hand bar, it will redirect the user to a page similar to this,
however the question on the left will be the question that they clicked on. If they
clicked on question number 13, question 13 will be expanded to left side.

5.10 Question Creator (Teachers)
This is the screen teachers will use to create their questions. They will input their
question text in the blanks, and if they choose to include images, they can by clicking
the choose file button which will upload an image. This image will be displayed under
the question it is associated with. At the bottom the teacher can choose which of the
4 answer is the correct one.

5.11 Quiz Set Bank (Teachers)
This page is designed for whenever the teacher wants to create a new quiz set, or set
a new quiz as the current quiz for students. The page has 2 columns, the one of the
left provides a list of all the created quiz sets. By clicking on the number the right
column changes to show the questions in that quiz set. By clicking the question
number on the right, it directs you back to the question bank displaying that question.
If the teacher wants to set this quiz set as the current quiz, they must click on the
“Click to add as today’s quiz” button next to the quiz set they want to set. There is
also a large green button for the teacher to create a new quiz set.

5.12 Add Quiz Set (Teachers)
This page is used to link questions in a particular order to create a quiz set. The page
is mainly comprised of two columns. The column on the left is all of the questions
available. Like the question bank list, this list is also a scroll list, the scrollbar is not
showing as there are not enough questions. By clicking the “add to quiz” button under
each question, it will add the question to the new quiz set. The column on the right
displays all the questions in this quiz set. By clicking the button at the bottom of the
right column, it will remove the last question the user submitted in the quiz set, in
case they miss clicked or want to change the order. By clicking the Submit button, it
will add the new quiz set to the quiz set bank.

5.13 Student Results (Teachers)
Whenever the teacher wants to check their student’s results, this page displays all
the students scores with all the quiz sets. The list of numbers is a list of quiz set IDs.
If the teacher wants to find out the students scores for a particular quiz, the teacher
will click on that quiz ID, and under it displays all the student’s results to the quiz. In
this case, the student with the name of YiYang Jiang got none of the questions right.
And under it will show which question he got right or wrong.

6.0 Unimplemented features

6.1 Practice Function
One of the other main functions we had planned to do was the practice function. In
this function, students would have the ability to find questions on certain units they
wished to practice and do those questions. This function was later discarded as there
was not enough time allocated towards this functionality.

6.2 Competitive Function
Another main function we had planned was the ability for players to compete with
each other on quizzes, (similar to quizup). Players would be able to
However, with the lack of time and lack of programming knowledge, this idea was
also scrapped.

6.3 Android Application
After consulting with the client, Ms.D, she made it clear to us that a large number of
her students do not have a android smartphone, this would cause the android
application to be usable for only around 60% of her class. Because of this, we decided
to create a mobile friendly website that can be accessed regardless of what platform.
This change also saved the project a lot of time, the majority of which was spent on
bug fixes.
