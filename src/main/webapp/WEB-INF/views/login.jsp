<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"  rel="stylesheet">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
<style>body{
    padding-top: 100px;
}
form{
	padding: 20px;
	    box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 15px 0 rgba(0,0,0,0.12) !important;
}
h4{
    text-align: center;
}
.btn{
	border-radius: 0px;
}
.form-control{
	border-radius: 0px;
	margin-bottom: 10px;
}
p{
	margin-bottom: 10px;
	margin-top: 10px;
	text-align: center;
}
.blue{
	color: #337ab7;
}
.fa{
	color: #337ab7;
}
.fa-facebook-f{
	padding: 10px 12px 10px 12px;
	border: 1px solid #337ab7;
	border-radius: 50%;
}
.fa-google-plus{
	padding: 10px 8px 10px 8px;
	border: 1px solid #337ab7;
	border-radius: 50%;
}
.fa-twitter{
	padding: 10px 8px 10px 8px;
	border: 1px solid #337ab7;
	border-radius: 50%;
}
i{
	margin-left: 5px;
	margin-right: 5px;
}




.flip {
  -webkit-perspective: 800;
perspective: 800;

    position: relative;
}
.flip .card.flipped {
  -webkit-transform: rotatey(-180deg);
    transform: rotatey(-180deg);
}
.flip .card {

  height: 100%;
  -webkit-transform-style: preserve-3d;
  -webkit-transition: 0.5s;
    transform-style: preserve-3d;
    transition: 0.5s;
}
.flip .card .face {

  -webkit-backface-visibility: hidden ;
    backface-visibility: hidden ;
  z-index: 2;
   
}
.flip .card .front {
  position: absolute;
   width: 100%;
  z-index: 1;

}
.flip .card .back {
  -webkit-transform: rotatey(-180deg);
    transform: rotatey(-180deg);
}
  .inner{margin:0px !important;}
  

body{
	background-color: #343a40;
}

  </style>
	<!-- <title>Home</title> -->
</head>
<body>



<P>  ${logintest}. </P>
<%-- <c:if test="${checkID}">
</c:if>
 --%>

 <div class="container">

      <div class="row">

        <div class="col-md-4"></div>
        <div class="col-md-4">
        
        <!-- <h4>Click "Create new account?"</h4> -->


          <div class="flip">
        <div class="card"> 
          <div class="face front"> 
              


            <div class="panel panel-default">

<form class="form-horizontal" action="login" method="post">
 	<br>
      <h1 class="text-center">LOGO</h1>
    <br>
     <input class="form-control" name="memberID" "placeholder="Username"/>
	 <input class="form-control" name="password" placeholder="Password"/>

	<button class="btn btn-primary btn-block" type="submit">LOG IN</button>
	<!-- <hr>
                <p class="blue">Sign in with</p> -->
	
<!-- <input type="submit" id="login" value="Sign In" /> -->
  <hr>
				<p class="text-center">
                  <a href="#" class="fliper-btn">Create new account?</a>
                </p> 
                
</form>
</div>

<%-- <c:if test="${logintest != '' || logintest ne null}">

	<script>alert(${logintest})</script>
</c:if> --%>

	
	
	<!-- <form action="auth/logout" method="get">
	
	<input type="submit" name="logout" value="logout"/>
	<a href="logout">logout</a>
	</form> -->
	
	
	
	</div> 
          <div class="face back"> 
            

              <div class="panel panel-default">

              <form class="form-horizontal"  name="fr">
                
                <br>

                <h1 class="text-center">LOGO</h1>

                <br>
             <label>Member Information</label>
                 <input class="form-control" placeholder="ID" name="memberID" id="memberID_register"/>
               
                <input class="btn btn-primary btn-block" type="button" onclick="checkID()" value="checkID" class="checkID">

               <input class="form-control" placeholder="nickname" name="nickname" id="nickname_register"/>
               <!--  <label>Private Information</label> -->
                <input class="form-control" placeholder="Password" name="password" id="password_register"/>
                <!-- <input class="form-control" placeholder="Mobile Number"/>-->
                <button class="btn btn-primary btn-block" id="signup" onclick="register()">SIGN UP</button>


                <p class="text-center">
                  <a href="#" class="fliper-btn">Already have an account?</a>
                </p>
                
              </form>

            </div>
          </div>
        </div>   
      </div>

        </div>
        <div class="col-md-4"></div>

      </div>

    </div><!-- /.container -->
    <script>
    
    <% 	String contextPath  = request.getContextPath();	%>
	var contextPath = "<%=contextPath%>";
	var flipped;
	var IDchecked;

 	$(document).ready(function(){
      IDchecked = false;
      flipped = false;
        
        $('#signup').prop("disabled", true);
        
        if("${logintest}" != ""){
        //if("${logintest}" != null || "${logintest}" == ""){
        	alert("${logintest}");
        //}
        }
    }); 
    
    
    $('.fliper-btn').click(function(){
        $('.flip').find('.card').toggleClass('flipped');
        if(flipped){
        	flipped = false;
        }else{
        	flipped = true;
        }
    });
    
   
    
    function checkID(){
    	var id = $('#memberID_register').val();
    	if(id.length > 10){
    		$('#memberID_register').attr("placeholder","아이디는 10자리 이하");
    	}
    	
    	$.ajax({
    		type: "GET",
    		url: contextPath+"/auth/checkID?memberID="+id,
    		success: function(result){
    			alert("you can use ID");
    			$('.checkID').prop("disabled", true);
    			 $('#signup').prop("disabled", false);
    			IDchecked = true;
    		},
    		error(jqXHR, textStatus, errorThrown){
    			console.log(jqXHR);
    			console.log(textStatus);
    			console.log(errorThrown);
    			
    			if(jqXHR.status == 400){
    				alert(jqXHR.responseText);
    				//no MemberID, memberID too long
    			}
    			if(jqXHR.status == 409){		//conflict
    				alert("use another ID");
    			}
    		}
    		/* error: function(request, error){
    			if(request.status = 409){
    				alert("use another ID");
    			}else{
    				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			}		
    		} */
    		
    	})
    }
    
    function register(){
    	var id = $('#memberID_register').val();
    	var pw = $('#password_register').val();
    	var nk = $('#nickname_register').val();
 
    	
    	var info= new Object();
    	info.memberID = id;
    	info.password = pw;
    	info.nickname = nk;
    	
    	$.ajax({
    		type: "POST",
    		url: contextPath+"/auth/register",
    		data: info,
    		success: function(result){
    			alert("회원가입 완료");
    			console.log(result);
    		},
    		error: function(jqXHR, textStatus, errorThrown){
    			console.log(jqXHR);
    			console.log(textStatus);
    			console.log(errorThrown);
    			if(jqXHR.status = 409){
    				alert("response : "+jqXHR.responseText);
    			}		
    		}
    	}) 	
    }
    
    </script>
</body>
<!-- form에 값써지는거 계속 보고 있다가 sign up버튼 disable 버튼 false로 바꿔줘야함-->

</html>
