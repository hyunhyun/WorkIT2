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
 <!--    <link href="resources/css/bootstrap.min.css" rel="stylesheet"> -->
  <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    	  <!-- Bootstrap core CSS-->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template -->
  <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template -->
  <link href="resources/css/sb-admin.css" rel="stylesheet">
    
    
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
    
    <style type="text/css">
    /* .jumbotron{
    height: 500px;
    } */
    
    
    .col-1, .col-2, .col-3, .col-4, .col-5, .col-6, .col-7, .col-8, .col-9, .col-10, .col-11, .col-12, .col, .col-auto, .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm, .col-sm-auto, .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12, .col-md, .col-md-auto, .col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg, .col-lg-auto, .col-xl-1, .col-xl-2, .col-xl-3, .col-xl-4, .col-xl-5, .col-xl-6, .col-xl-7, .col-xl-8, .col-xl-9, .col-xl-10, .col-xl-11, .col-xl-12, .col-xl, .col-xl-auto {
    position: relative;
   /*  width: 100%; */
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
}

.card.bg-primary {
    border-color: #187da0;
}
.bg-primary, .bg-success, .bg-info, .bg-warning, .bg-danger, .bg-dark {
    color: #fff;
}
.card {
    margin-bottom: 1.5rem;
}
.text-white {
    color: #fff!important;
}
.text-center {
    text-align: center!important;
}
.bg-primary {
    background-color: #20a8d8!important;
}
.card {
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
blockquote {
    margin: 0 0 1rem;
}
*, *::before, *::after {
    box-sizing: border-box;
}

blockquote {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 40px;
    -webkit-margin-end: 40px;
}

.fadeIn {
    -webkit-animation-name: fadeIn;
    animation-name: fadeIn;
}
.animated {
    -webkit-animation-duration: 1s;
    animation-duration: 1s;
}
    
p {
    margin-top: 0;
    margin-bottom: 1rem;
}
*, *::before, *::after {
    box-sizing: border-box;
}

p {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    font-size :20px;
}

body {
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color: #fff;
}

#ui-view{
	/* background-color: #CDCDCD; */
	margin : 20px;
}

.page-header{
	/* background-color : #343A40; */
	color: #FFFFFF;
	margin: 30px 30px 15px 30px;
}
    
    @media (min-width: 768px)
.col-md-4 {
    -ms-flex: 0 0 33.333333%;
    flex: 0 0 33.333333%;
    max-width: 33.333333%;
}
@media (min-width: 576px)
.col-sm-6 {
    -ms-flex: 0 0 50%;
    flex: 0 0 50%;
    max-width: 50%;
}

nav{
	background-color: #343A40;
}
/* .logout-link{
	float: right:
} */
.fa-fw {
    width: 1.28571429em;
    text-align: center;
}

.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
/* #createAddMember{
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  max-height: 200px;
  overflow: auto;
  z-index: 9999;
  border: 1px solid #eeeeee;
  border-radius: 4px;
  background-color: #fff;
  box-shadow: 0px 1px 6px 1px rgba(0, 0, 0, 0.4);

} */
 
 .container-body{
 	position: relative;
 }
 
.ui-autocomplete { z-index:2147483647; }

.ui-helper-hidden-accessible { 
    position: absolute
}
    
    
</style>
</head>
<body>
<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="mainNav">
<div class="page-header">
<h1>
	Board 
</h1>
<small>show my Team</small>
</div>
</nav> -->
<% String memberID = (String)(session.getAttribute("memberID")); %>
	<script>var memberID = "<%=memberID%>";</script>
	
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="mainNav">
<div class="page-header">
<h1>
	Board 
</h1>
<small>show my Team</small>
</div>
<ul class="navbar-nav ml-auto">
	<li class="nav-item">
		<span><%=(String)(session.getAttribute("memberID"))%> 님&nbsp&nbsp&nbsp&nbsp</span>
	</li>
	<li class="nav-item">
		<a class="logout-link" data-toggle="modal" data-target="#logoutModal">
		<i class="fa fa-fw fa-sign-out"></i>Logout</a>
	</li>
</ul>
</nav>
<!-- <div class="container"> -->
<div class="container-body">

<!-- <input type="text" id="createAddMember"/> -->
<!--     jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다)
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
      모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파W일을 포함하세요
    <script src="resources/js/bootstrap.min.js"></script>
    
    
     <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
    
<%-- <P>  ${listTeam}.  </P> --%>

<button class="btn btn-default" onclick="createTeamModalshow()">Create Team</button>
<!-- </form> -->

<div class="jumbotron">
<div id="ui-view">
<div>
<div class="animated fadeIn">
<%-- <c:if test = "${${listTeam} != null}">--%>
<c:if test="${listTeam != '' || listTeam ne null}"> 
<div class="row">
	<c:forEach var="team" items="${listTeam}">
    <!-- <div class="col-lg-3 col-md-4 col-xs-6"> -->
    <!-- <div class="col-sm-6 col-md-4"> -->
    <div class="col-sm-6 col-md-3">
    <div class="card text-white bg-primary text-center" >
   <%--  <h3 onclick="teamSelected(${team.teamID})">${team.teamName}</h3> --%>
   <div class="card-body">
<!--     <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">update</button>-->
    <!-- <blockquote class="card-bodyquote"> -->
    <p onclick="teamSelected(${team.teamID})">${team.teamName}</p>
    <button class="btn btn-default" onclick="show(${team.teamID}, '${team.teamName}')">update</button>
    <%-- <input type="button" class="btn btn-info btn-lg" onclick="show(${team.teamID}, '${team.teamName}')" value="update"/> --%>
    <button  class="btn btn-default" onclick="deleteTeam(${team.teamID})">delete</button>
    <!-- <p>description</p> -->
    
    <!-- </blockquote> -->
    </div>
    <!-- card-body END -->
    </div>
    <!-- card text-white END -->
    </div>
    <!-- col-sm-6 END -->
  	
   </c:forEach>
   </div>
   </c:if> 
 </div>
 <!--  animated fadeIn END -->
 </div>
<!-- ui-view 아래 divEND -->
   </div>
   <!-- ui-view END -->
   </div>
   <!--  jumbotron END -->
   
   </div>
	    <!-- /.container -->


<!-- updateTeamModal -->
<div id="updateTeamModal" class="modal fade" role="dialog" aria-hidden="true" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered" role="document">

    <!-- Modal content -->
    <div class="modal-content " id="updateTeamModal_content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Update TeamName</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
        <input type="text" id="updateTeamName"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="updateTeam()">Save</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div> 
</div>
<!-- updateTeamModal END -->


<!-- createTeamModal -->
<div id="createTeamModal" class="modal fade" role="dialog" aria-hidden="true" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered" role="document">

    <!-- Modal content -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Create Team</h4>
      </div>
      <div class="modal-body">
        <p>Enter teamName and add TeamMember</p>
        <!-- <div class="helper"></div> -->
        <p id="helperTest"></p>
        <!-- <p class="ui-helper-hidden-accessible"></p> -->
        <input type="text" id="createTeamName" placeholder="Enter TeamName"/>
        <!-- <input type="text" id="helperTest"/> -->
        <input type="text" id="createAddMember" placeholder="addMember"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="createAddMember()">AddMember</button>
        <button type="button" class="btn btn-default" onclick="createTeam()">SEND</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div> 
</div>
<!-- createTeamModal END -->

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
	    
	    
	    
	     <!-- Footer -->
   <!--  <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      /.container
    </footer> -->

    <!-- Bootstrap core JavaScript -->
   <!--  <script src="vendor/jquery/jquery.min.js"></script> -->
    <!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script> -->
<!--     <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
	<script>
	<% 	String contextPath  = request.getContextPath();	%>
	
	var contextPath = "<%=contextPath%>";

	
	var globalTeamID= null;
	
	var teamMemberArray;
	
	$(document).ready(function(){
		teamMemberArray = new Array();
	});
	
		function teamSelected(teamID){
			var form =$('<form></form>');
			var hidden = $("<input type='hidden' value='"+ teamID+"' name='teamID'/>");
			form.attr('action', 'main');
			form.attr('method', 'get');
			
			form.appendTo('body');
			form.append(hidden);
			form.submit();
		}
		
		function deleteTeam(teamID){
			var totalInfo = new Object();
			totalInfo.teamID = teamID;
			
			console.log(totalInfo);
			var jsonInfo = JSON.stringify(totalInfo);
			alert(JSON.stringify(totalInfo))
			
			$.ajax({
				type:"DELETE",
				//url:"http://localhost:8080/ProjectManager2/team",
				url: contextPath+"/team/"+teamID,
				//data: jsonInfo,
				//datatype: "JSON",
				contentType : "application/json; charset=UTF-8",
				success: function(data){
					alert("teamName deleted");
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
		
		function show(teamID, teamName){
			globalTeamID = teamID;

			$("#updateTeamModal").modal('show');
			$("#updateTeamName").attr("placeholder", teamName);
	}
	
		function createTeamModalshow(){
			$("#createTeamModal").modal('show');
		}
		
		
		function updateTeam(){
			var teamName = "";
			teamName = $("#updateTeamName").val();
			var totalInfo = new Object();
			totalInfo.teamID = globalTeamID;
			totalInfo.teamName = teamName; 
			
			console.log(totalInfo);
			alert("teamID: "+ globalTeamID);
			alert(JSON.stringify(totalInfo))
			
			$.ajax({
				type:"PUT",
				url: contextPath+"/team",
				data: totalInfo,
				//datatype: "JSON",			//default
				//contentType : "application/json; charset=UTF-8",		//default
				success: function(data){
					alert("teamName updated");
				},
				error :function(jqXHR,request, error){
					jqXHR.status
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					
					alert("수정 error : "+error);
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
		
		
		function createAddMember(){
			//alert("createAddMember");
			
			var teamMember = new Object();
			teamMember.memberID = $('#createAddMember').val();
			
			//팀 만든 사용자도 teamMember에 등록
			teamMemberArray.push(teamMember);
		}
		
		function createTeam(){
			
			<% String memberID_session = (String)request.getSession().getAttribute("memberID"); %>
			var userID = '<%=memberID_session %>';
			
			var totalInfo = new Object();
			
			var teamMember = new Object();
			teamMember.memberID = userID;
			
			//teamMemberArray.push(userID);
			
			//팀 만든 사용자도 teamMember에 등록
			teamMemberArray.push(teamMember);
			
			
			totalInfo.teamMembers = teamMemberArray;
			totalInfo.madeBy = userID;
			totalInfo.teamName = $("#createTeamName").val();
			
			var jsonInfo =JSON.stringify(totalInfo);
			
			console.log(jsonInfo);
			alert(jsonInfo);
			$.ajax({
				url:contextPath+"/team",
				method: "POST",
				datatype: "JSON",
				data: jsonInfo, 
				contentType : "application/json; charset=UTF-8",
				success: function(result){
					//alert("success");
					alert("Team Created");
					$("#createTeamModal").modal('hide');
					window.location.reload();
				},
				error: function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					
					alert(jqXHR.responseText);
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
		
		$("#createAddMember").autocomplete({
			
			source: function(request, response){
				$.ajax({
					url: contextPath+"/member",
					method: "GET",
					data: {search: $("#createAddMember").val()},
					success: function(data){
						console.log(data);
						//var helper = $(".ui-helper-hidden-accessible > div").last().text();
						////var helper = $(".ui-helper-hidden-accessible > div:last-child").text();
						//$("#helperTest").empty();
						//$("#helperTest").text(helper);
						//$("#helperTest").text(data);
						
						$(".ui-helper-hidden-accessible").hide();
						response($.map(data, function(item){
							return {label: item.memberID, value: item.memberID};
						}));
					},
					error : function(jqXHR,request, error){
						console.log(jqXHR);
						console.log(status);
						console.log(error);
						
						//$("#helperTest").text("");
					}
				})	
			},
			/* onSearchComplete: function(query, suggestions){
				var helper = $(".ui-helper-hidden-accessible > div").last().text();
				//var helper = $(".ui-helper-hidden-accessible > div:last-child").text();
				$("#helperTest").empty();
				$("#helperTest").text(helper);
			} */
		/* ,
				options: {
					messages: {
						noResults: "No search results.",
						results: function( amount ) {
							return amount + ( amount > 1 ? " results are" : " result is" ) +
								" available, use up and down arrow keys to navigate.";
						}
					}
				},

				response: function( content ) {					
					var he = $(".ui-helper-hidden-accessible div").last().text();
					$("#helperTest").text(he);
				} */
		})
		
	</script>
	

</body>
</html>