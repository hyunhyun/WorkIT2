<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<!-- autocomplete from jQuery Ui -->

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->

<head>
<title>Home</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<h1></h1>

	<!-- <form action="/team" method="post" id="fr"> -->
	<input type="text" name="teamName" placeholder="teamName" id="teamName" />
	<input type="text" id="addMember" placeholder="memberADD" />
	<input type="button" onclick="add()" value="add Member" />
	<input type="button" onclick="send()" value="submit">
	<!-- </form> -->

	<script type='text/javascript'>
var teamMemberArray;
$(document).ready(function(){
	teamMemberArray = new Array();
});


	function add(){
		alert("addMember");
		
		var teamMember = new Object();
		teamMember.memberID = $('#addMember').val();
		
		//팀 만든 사용자도 teamMember에 등록
		teamMemberArray.push(teamMember);
	}
	
	function send(){
		alert("send");
		
		<% String test_s = (String)request.getSession().getAttribute("memberID"); %>
		var userID = '<%=test_s %>';
		
		var totalInfo = new Object();
		
		var teamMember = new Object();
		teamMember.memberID = userID;
		
		//teamMemberArray.push(userID);
		
		//팀 만든 사용자도 teamMember에 등록
		teamMemberArray.push(teamMember);
		
		
		totalInfo.teamMembers = teamMemberArray;
		totalInfo.madeBy = userID;
		totalInfo.teamName = $("#teamName").val();
		
		var jsonInfo =JSON.stringify(totalInfo);
		
		console.log(jsonInfo);
		alert(jsonInfo);
		$.ajax({
			url:"http://localhost:8080/sc30/team",
			method: "POST",
			datatype: "JSON",
			data: jsonInfo, 
			contentType : "application/json; charset=UTF-8",
			success: function(result){
				alert("success");
			},
			error: function(jqXHR,request, error){
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			},
			statusCode: {
		        200: function () {
		            console.log("200 - Success");
		        },
		        404: function(request, status, error) {
		            console.log("404 - Not Found");
		            console.log(error);
		        },
		        500: function(request, status, error){
		        	console.log("500 - Internal Server Error");
		            console.log(error);			
		            }
		        }
			
		})
	}
	
</script>
</body>
</html>


