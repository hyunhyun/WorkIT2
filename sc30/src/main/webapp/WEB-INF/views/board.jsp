<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
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
    
    <style type="text/css">
    .jumbotron{
    height: 500px;
    }
    </style>
</head>
<body>
<div class="container">
<div class="page-header">
<h1>
	Board 
</h1>
<small>show my Team</small>
</div>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
      <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파W일을 포함하세요 -->
    <script src="resources/js/bootstrap.min.js"></script>
    
<%-- <P>  ${listTeam}.  </P> --%>


<%
	/* if(session.getAttribute("memberID") = null){
		response.sendRedirect("login");
	} */
	out.println(session.getAttribute("memberID"));
	
%>
<form action="auth/logout">
<button type="submit" class="btn btn-default">LOGOUT</button>

 <a href="team/page">create team</a>
<div class="dropdown">
	<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
	create team
	  </button>
<div class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
   <!--  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li> -->
<input type="text" name="teamName" placeholder="teamName" id="teamName"/>
	<input type="text" id="addMember" placeholder="memberADD"/>
	<input type="button" onclick="add()" value="add Member"/>
	<input type="button" onclick="send()" value="submit">
 </div> 
</div>
</form>

<div class="jumbotron">
<%-- <c:if test = "${${listTeam} != null}">--%>
<c:if test="${listTeam != '' || listTeam ne null}"> 
	<c:forEach var="team" items="${listTeam}">
    <div class="col-lg-3 col-md-4 col-xs-6">
    <h3 onclick="teamSelected(${team.teamID})">${team.teamName}</h3>
<!--     <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">update</button>-->
    <input type="button" class="btn btn-info btn-lg" onclick="show(${team.teamID}, '${team.teamName}')" value="update"/>
    <button onclick="deleteTeam(${team.teamID})">delete</button>
    <!-- <p>description</p> -->
    </div>
  	
   </c:forEach>
   </c:if> 
 
   </div>
   
<!-- Modal -->
<div id="updateTeamModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" id="updateTeamModal">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Update TeamName</h4>
      </div>
      <div class="modal-body">
        <!-- <p>Some text in the modal.</p> -->
        <input type="text" id="updateTeamName"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="updateTeam()">Save</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


	
	</div>
	    <!-- /.container -->
	    
	     <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
   <!--  <script src="vendor/jquery/jquery.min.js"></script> -->
    <!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script> -->
<!--     <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
	<script>
	var globalTeamID= null;
		function teamSelected(teamID){
			//var data = {"teamID": teamID};
		//	$.ajax({
		//		type: "GET",
	//			url: "http://localhost:8080/ProjectManger2/main"
				
				//data: data
			//});
			
			//alert(teamID);
			
			//쿠키 설정, visits 쿠키값에 10을 설정
			//$.cookie("visits", 10);
			//도메인 fun25.co.kr 의 전체 패스에 값을 설정
			//$.cookie("visits", 10, {path: "/", domain: "fun25.co.kr"});
			//http://xecenter.com/xe/open_tip/4684
			$.cookie("teamID", teamID, {path:'/'});
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
				//url:"http://localhost:8080/ProjectManger2/team",
				url:"http://localhost:8080/ProjectManger2/team/"+teamID,
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
			//alert("show");
			globalTeamID = teamID
			//$(".modal-content").modal('show');
			$("#updateTeamModal").modal('show');
			$("#updateTeamName").attr("placeholder", teamName);
	}
		function updateTeam(){
			var teamName = $("#updateTeamName").val();
			var totalInfo = new Object();
			totalInfo.teamID = globalTeamID;
			totalInfo.teamName = teamName; 
			//var totalInfo= {"teamID": 8, "teamName" : "thissis"};
			console.log(totalInfo);
			alert("teamID: "+ globalTeamID);
			alert(JSON.stringify(totalInfo))
			
			$.ajax({
				type:"PUT",
				url:"http://localhost:8080/ProjectManger2/team",
				data: totalInfo,
				//datatype: "JSON",			//default
				//contentType : "application/json; charset=UTF-8",		//default
				success: function(data){
					alert("teamName updated");
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