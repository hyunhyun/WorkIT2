<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
 <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    
	<title>Main</title>
	
<!-- 부트스트랩 -->
<!--     <link href="resources/css/bootstrap.min.css" rel="stylesheet"> -->
  <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
<!--   <link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
 -->  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css" rel="stylesheet">
	
	<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script> -->

	<script>
		var teamID =  ${teamID};
		var memberID = '<%= session.getAttribute("memberID") %>';
		
		<% 	String contextPath  = request.getContextPath();	%>

	var contextPath = "<%=contextPath%>";
	</script>
	
	
	<style>
/* 첨부파일을 드래그할 영역의 스타일 */
.fileDrop {
    width: 600px;
    height: 70px;
    border: 2px dotted gray;
    background-color: gray;
}


/* . navbar-expand-lg{
	overflow-y: scroll;
} */

/* #navbarResponsive{
	overflow-y:scroll;
} */

#readMemoDiv{
	display: none;
}

#createMemoDiv{
	display: none;
}

#noMemoDiv{
	display : none;
}

#updateMemoDiv {
	display: none;
}


.blog-post-title {
    margin-bottom: .25rem;
    font-size: 2.5rem;
}
h1, .h1, h2, .h2, h3, .h3, h4, .h4, h5, .h5, h6, .h6 {
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-weight: normal;
    color: #333;
}
.h2, h2 {
    font-size: 2rem;
}
.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    margin-bottom: .5rem;
    font-family: inherit;
    font-weight: 500;
    line-height: 1.1;
    color: inherit;
}
h1, h2, h3, h4, h5, h6 {
    margin-top: 0;
    margin-bottom: .5rem;
}
*, ::after, ::before {
    -webkit-box-sizing: inherit;
    box-sizing: inherit;
}
user agent stylesheet
h2 {
    display: block;
    font-size: 1.5em;
    -webkit-margin-before: 0.83em;
    -webkit-margin-after: 0.83em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    font-weight: bold;
}

p {
    margin-top: 0;
    margin-bottom: 1rem;
}
*, ::after, ::before {
    -webkit-box-sizing: inherit;
    box-sizing: inherit;
}

p {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}

body {
    font-family: Georgia, "Times New Roman", Times, serif;
    color: #555;
}
body {
    font-family: -apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #292b2c;
    background-color: #fff;
}

</style>
	
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">

 <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
  <!-- TODO teamID 변수 넘기는거 -->
    <a class="navbar-brand" href="main?teamID=">Main</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="index.html">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Dashboard</span>
          </a>
        </li>
        

        
<c:if test="${topicList != '' || topicList ne null}">
<!-- <div class="col-sm-3 col-md-2 sidebar">x -->
<!-- <ul class="nav nav-pills nav-stacked"> -->
<c:forEach var="topic" items="${topicList}">
<%-- <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
      <a class="nav-link nav-link-collapse collapsed" onclick="topicSelected(${topic.topicID})" data-toggle="collapse" data-parent="#exampleAccordion" >
        <i class="fa fa-fw fa-wrench"></i>
          <span class="nav-link-text">${topic.topicName}</span>
       </a>
  <ul class="sidenav-second-level collapse" id="collapseComponents">
            <li>
              <a  onclick="showModal(${topic.topicID}, '${topic.topicName}')">수정</a>
            </li>
            <li>
              <a onclick="deleteTopic(${topic.topicID})">삭제</a>
            </li>
          </ul>
   </li> --%>
   
   
   <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapse_${topic.topicID}"  data-parent="#exampleAccordion" id="nav-link-collapse_"+${topic.topicID}>
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text" onclick="topicSelected(${topic.topicID})">${topic.topicName}</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapse_${topic.topicID}">
            <li>
              <a onclick="showModal(${topic.topicID}, '${topic.topicName}')">수정</a>
            </li>
            <li>
              <a onclick="deleteTopic(${topic.topicID})">삭제</a>
            </li>
          </ul>
        </li>
   
   
   
    </c:forEach>
    <!-- </ul> -->
    <!-- </div> -->
   </c:if>        
      </ul>
      <!-- nav : navbar-nav navbar-sidenav END -->
      
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-envelope"></i>
            <span class="d-lg-none">Messages
              <span class="badge badge-pill badge-primary">12 New</span>
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="messagesDropdown">
            <h6 class="dropdown-header">New Messages:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>David Miller</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>Jane Smith</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>John Doe</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all messages</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-bell"></i>
            <span class="d-lg-none">Alerts
              <span class="badge badge-pill badge-warning">6 New</span>
            </span>
            <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="alertsDropdown">
            <h6 class="dropdown-header">New Alerts:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-danger">
                <strong>
                  <i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all alerts</a>
          </div>
        </li>
        <li class="nav-item">
          <form class="form-inline my-2 my-lg-0 mr-lg-2">
            <div class="input-group">
              <input class="form-control" type="text" placeholder="Search for...">
              <span class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </form>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- Navigation end -->
<!-- <div class="container"> -->
<div class="content-wrapper">
 <div class="container-fluid">
  <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Cards</li>
      </ol>
<h1>MainPage</h1>
<hr>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
      <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="resources/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="resources/js/main.js"></script>

<%-- <c:if test="${topicList != '' || topicList ne null}">
<div class="col-sm-3 col-md-2 sidebar">x
<ul class="nav nav-pills nav-stacked">
	<c:set var="i" value="1"/>
	<c:forEach var="topic" items="${topicList}">
	<c:if test="${i == 1}">
    <li role="presentation" class="active" onclick="topicSelected(${topic.topicID})"><a>${topic.topicName}</a></li>
   </c:if>
   <c:choose>
   <c:otherwise>
   <li role="presentation" >
   <a onclick="topicSelected(${topic.topicID})">${topic.topicName}</a>

   <button class="btn btn-default" onclick="showModal(${topic.topicID}, '${topic.topicName}')">수정</button>
   <button class="btn btn-default" onclick="deleteTopic(${topic.topicID})">삭제</button>
   </li>

   </c:forEach>
    </ul>
    </div>
   </c:if> --%>

<!-- myWorkList -->
<input type="button" onclick="getMyWorkList()" value="myWorkList"/>


<%
	/* if(session.getAttribute("memberID") = null){
		response.sendRedirect("login");
	} */
	out.println(session.getAttribute("memberID"));
	
%>

createTopic<input type="text" name="topicName" placeholder="topicName" id="tName"/>
<input type="button" value="ok" onclick="createTopic()"/>

<div id="searchContainer">
<input type="text" id="searchContent" placeholder="검색내용"/>
<input type="button" onclick="searchContent()" value="검색"/>
</div>
<!-- <input type="button" id="createMemoBtn" value="create Memo" onclick="createMemo()"/> -->
<button type="button" id="createMemoBtn" onclick="createMemo()">
<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
</button>

<div class="container-fluid" id="memoContainer">

<div id="insideMemoContainer"><span>memoContainer</span>
<div class="row"></div>
</div>




</div>


<div id="createMemoDiv">
	<input type= "text" name="title" placeholder="title" id="title_create"/>
	<input type= "textarea" name="content" placeholder="content" id="content_create"/>
	<input type="text" name="responsable" placeholder="responsable" id="responsable_create"/>
	<!-- <input type= "file" />-->
	<div>
   <!--  첨부파일 등록영역 -->
    <div class="fileDrop">여기에 파일을 드롭해주세요</div>
    <!-- 첨부파일의 목록 출력영역 -->
    <div id="uploadedList"></div>
</div> -->

<!-- 일반적 방식 파일업로드 -->
<!--  <form target="iframePhoto" action="upload/uploadForm" method="post" id="formFile" enctype="multipart/form-data">
        <input type="file" name="file"/>
        <input type="submit" value="업로드"/>    
    </form>
    <iframe name="iframePhoto"></iframe> -->

	<input type="button" 
	value="완료" onclick="submitMemo()">
</div>


<!-- <div id="memoContainer"> -->


	<div id="noMemoDiv">
		<div>제목</div>
		<div>내용</div>
		<div>책임자</div>
		</div>
		
		
	<div id="readMemoDiv">
	<input type="button" onclick="updateBtn()" value="수정하기"/>
	<input type="button" onclick="deleteMemo()" value="삭제하기"/>
	<div class="blog-post">
		<h2 class="blog-post-title" id="title_read">제목</h2>
		<!-- <div id="title_read">제목</div> -->
		<div id="content_read"><p>내용</p></div>
		<div id="responsable_read">책임자</div>
		<input type="button" value="댓글" onclick="getMemoComment()"/>
		<!-- <input type="button" onclick="addComment()" value="+댓글"/> -->
		<!-- <h2>AJAX File Upload</h2>-->
  <!--   <!--  파일을 업로드할 영역 -->
    <div class="fileDrop"></div>
  <!--   업로드된 파일 목록 -->
    <div class="uploadedList"></div> 
    
		</div>
		<div id="createComment">
		<input type="text" id="commentText" placeholder="댓글 작성"/>
		<input type="button" onclick="registerComment();" value="댓글 저장"/>
		</div>
		
		<div id="commentList"></div>
	</div>
	
	<div id="updateMemoDiv">
	<input type="button"  value="저장하기" onclick="updateMemo()"/>
		<input type="text" id="title_update"/>
		<input type="text" id="content_update"/>
		<input type="text" id="responsable_update"/>
	</div>
</div>
<!-- .container-fluid div  END-->	
	
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
<!-- Modal End -->

 <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <!-- <script src="resources/vendor/chart.js/Chart.min.js"></script> -->
    <script src="resources/vendor/datatables/jquery.dataTables.js"></script>
    <script src="resources/vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="resources/js/sb-admin-datatables.min.js"></script>
    <!-- <script src="resources/js/sb-admin-charts.min.js"></script> -->
	</div>
	<!-- content-wrapper end -->
	
</body>
</html>