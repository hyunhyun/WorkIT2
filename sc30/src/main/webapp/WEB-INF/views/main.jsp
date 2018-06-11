<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<html>
<head>
	<title>Main</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
	<!-- <script src="path/to/jquery.cookie.js"></script> -->
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<!-- 	<script src="jquery.cookie.js"></script>   -->
</head>
<body>
<div class="container">
<h1>
	MainPage  
</h1>



<c:if test="${topicList != '' || topicList ne null}">
<div class="col-sm-3 col-md-2 sidebar">x
<ul class="nav nav-pills nav-stacked">
<%-- 	<c:set var="i" value="1"/> --%>
	<c:forEach var="topic" items="${topicList}">
	<%-- <c:if test="${i == 1}">
    <li role="presentation" class="active" onclick="topicSelected(${topic.topicID})"><a>${topic.topicName}</a></li>
   </c:if>
   <c:choose>
   <c:otherwise> --%>
   <li role="presentation" >
   <a onclick="topicSelected(${topic.topicID})">${topic.topicName}</a>
  <!-- <div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="topicDropDown" data-toggle="dropdown" aria-expanded="true">
    update
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="topicDropDown">
   <li role="presentation"><a role="menuitem" tabindex="-1" href="#">수정</a></li>
   <li role="presentation"><a role="menuitem" tabindex="-1" href="#">삭제</a></li>
   </ul>
   </div> -->
   
   <button class="btn btn-default" onclick="updateTopic(${topic.topicID})">수정</button>
   <button class="btn btn-default" onclick="deleteTopic(${topic.topicID})">삭제</button>
   </li>
   
   
   
   
  <%--  </c:otherwise>
   </c:choose> --%>
   </c:forEach>
    </ul>
    </div>
   </c:if>

<%-- <c:if test="${topicList ne null}">
<ul class="nav nav-pills nav-stacked">
<c:forEach var="topic" items="${topicList}">
  <li role="presentation"> <a href="#">${topic.topicName}</a></li>
  </c:forEach>
</ul>
</c:if> --%>

<%
	/* if(session.getAttribute("memberID") = null){
		response.sendRedirect("login");
	} */
	out.println(session.getAttribute("memberID"));
	
%>

createTopic



<input type="text" name="topicName" placeholder="topicName" id="tName"/>
<input type="button" value="ok" onclick="createTopic()"/>

<div class="container-fluid" id="MemoContainer">
memocontainer

<input type="button" value="create Memo" onclick="createMemo()"/>


</div>


 


<div id="createMemoDiv" hidden="true">
	<input type= "text" name="title" placeholder="title" id="title_create"/>
	<input type= "textarea" name="content" placeholder="content" id="content_create"/>
	<input type="text" name="responsable" placeholder="responsable" id="responsable_create"/>
	<input type="button" value="완료" onclick="submitMemo()">
</div>
<div id="readMemoDiv">
	<div id="title_read">제목</div>
	<div id="content_read">내용</div>
	<div id="responsable_read">책임자</div>
	</div>
	
	</div>
	<script>
	function createTopic(){
		var topicName = $("#tName").val();
		alert("create Topic");
		alert(${teamID});
		var data = {"topicName": topicName, "teamID": ${teamID}};
		//var data = {"topicName": topicName, "teamID": $.cookie("teamID")};
		$.ajax({
			type : "POST", 
			url : "http://localhost:8080/sc30/topic",
			data : data,
			success : function(){},
			error: function(){},
			statusCode: {
				411: function(request, status, error){
					console.log("411- length required");
					alert("topicName 길이 10 이하");
				}
			}
		});
	}
		
		function topicSelected(topicID){
			var data = {"topicID" : topicID};
			alert(topicID);
			$.ajax({
				type: "GET",
				url : "http://localhost:8080/sc30/memo/list",
				data: data,
				success: function(result){
					var memoContainer = $("#MemoContainer");
					//alert(memoContainer);
					
					var list = ${topicMemo}
					
					list.forEach(function createMemoDiv(value, index){
						var div = $("<div id= 'memo_"+index+"'>"+value.title+"</div>");
						memoContainer.append(div);
					})
					
				},
				error : function(){
					var memoContainer = $("#MemoContainer");
					//alert(memoContainer);
					var div = $("<div>no Memo</div>");
					//memoContainer.append(div);
					memoContainer.text('No Memo');
					//memoContainer.append("attached");
					//memoContainer.prop('hidden', true);
				}
			});
		}
		
		function createMemo(){
			var createMemoDiv= $("#createMemoDiv");
			createMemoDiv.prop('hidden', false);			
		}
		
		function submitMemo(){		
			var totalInfo = new Object();
			
			totalInfo.title = $("#title_create").val();
			totalInfo.content = $("#content_create").val();
			totalInfo.responsable = $("#responsable_create").val();
			
			var jsonInfo =JSON.stringify(totalInfo);
					
			//var data = {"title" : title, "content": content, "responsable" : responsable};
			$.ajax({
				type: "POST",
				url: "http://localhost:8080/sc30/memo",
				data: jsonInfo,
				datatype: "JSON",
				contentType : "application/json; charset=UTF-8",
				success: function(data){
					//read로 바꿔놓아야함 - 해당글
					var obj = JSON.parse(data);
					var data_title = obj.title;
					var data_content= obj.content;
					var data_responsable = obj.responsable;
					
					$("#createMemoDiv").prop('hidden', true);
					$("#readMemoDiv").prop('hidden', false);
					$("#title_read").text(data_title);
					$("#content_read").text(data_content);
					$("#responsable_read").text(data_responsable);
				},
				error : function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
				})		
			
		}
		
		function updateTopic(topicID){
			/* $.ajax({
				type: "PUT",
				url: "http://localhost:8080/sc30/topic",
				data:
				
			}) */
		}
		
		function deleteTopic(topicID){
			//var totalInfo = {"topicID": topicID};
			var totalInfo = new Object();
			totalInfo.topicID = topicID;
			
			console.log("lets delete");
			alert("topicID"+topicID);
			$.ajax({
				type:"DELETE",
				url:"http://localhost:8080/sc30/topic",
				data : totalInfo,
				//datatype: "JSON",
				//contentType : "application/json; charset=UTF-8",
				success: function(){
					alert("topic deleted");
				},
				error :function(jqXHR,request, error){
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