<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>

	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  ${logintest}. </P>

<form action="loginProcess" method="post">
	memberID : <input type="text" name="memberID" /><br>
<input type="password" name="password" />

<!-- <form:input type="password" id="loginpassword" placeholder="Password" /> -->
<input type="submit" id="login" value="Sign In" /></form>

	<script>
		
	</script>
	
	<form action="logout" method="get">
	
	<input type="submit" name="logout" value="logout"/>
	<a href="logout">logout</a>
	</form>
</body>
</html>
