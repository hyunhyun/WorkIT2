



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- /옆에 토픽도 뜨고
//버튼도 고침
//autocomplete 에러 -->
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
	
	  <!-- Bootstrap core CSS-->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css" rel="stylesheet">

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/fontawesome.css" integrity="sha384-GVa9GOgVQgOk+TNYXu7S/InPTfSDTtBalSgkgqQ7sCik56N9ztlkoTr2f/T44oKV" crossorigin="anonymous">
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
<script>
		var teamID = -1;
		teamID =  ${teamID};
		var memberID = '<%= session.getAttribute("memberID") %>';
		
		<% 	String contextPath  = request.getContextPath();	%>

	var contextPath = "<%=contextPath%>";
	
	//var test = ${topicList[0].topicID};
	</script>
	
	
	<style>
/* 첨부파일을 드래그할 영역의 스타일 */
.fileDrop {
    width: 600px;
    height: 70px;
    border: 2px dotted gray;
    background-color: gray;
}


 

 #navbarResponsive{
	overflow-y:scroll;
}  

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
     margin-top: 0;
    margin-bottom: 1rem;
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

input:focus{
	outline: none;
}

.mt-4, .my-4 {
    margin-top: 1.5rem!important;
}

.lead {
    font-size: 1.25rem;
    font-weight: 300;
}

hr {
    margin-top: 1rem;
    margin-bottom: 1rem;
    border: 0;
    border-top: 1px solid rgba(0,0,0,.1);
}
hr {
    box-sizing: content-box;
    height: 0;
    overflow: visible;
} 

 a {
    color: #82b440;
    text-decoration: none;
}
.blog-comment::before,
.blog-comment::after,
.blog-comment-form::before,
.blog-comment-form::after{
    content: "";
	display: table;
	clear: both;
}

.blog-comment{
    padding-left: 15%;
	padding-right: 15%;
}

.blog-comment ul{
	list-style-type: none;
	padding: 0;
}

.blog-comment img{
	opacity: 1;
	filter: Alpha(opacity=100);
	-webkit-border-radius: 4px;
	   -moz-border-radius: 4px;
	  	 -o-border-radius: 4px;
			border-radius: 4px;
}

.blog-comment img.avatar {
	position: relative;
	float: left;
	margin-left: 0;
	margin-top: 0;
	width: 65px;
	height: 65px;
}

.blog-comment .post-comments{
	border: 1px solid #eee;
    margin-bottom: 20px;
    margin-left: 85px;
	margin-right: 0px;
    padding: 10px 20px;
    position: relative;
    -webkit-border-radius: 4px;
       -moz-border-radius: 4px;
       	 -o-border-radius: 4px;
    		border-radius: 4px;
	background: #fff;
	color: #6b6e80;
	position: relative;
}

.blog-comment .meta {
	font-size: 13px;
	color: #aaaaaa;
	padding-bottom: 8px;
	margin-bottom: 10px !important;
	border-bottom: 1px solid #eee;
}

.blog-comment ul.comments ul{
	list-style-type: none;
	padding: 0;
	margin-left: 85px;
}

.blog-comment-form{
	padding-left: 15%;
	padding-right: 15%;
	padding-top: 40px;
}

.blog-comment h3,
.blog-comment-form h3{
	margin-bottom: 40px;
	font-size: 26px;
	line-height: 30px;
	font-weight: 800;
}

</style>
	
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">

 <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
  <!-- TODO teamID 변수 넘기는거 -->
    <a class="navbar-brand" href="main?teamID=${teamID}">Main</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="#">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Dashboard</span>
          </a>
        </li>
        

        
<c:if test="${topicList != '' || topicList ne null}">
<!-- <div class="col-sm-3 col-md-2 sidebar">x -->
<!-- <ul class="nav nav-pills nav-stacked"> -->
<c:forEach var="topic" items="${topicList}" varStatus="status">
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
   <%-- <c:if test="${status.index eq 1}">
   </c:if> --%>
   <!--c:choose, c:when, c:otherwise  -->

<!-- <script>console.log(${topic.topicID}+" : "+'${topic.topicName}');</script> -->
   <!-- 효과 주려면 class= "active" -->
<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapse_${topic.topicID}"  data-parent="#exampleAccordion" id="nav-link-collapse_${topic.topicID}">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text" onclick="topicSelected(${topic.topicID})">${topic.topicName}</span>
            <span class="badge">14</span>
            
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
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-bell"></i>
            <span class="d-lg-none">Alerts
              <span class="badge badge-pill badge-warning">6 New</span>
            </span>
            <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          
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
      <!-- Breadcrumb End -->
      <h1>MainPage</h1>
<hr>
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
<!-- <button type="button" class="btn btn-default" id="createMemoBtn" onclick="createMemo()">
<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
</button> -->

<!-- <button type="button" class="btn btn-default" id="createMemoBtn" onclick="createMemo()"> -->
<button class="far fa-plus-square btn btn-default" id="createMemoBtn" onclick="createMemo()">메모 추가하기</button>
<!-- </button> -->

<i class="fas fa-arrow-alt-circle-left"></i> 

<div id="memoContainer">


<div id="insideMemoContainer"><!-- <span>memoContainer</span> -->
<div class="row" id="cardContainer"></div>
</div>

</div>
<!-- memoContainer End -->

<div id="createMemoDiv">
	<!-- <input type= "text" name="title" placeholder="title" id="title_create"/><br><br>
	<textarea rows="20" cols="50" name="content" placeholder="content" id="content_create"></textarea>
	<br>
	<input type="text" name="responsable" placeholder="responsable" id="responsable_create"/>
	<input type= "file" />
	 -->
	<section class="section">

    <!--Section heading-->
    <h2 class="section-heading h1 pt-4">Create a Memo!</h2>
    <!--Section description-->
    <p class="section-description">Create a Memo.</p>

    <div class="row">

        <!--Grid column-->
        <div class="col-md-8 col-xl-9">
            <!-- <form id="contact-form" name="contact-form" action="mail.php" method="POST"> -->

                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form">
                        <label for="title" class="">title</label>
                            <input type="text" id="title_create" name="title" class="form-control">
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form">
                        	<label for="responsable" class="">responsable</label>
                            <input type="text" id="responsable_create" name="responsable" class="form-control">
                        </div>
                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-12">

                        <div class="md-form">
                        	<label for="content">Content</label>
                            <textarea type="text" id="content_create" name="content" rows="6" class="form-control md-textarea"></textarea>                           
                        </div>

                    </div>
                </div>
                <!--Grid row-->

            </form>

            <div class="center-on-small-only">
                <a class="btn btn-primary" onclick="submitMemo()">Send</a>
            </div>
            <div class="status"></div>
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-md-4 col-xl-3">
            <ul class="contact-icons">
                <li><i class="fa fa-map-marker fa-2x"></i>
                    <p>San Francisco, CA 94126, USA</p>
                </li>

                <li><i class="fa fa-phone fa-2x"></i>
                    <p>+ 01 234 567 89</p>
                </li>

                <li><i class="fa fa-envelope fa-2x"></i>
                    <p>contact@mdbootstrap.com</p>
                </li>
            </ul>
        </div>
        <!--Grid column-->

    </div>

</section>
<!--Section: Contact v.2-->
	<div>
   <!--  첨부파일 등록영역 -->
    <div class="fileDrop">여기에 파일을 드롭해주세요</div>
    <!-- 첨부파일의 목록 출력영역 -->
    <div id="uploadedList"></div>
</div> 

<!-- 일반적 방식 파일업로드 -->
<!--  <form target="iframePhoto" action="upload/uploadForm" method="post" id="formFile" enctype="multipart/form-data">
        <input type="file" name="file"/>
        <input type="submit" value="업로드"/>    
    </form>
    <iframe name="iframePhoto"></iframe> -->

	<!-- <input type="button" 
	value="완료" onclick="submitMemo()"> -->
</div>
<!-- createMemoDiv End -->

<div id="noMemoDiv">
		<div>제목</div>
		<div>내용</div>
		<div>책임자</div>
	</div>

<div id="readMemoDiv">
	<input type="button" onclick="updateBtn()" value="수정하기"/>
	<input type="button" onclick="deleteMemo()" value="삭제하기"/>
	<div class="blog-post">
		<h2 class="blog-post-title mt-4" id="title_read">제목</h2>
		<p class="lead">author</p>
		<hr>
		<p id="date_read">Date</p>
		<hr>
		<div id="content_read"><p class="lead">내용</p></div>
		<div id="responsable_read">책임자</div>
		<input type="button" value="댓글" onclick="getMemoComment()"/>
		<!-- <input type="button" onclick="addComment()" value="+댓글"/> -->
		
    
		 
	<!-- 	<div id="createComment">
		<input type="text" id="commentText" placeholder="댓글 작성"/>
		<input type="button" onclick="registerComment();" value="댓글 저장"/>
		</div> -->
		
		<div class="card my-4" id="createComment">
            <h5 class="card-header">Leave a Comment:</h5>
            <div class="card-body">
                <div class="form-group">
                  <textarea class="form-control" rows="3" id="commentText"></textarea>
                </div>
                <button  class="btn btn-primary" onclick="registerComment()">Submit</button>
            </div>
            <!-- card-body End -->
          </div>
          <!-- createComment End -->
	
		<div id="commentList"></div>
	</div>
	<!-- blog post -->
	</div>
	<!--  readMemoDiv End -->

<div id="updateMemoDiv">
	<section class="section">

    <!--Section heading-->
    <h2 class="section-heading h1 pt-4">Update your Memo!</h2>
    <!--Section description-->
    <p class="section-description">Update your Memo.</p>

    <div class="row">

        <!--Grid column-->
        <div class="col-md-8 col-xl-9">
              <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form">
                        <label for="title" class="">title</label>
                            <input type="text" id="title_update" name="title" class="form-control">
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form">
                        	<label for="responsable" class="">responsable</label>
                            <input type="text" id="responsable_update" name="responsable" class="form-control">
                        </div>
                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-12">

                        <div class="md-form">
                        	<label for="content">Content</label>
                            <textarea type="text" id="content_update" name="content" rows="6" class="form-control md-textarea"></textarea>                           
                        </div>

                    </div>
                </div>
                <!--Grid row-->

            </form>

            <div class="center-on-small-only">
                <a class="btn btn-primary" onclick="updateMemo()">저장</a>
            </div>
            <div class="status"></div>
        </div>
        <!--Grid column-->

    </div>
    <!-- row End -->

</section>
<!--Section: Contact v.2-->
	<!-- <input type="button"  value="저장하기" onclick="updateMemo()"/>
		<input type="text" id="title_update"/>
		<input type="text" id="content_update"/>
		<input type="text" id="responsable_update"/> -->
	</div>
	<!--  updateMemoDiv End -->

	</div>
	<!-- container-fluid End -->
</div>
<!-- .container-wrapper  END-->	
	
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
    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin.min.js"></script>
    
    
    <!-- 추가 내용 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>    
    
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script src="resources/js/jquery.autocomplete.js"></script> 
	<script src="resources/js/main.js"></script>
    
    
    
	</div>
	<!-- content-wrapper end -->
	
</body>
</html>