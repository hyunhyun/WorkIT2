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

<form action="registerTeam" method="post" id="fr">
	<input type="text" name="teamName" placeholder="teamName"/>
	<input type="text" id="addMember" placeholder="memberADD"/>
	<input type="button" onclick="add()" value="add Member"/>
	<input type="button" onclick="send()" value="submit">
</form>

<script type = 'text/javascript'>
	function add(){
		alert("addMember");
		var form = $('#fr');
		//var form = $("form");
		//var form = document.getElementById("fr");
		
		var memberID = $('#addMember').val();
		
		alert(memberID);
		
		var member = $("<input type='hidden' value="+memberID+" name='memberID'/>");
		form.append(member);
		
	}
	
	function send(){
		//alert("send");
		var form = $('#fr');
		//var form = $("form");
		//var form = document.getElementById("fr");
		
		//alert(form);
		<% String test_s = (String)request.getSession().getAttribute("memberID"); %>
		var userID = '<%=test_s %>';

		var madeBy = $("<input type='hidden' value='"+userID+"'  name='madeBy'/>");

		//var madeBy = $("<input type='text' value='me' name='madeBy'/>");
		alert(userID);
		//alert(madeBy);
		form.append(madeBy);
		
		form.submit();
	}
	
</script>
</body>
</html>


