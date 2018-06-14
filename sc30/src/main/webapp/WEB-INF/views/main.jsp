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

	<script>
		var teamID =  ${teamID};
		var memberID = '<%= session.getAttribute("memberID") %>';
	</script>
	<script src="resources/js/main.js"></script>
	
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

<input type="button" id="createMemoBtn"value="create Memo" onclick="createMemo()"/>


</div>


<div id="createMemoDiv" hidden="true">
	<input type= "text" name="title" placeholder="title" id="title_create"/>
	<input type= "textarea" name="content" placeholder="content" id="content_create"/>
	<input type="text" name="responsable" placeholder="responsable" id="responsable_create"/>
	<input type="button" value="완료" onclick="submitMemo()">
</div>

<div id="memoContainer">


	<div id="noMemoDiv" hiddent="true">
		<div>제목</div>
		<div>내용</div>
		<div>책임자</div>
		</div>
		
		
	<div id="readMemoDiv" hidden="true">
	<input type="button" onclick="updateBtn()" value="수정하기">
	<input type="button" onclick="deleteMemo()" value="삭제하기">
		<div id="title_read">제목</div>
		<div id="content_read">내용</div>
		<div id="responsable_read">책임자</div>
		<input type="button" value="댓글" onclick="getMemoComment()"/>
		<!-- <input type="button" onclick="addComment()" value="+댓글"/> -->
		
		<div id="createComment">
		<input type="text" id="commentText" placeholder="댓글 작성"/>
		<input type="button" onclick="registerComment();" value="댓글 저장"/>
		</div>
		
		<div id="commentList"></div>
	</div>
	
	<div id="updateMemoDiv" hidden="true">
	<input type="button"  value="저장하기" onclick="updateMemo()">
		<input type="text" id="title_update"/>
		<input type="text" id="content_update"/>
		<input type="text" id="responsable_update"/>
	</div>
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
	
</body>
</html>