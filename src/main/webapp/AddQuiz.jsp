<!-- old html made to test functionality -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DONT ACTUALLY USE THIS PAGE IT WAS JUST FOR TESTING AND WILL SCREW UP THE DATABASE</title>


</head>

<body>

	<%
		String fooParameter = request.getParameter("Image");
		if (fooParameter == null) {

		} else {
	%>
	<img
		src='http://math-afunctions.rhcloud.com/uploads/<%out.println(fooParameter);%>' />

	<%
		}
	%>



	<form action="/uploads" enctype="multipart/form-data" method="post">
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile(event)"> <img id="output" /> <input
			type="submit" />
	</form>



	<script>
		var loadFile = function(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('output');
				output.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);
		};
	</script>

</body>
</html>