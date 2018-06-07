<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<html>
<head>
	<title>Main</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
	<!-- <script src="path/to/jquery.cookie.js"></script> -->
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"/>
<!-- 	<script src="jquery.cookie.js"></script>   -->
</head>
<body>
<div class="container">
<h1>
	MainPage  
</h1>


<c:if test="${topicList != '' || topicList ne null}">
	<c:forEach var="topic" items="${topicList}">
    <li onclick="topicSelected(${topic.topicID})">${topic.topicName},&nbsp;</li>
   </c:forEach>
    
   </c:if>

<%
	/* if(session.getAttribute("memberID") = null){
		response.sendRedirect("login");
	} */
	out.println(session.getAttribute("memberID"));
	
%>

createTopic

<div id="MemoContainer">
</div>

<input type="text" name="topicName" placeholder="topicName" id="tName"/>
<input type="button" value="ok" onclick="createTopic()"/>

	
	</div>
	<script>
		function createTopic(){
			var topicName = $(".tName").val();
			var data = {"topicName": topicName, "teamID": $.cookie("teamID")};
			$.ajax({
				type : "GET", 
				url : "http://localhost:8080/sc30/createTopic",
				data : data
			});
		}
		
		function topicSelected(topicID){
			$.ajax({
				type: "GET",
				url : "http://localhost:8080/sc30/getTopicMemo",
				succcess: function(result){
					var memoContainer = $("#MemoContainter");
					var list = ${topicMemo};
					
					list.forEach(function createMemoDiv(value, index){
						var div = $("<div id= 'memo_"+index+"'>"+value.title+"</div>");
						memoContainer.append(div);
					})
					
				},
				error : function(){
					var memoContainer = $("#MemoContainter");
					var div = $("<div>no Memo</div>");
					memoContainer.append(div);
				}
			});
		}
	</script>
</body>
</html>