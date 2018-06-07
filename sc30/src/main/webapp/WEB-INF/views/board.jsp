<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>

	<title>Main</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- 	 <script src="./jquery.cookie.js"></script> -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
</head>
<body>
<div class="container">
<h1>
	Board 
</h1>

<%-- <P>  ${listTeam}.  </P> --%>


<%
	/* if(session.getAttribute("memberID") = null){
		response.sendRedirect("login");
	} */
	out.println(session.getAttribute("memberID"));
	
%>
<%-- <c:if test = "${${listTeam} != null}">--%>
<c:if test="${listTeam != '' || listTeam ne null}">
	<c:forEach var="team" items="${listTeam}">
     <%-- <div onclick="javascript:location.href='./main?teamID=${team.teamID}">${team.teamName},&nbsp;</div> --%>
    <%-- <div onclick="alert(${team.teamID})">${team.teamName},&nbsp;</div> --%>
    <div onclick="teamSelected(${team.teamID})">${team.teamName},&nbsp;</div>
   </c:forEach>
    
   </c:if>
   
<%-- <c:forEach var="listValue" items="${listTeam}">
				<li>${listValue.teamName}</li>
			</c:forEach> --%>

<form action="logout">
<button type="submit">LOGOUT</button>

<a href="registerTeam">create team</a>
</form>

	
	</div>
	
	<script>
		function teamSelected(teamID){
			//var data = {"teamID": teamID};
		//	$.ajax({
		//		type: "GET",
	//			url: "http://localhost:8080/sc30/main"
				
				//data: data
			//});
			
			//alert(teamID);
			
			//쿠키 설정, visits 쿠키값에 10을 설정
			//$.cookie("visits", 10);
			//도메인 fun25.co.kr 의 전체 패스에 값을 설정
			//$.cookie("visits", 10, {path: "/", domain: "fun25.co.kr"});
			//http://xecenter.com/xe/open_tip/4684
			$.cookie("teamID", teamID, {path:'/'});
			var form =$('<form></form>');
			var hidden = $("<input type='hidden' value='"+ teamID+"' name='teamID'/>");
			form.attr('action', 'main');
			form.attr('method', 'get');
			
			form.appendTo('body');
			form.append(hidden);
			form.submit();
		}
		
	</script>
</body>
</html>