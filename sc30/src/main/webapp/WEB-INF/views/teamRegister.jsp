<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<!-- autocomplete from jQuery Ui -->

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->


<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    
<title>Home</title>
<!-- 부트스트랩 -->
<!--     <link href="resources/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<h1></h1>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
      <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
  <!--   <script src="resources/js/bootstrap.min.js"></script> -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

/* $(function(){
	$().autocomplete({
		source : function(request, response){
			$.ajax({
				type : "POST",
				url: "",
				data:,
				success: function(){s},
				error:function(){},
				
			})
		}
	});
}) */


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
	
	$("#addMember").autocomplete({
		source: function(request, response){
			$.ajax({
				url: "http://localhost:8080/sc30/member",
				method: "GET",
				data: {search: $("#addMember").val()},
				success: function(data){
					console.log(data);
					response($.map(data, function(item){
						return {label: item.memberID, value: item.memberID};
					}));
				},
				error : function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			})	
		}
	})
	
</script>
</body>
</html>


