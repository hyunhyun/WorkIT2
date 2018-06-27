



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
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/fontawesome.css" integrity="sha384-GVa9GOgVQgOk+TNYXu7S/InPTfSDTtBalSgkgqQ7sCik56N9ztlkoTr2f/T44oKV" crossorigin="anonymous">
  
  <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css" rel="stylesheet">

 
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
<script>
		var teamID = -1;
		teamID =  ${teamID};
		var memberID = "";
		memberID = '<%= session.getAttribute("memberID") %>';
		
		<% 	String contextPath  = request.getContextPath();	%>

	var contextPath = "<%=contextPath%>";
	
	if(memberID == "" || memberID == "null"){
		window.location.replace(contextPath+"/auth/login");
	}
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


*{
     margin: 0;
 	padding: 0;
 	-webkit-box-sizing: border-box;
 	-moz-box-sizing: border-box;
 	box-sizing: border-box;
 }

 a {
 	color: #03658c;
 	text-decoration: none;
 }

ul {
	list-style-type: none;
}

body {
	font-family: 'Roboto', Arial, Helvetica, Sans-serif, Verdana;
	background: #dee1e3;
}

/** ====================
 * Lista de Comentarios
 =======================*/
/* .comments-container {
	margin: 60px auto 15px;
	width: 768px;
	
	float: left;
}
 */
.comments-container h1 {
	font-size: 36px;
	color: #283035;
	font-weight: 400;
}

.comments-container h1 a {
	font-size: 18px;
	font-weight: 700;
}

.comments-list {
	margin-top: 30px;
	position: relative;
}

/**
 * Lineas / Detalles
 -----------------------*/
.comments-list:before {
	content: '';
	width: 2px;
	height: 100%;
	background: #c7cacb;
	position: absolute;
	left: 32px;
	top: 0;
}

.comments-list:after {
	content: '';
	position: absolute;
	background: #c7cacb;
	bottom: 0;
	left: 27px;
	width: 7px;
	height: 7px;
	border: 3px solid #dee1e3;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
}

.reply-list:before, .reply-list:after {display: none;}
.reply-list li:before {
	content: '';
	width: 60px;
	height: 2px;
	background: #c7cacb;
	position: absolute;
	top: 25px;
	left: -55px;
}


.comments-list li {
	margin-bottom: 15px;
	display: block;
	position: relative;
}

.comments-list li:after {
	content: '';
	display: block;
	clear: both;
	height: 0;
	width: 0;
}

.reply-list {
	padding-left: 88px;
	clear: both;
	margin-top: 15px;
}
/**
 * Avatar
 ---------------------------*/
.comments-list .comment-avatar {
	width: 65px;
	height: 65px;
	position: relative;
	z-index: 99;
	float: left;
	border: 3px solid #FFF;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	-webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.2);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,0.2);
	box-shadow: 0 1px 2px rgba(0,0,0,0.2);
	overflow: hidden;
}

.comments-list .comment-avatar img {
	width: 100%;
	height: 100%;
}

.reply-list .comment-avatar {
	width: 50px;
	height: 50px;
}

.comment-main-level:after {
	content: '';
	width: 0;
	height: 0;
	display: block;
	clear: both;
}
/**
 * Caja del Comentario
 ---------------------------*/
.comments-list .comment-box {
	width: 680px;
	/* float: right; */
	float: left!important;
	position: relative;
	-webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.15);
	-moz-box-shadow: 0 1px 1px rgba(0,0,0,0.15);
	box-shadow: 0 1px 1px rgba(0,0,0,0.15);
}

.comments-list .comment-box:before, .comments-list .comment-box:after {
	content: '';
	height: 0;
	width: 0;
	position: absolute;
	display: block;
	border-width: 10px 12px 10px 0;
	border-style: solid;
	border-color: transparent #FCFCFC;
	top: 8px;
	left: -11px;
}

.comments-list .comment-box:before {
	border-width: 11px 13px 11px 0;
	border-color: transparent rgba(0,0,0,0.05);
	left: -12px;
}

.reply-list .comment-box {
	width: 610px;
}
.comment-box .comment-head {
	background: #FCFCFC;
	padding: 10px 12px;
	border-bottom: 1px solid #E5E5E5;
	overflow: hidden;
	-webkit-border-radius: 4px 4px 0 0;
	-moz-border-radius: 4px 4px 0 0;
	border-radius: 4px 4px 0 0;
}

.comment-box .comment-head i {
	float: right;
	margin-left: 14px;
	position: relative;
	top: 2px;
	color: #A6A6A6;
	cursor: pointer;
	-webkit-transition: color 0.3s ease;
	-o-transition: color 0.3s ease;
	transition: color 0.3s ease;
}

.comment-box .comment-head i:hover {
	color: #03658c;
}

.comment-box .comment-name {
	color: #283035;
	font-size: 14px;
	font-weight: 700;
	float: left;
	margin-right: 10px;
}

.comment-box .comment-name a {
	color: #283035;
}

.comment-box .comment-head span {
	float: left;
	color: #999;
	font-size: 13px;
	position: relative;
	top: 1px;
}

.comment-box .comment-content {
	background: #FFF;
	padding: 12px;
	font-size: 15px;
	color: #595959;
	-webkit-border-radius: 0 0 4px 4px;
	-moz-border-radius: 0 0 4px 4px;
	border-radius: 0 0 4px 4px;
}

.comment-box .comment-name.by-author, .comment-box .comment-name.by-author a {color: #03658c;}
.comment-box .comment-name.by-author:after {
	content: 'writer';
	background: #03658c;
	color: #FFF;
	font-size: 12px;
	padding: 3px 5px;
	font-weight: 700;
	margin-left: 10px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

/* .commentUpdateDiv{
	display: none;
} */

.comments-list #commentUpdateDiv{
	display: hide;
}
.content-wrapper{
vertical-align:middle; 
}

.container-fluid{
width: 80%;
display: inline-block;
margin: 30px 30px 30px 30px; 

verical-align:middle;
}

.blog-post{
	width : 80%;
}


/* #readMemoDivBody{
	height : 500px;
} */

#exampleAccordion{
	/* background-color: #FFFFFF!important; */
	overflow-y:scroll;
}

.leftMenu{
	/* background-color:#D0D7DD; */ /* 연한회색 */
	/* background-color:#2DAAE2; */ /* 하늘색 */
	/* background-color: #A3AFC9; */
	margin:5px;
}

#MyWorkListNav{
	vertical-align: bottom;
	margin-top:120px;
	/* background-color:#8CC24A; */
	color: #FFFFFF;
}

.sidenav-second-level{
	/* background-color: #FFFFFF!important; */
}

#createMemoBtn{
	display: none;
}

.card-read, .card-update {
    margin-bottom: 1.5rem;
}
.card-read, .card-update{
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid #c8ced3;
    border-radius: .25rem;
}

.card-header-read:first-child, .card-header-update:first-child {
    border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0;
}

.card-header-read, .card-header-update {
    padding: .75rem 1.25rem;
    margin-bottom: 0;
    background-color: #f0f3f5;
    border-bottom: 1px solid #c8ced3;
}

.card-body-read, .card-body-update{
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem;
}

#deleteFileBtn_create{
	display: none;
}

.ui-autocomplete { 
	z-index:2147483647; 
	background-color: #f0f3f5;
	}


/** =====================
 * Responsive
 ========================*/
@media only screen and (max-width: 766px) {
	.comments-container {
		width: 480px;
	}

	.comments-list .comment-box {
		width: 390px;
	}

	.reply-list .comment-box {
		width: 320px;
	}
}

.modal{
	background-color: #ffffff;
}

.section-heading{
	margin-left : 30px;
}
.section-description{
	margin-left : 30px;
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
        
        <li class="nav-item leftMenu" data-toggle="tooltip" data-placement="right" title="Dashboard" onclick="showCreateModal()">
          <a class="nav-link" href="#">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Create Topic</span>
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
              <a  onclick="showUpdateModal(${topic.topicID}, '${topic.topicName}')">수정</a>
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
<li class="nav-item leftMenu" data-toggle="tooltip" data-placement="right" title="Components">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapse_${topic.topicID}"  data-parent="#exampleAccordion" id="nav-link-collapse_${topic.topicID}">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text" onclick="topicSelected(${topic.topicID})">${topic.topicName}</span>
            <!-- <span class="badge">14</span> -->
            
          </a>
          <ul class="sidenav-second-level collapse" id="collapse_${topic.topicID}">
            <li>
              <a onclick="showUpdateModal(${topic.topicID}, '${topic.topicName}')">수정</a>
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
   
   
   <li class="nav-item leftMenu" data-toggle="tooltip" data-placement="right" title="MyWorkList" id="MyWorkListNav" onclick="getMyWorkList()">
          <a class="nav-link" href="#">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">MyWorkList</span>
          </a>
        </li>
       
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
       <li onclick="deleteMember()">
       <i class="fas fa-times-circle">회원탈퇴</i>
       </li>
       
        <li class="nav-item dropdown"><!-- TODO 여기에 팀멤버 보이기 및 팀멤버 추가 -->
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <!-- <i class="fa fa-fw fa-bell"></i> -->
            <i class="fas fa-users"></i>
            <span class="d-lg-none">TeamMember
              <!-- <span class="badge badge-pill badge-warning">6 New</span> -->
              <span class="badge badge-pill badge-warning"></span>
            </span>
            <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          
          <div class="dropdown-menu" aria-labelledby="alertsDropdown" id="teamMemberDropDown">
            <h6 class="dropdown-header">TeamMember :
            <div class="input-group">
            <input class="form-control" type="text" placeholder="Add TeamMember" id="teamMemberAdd">
         		<button class="btn btn-primary" type="button" onclick="teamMemberAdd()">
           	<i class="fa fa-search"></i>
         </button>
         </div>            
            </h6>
       
          
       <!--   <div class="form-inline my-2 my-lg-0 mr-lg-2">
     <div class="input-group">
       <input class="form-control" type="text" placeholder="Search by Content" id="searchContent">
       <span class="input-group-append">
         <button class="btn btn-primary" type="button" onclick="searchContent()">
           <i class="fa fa-search"></i>
         </button>
       </span>
     </div>
  </div -->
            
            <c:if test="${memberList != '' || memberList ne null}">
            <c:forEach var="member" items="${memberList}" varStatus="status">
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fas fa-user-alt"></i>
                  &nbsp ${member.memberID}
                </strong>
              </span>
              <!-- <span class="small float-right text-muted">11:21 AM</span> -->
              <div class="dropdown-message small">${member.nickname}</div>
            </a>
            </c:forEach>
    		</c:if>
           <!--  <div class="dropdown-divider"></div>	 -->
    		
            <!-- <a class="dropdown-item small" href="#">View all alerts</a> -->
          </div>         
        </li>
       <!--  <li class="nav-item">
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
        </li> -->
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#logoutModal">
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
<!-- <input type="button" onclick="getMyWorkList()" value="myWorkList"/> -->

<%
	/* if(session.getAttribute("memberID") = null){
		response.sendRedirect("login");
	} */
	out.println(session.getAttribute("memberID"));
	
%>
<!-- createTopic<input type="text" name="topicName" placeholder="topicName" id="tName"/>
<input type="button" value="ok" onclick="createTopic()"/> -->

<div id="searchContainer">
<!-- <input type="text" id="searchContent" placeholder="검색내용"/>
<input type="button" onclick="searchContent()" value="검색"/> -->


   <div class="form-inline my-2 my-lg-0 mr-lg-2">
     <div class="input-group">
       <input class="form-control" type="text" placeholder="Search by Content" id="searchContent">
       <span class="input-group-append">
         <button class="btn btn-primary" type="button" onclick="searchContent()">
           <i class="fa fa-search"></i>
         </button>
       </span>
     </div>
  </div>
     
</div>
<!-- <input type="button" id="createMemoBtn" value="create Memo" onclick="createMemo()"/> -->
<!-- <button type="button" class="btn btn-default" id="createMemoBtn" onclick="createMemo()">
<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
</button> -->

<i class="far fa-plus-square" id="createMemoBtn" onclick="createMemo()">메모 추가하기</i>


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
 <!--        <div class="col-md-4 col-xl-3">
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
        </div> -->
        <!--Grid column-->

    </div>

</section>
<!--Section: Contact v.2-->
	<div>
   <!--  첨부파일 등록영역 -->
    <div class="fileDrop">여기에 파일을 드롭해주세요</div>
    <!-- 첨부파일의 목록 출력영역 -->
    <button class="btn btn-default" id="deleteFileBtn_create" onclick="deleteFileArray()">파일첨부 해제</button>
    <div id="uploadedList_create"></div>
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

<div id="readMemoDiv" class="card-read">

<div class="card-header-read">Selected Memo</div>
<div class="card-body-read">
	<input type="button" onclick="updateBtn()" value="수정하기"/>
	<input type="button" onclick="deleteMemo()" value="삭제하기"/>
	<div class="blog-post">
	<div id="readMemoDivBody">
		<h2 class="blog-post-title mt-4" id="title_read">제목</h2>
		<p class="lead" id="writer_read">author</p>
		<hr>
		<p id="date_read">Date</p>
		<hr>
		<div id="content_read"><p class="lead">내용</p></div>
		<div id="responsable_read">책임자</div>
		<!-- <input type="button" value="댓글" onclick="getMemoComment()"/> -->
		
		<div id="uploadedList_read"></div>
		
		<i class="fa fa-comments" onclick="getMemoComment()"><span>댓글보기</span></i>
		<!-- <input type="button" onclick="addComment()" value="+댓글"/> -->
	</div>
	<!-- readMemoDivBody End -->	 
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
	
		<!-- <div id="comments-container"></div> -->
		<div class="comments-container"></div>
	</div>
	<!-- blog post -->
	</div>
	<!-- card-body-read End -->
	</div>
	<!--  readMemoDiv End -->

<div id="updateMemoDiv" class="card-update">
	<section class="section">

	<div class="card-header-update">Update Memo</div>
    <!--Section heading-->
    <h2 class="section-heading h1 pt-4">Update your Memo!</h2>
    <!--Section description-->
    <p class="section-description">Update your Memo.</p>

	<div class="card-body-update">
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
    </div>
    <!-- card-body-update -->

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
	
	<!-- TopicUpdateModal -->
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
<!-- TopicUpdateModal End -->

	<!-- TopicCreateModal -->
<div id="createTopicModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Create New Topic</h4>
      </div>
      <div class="modal-body">
        <!-- <p>Some text in the modal.</p> -->
        <input type="text" id="createTopicName"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="createTopic()">Save</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!-- TopicCreateModal End -->



<!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="ModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="auth/logout">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Logout Modal End -->

    
    <!-- </div> -->
	<!-- content-wrapper end -->
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
    
    
    
	
	
</body>
</html>