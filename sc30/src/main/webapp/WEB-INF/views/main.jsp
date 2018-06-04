<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Main</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
</head>
<body>
<div class="container">
<h1>
	MainPage  
</h1>

<P>  ${content}.  </P>

<%
	/* if(session.getAttribute("memberID") == null){
		response.sendRedirect("login");
	} */
%>

<form action="logout">
<button type="submit">LOGOUT</button>
</form>

	<script>
		
	</script>
	</div>
</body>
</html>