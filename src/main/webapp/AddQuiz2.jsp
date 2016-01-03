<!-- old html made to test functionality -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Question Creator</title>
</head>
<body>


	<form action="/uploads" enctype="multipart/form-data" method="post">
	
		<!--  -->
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile(event)"> 
		<img id="img1" /> 
		<br><br>
		
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile2(event)"> 
		<img id="img2" /> 
		<br><br>
		
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile3(event)"> 
		<img id="img3" /> 
		<br><br>
		
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile4(event)"> 
		<img id="img4" />
		<br><br>
		
		<input type="file" name="uploadFile" accept="image/*"
			onchange="loadFile5(event)"> 
		<img id="img5" /> 
		<br><br>
	
		
		Insert Text input: <input type="text" name="text1" />
		<br><br>
		Insert Text input: <input type="text" name="text2" />
		<br><br>
		Insert Text input: <input type="text" name="text3" />
		<br><br>
		Insert Text input: <input type="text" name="text4" />
		<br><br>
		Insert Text input: <input type="text" name="text5" />
		<br><br>
		<input type="radio" name="CorrectAnswer" value="1">Answer 1<br>
		<input type="radio" name="CorrectAnswer" value="2">Answer 2<br>
		<input type="radio" name="CorrectAnswer" value="3">Answer 3<br>
		<input type="radio" name="CorrectAnswer" value="4">Answer 4<br>
		
		<input type="submit"/>
	</form>
	
		

	<script>
		var loadFile = function(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('img1');
				output.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);
		};
		var loadFile2 = function(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output2 = document.getElementById('img2');
				output2.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);
		};
		var loadFile3 = function(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output3 = document.getElementById('img3');
				output3.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);
		};
		var loadFile4 = function(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output4 = document.getElementById('img4');
				output4.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);
		};
		var loadFile5 = function(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output5 = document.getElementById('img5');
				output5.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);
		};
	</script>


</body>
</html>