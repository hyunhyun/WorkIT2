<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    
	<title>Main</title>
	
<!-- 부트스트랩 -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
  <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
	<title>Main</title>
	
	<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script> -->

</head>
<body>
<div class="container">
<h1>
	MainPage  
</h1>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
      <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="resources/js/bootstrap.min.js"></script>


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
   
   <button class="btn btn-default" onclick="showModal(${topic.topicID}, '${topic.topicName}')">수정</button>
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

<div class="container-fluid" id="memoContainer">
<div id="insideMemoContainer">memocontainer</div>

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
	
	
	<!-- Modal -->
<div id="updateTopicModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Update TopicName</h4>
      </div>
      <div class="modal-body">
        <!-- <p>Some text in the modal.</p> -->
        <input type="text" id="updateTopicName"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="updateTopic()">Save</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
	
	
	</div>
	<script>
	var globalTopicID = null;
	
	function createTopic(){
		var topicName = $("#tName").val();
		//alert("create Topic");
		//alert(${teamID});
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
			globalTopicID = topicID;
			//var data = {"topicID" : topicID};
			alert("topicID: "+topicID);
			$.ajax({
				type: "GET",
				url : "http://localhost:8080/sc30/memo/list/"+topicID,
				//data: data,
				success: function(result, status,xhr){
					//var memoContainer = $("#memoContainer");
					//alert(memoContainer);
					 //parse(result)
					 //result[0].item
					 alert("success");
					console.log("result : "+result);
					console.log("status : "+status);
					console.log("xhr : "+xhr);
					
						
					var jsonString = JSON.stringify(result);
					var jObject = JSON.parse(jsonString);
					var jLength = jObject.length;
					//alert("length: " + jObject.length);
					
					//alert(jObject[0].memoID);
					//alert(jObject[0].title);
					
					for(var i=0; i<jLength; i++){
						var title = jObject[i].title;
						var div = $("<div id= 'memo_"+i+"'>"+title+"</div>");
						$("#memoContainer").append(div);
					}
					
					
				},
				error : function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(request);
					console.log(error);
					
					var insideMemoContainer = $("#insideMemoContainer");
					//alert(memoContainer);
					//var div = $("<div>no Memo</div>");
					//memoContainer.append(div);
					insideMemoContainer.text('No Memo');
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
			totalInfo.topicID = globalTopicID;
			
			alert("topicMemo");
			console.log(totalInfo);
			//topicID가 여기서 string으로 됨 controller에서 int로 변환이 안됨
			//var jsonInfo =JSON.stringify(totalInfo);
					
			//var data = {"title" : title, "content": content, "responsable" : responsable};
			$.ajax({
				type: "POST",
				url: "http://localhost:8080/sc30/memo",
				data: totalInfo,
				//datatype: "JSON",
				//contentType : "application/json; charset=UTF-8",
				success: function(result, status,xhr){
					//function(data){
			
					alert("memo Created");
					//read로 바꿔놓아야함 - 해당글
					
					//console.log(result);
					//var jsonString = JSON.stringify(result);
					//var jObject = JSON.parse(jsonString);
					//alert(jObject[0].memoID);
					//var data_title = jObject.title;
					//var data_content = obj;
					
					console.log(result);
					
				/* var obj = JSON.parse(json);
					var data_title = obj.title;
					var data_content= obj.content;
					var data_responsable = obj.responsable; */
					/* 
					$("#createMemoDiv").prop('hidden', true);
					$("#readMemoDiv").prop('hidden', false);
					$("#title_read").text(data_title);
					$("#content_read").text(data_content);
					$("#responsable_read").text(data_responsable); */
				},
				error : function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
				})		
			
		}
		function showModal(topicID, topicName){
			globalTopicID = topicID;
			$("#updateTopicModal").modal('show');
			$("#updateTopicName").attr("placeholder", topicName);
		}
		
		function updateTopic(topicID){
			var topicName = $("#updateTopicName").val();
			alert(topicName);
			var totalInfo = new Object();
			totalInfo.topicID = globalTopicID;
			totalInfo.topicName= topicName;
			console.log(totalInfo);
			
			$.ajax({
				type: "PUT",
				url: "http://localhost:8080/sc30/topic",
				data: totalInfo,
				success: function(data){
					alert("topic updated");
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