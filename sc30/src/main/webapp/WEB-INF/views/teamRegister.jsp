<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!-- autocomplete from jQuery Ui -->
   
    <!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
    <!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 -->    
<html>
<head>
	<title>Home</title>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<h1></h1>

<!-- <form action="/team" method="post" id="fr"> -->
	<input type="text" name="teamName" placeholder="teamName" id="teamName"/>
	<input type="text" id="addMember" placeholder="memberADD"/>
	<input type="button" onclick="add()" value="add Member"/>
	<input type="button" onclick="send()" value="submit">
<!-- </form> -->

<script type = 'text/javascript'>
var teamMemberArray;
$(document).ready(function(){
	teamMemberArray = new Array();
});


	function add(){
		alert("addMember");
	/* 	var form = $('#fr');
		//var form = $("form");
		//var form = document.getElementById("fr");
		
		var memberID = $('#addMember').val();
		
		alert(memberID);
		
		var member = $("<input type='hidden' value="+memberID+" name='memberID' id='memberID'/>");
		form.append(member); */
		
		var teamMember = new Object();
		teamMember.memberID = $('#addMember').val();
		
		//팀 만든 사용자도 teamMember에 등록
		teamMemberArray.push(teamMember);
	}
	
	function send(){
		<%-- alert("send");
		var form = $('#fr');
		//var form = $("form");
		
		alert("teamName"+$("#teamName").val());
		alert("memberID"+$("#memberID").val())
	
		
		<% String test_s = (String)request.getSession().getAttribute("memberID"); %>
		var userID = '<%=test_s %>';

		alert("userID"+userID);
		
		var madeBy = $("<input type='hidden' value='"+userID+"'  name='madeBy'/>");
		var memberMadeBy =  $("<input type='hidden' value="+userID+" name='memberID' id='memberID'/>");
		var teamID = 
		//var madeBy = $("<input type='text' value='me' name='madeBy'/>");
		alert(userID);
		//alert(madeBy);
		form.append(madeBy);
		form.append(memberMadeBy);
		
		form.submit(); --%>
		
		
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
			success: function(){},
			error: function(){}
			
		})
	}
	
</script>
</body>
</html>


