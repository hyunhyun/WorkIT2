<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"  rel="stylesheet">
<html>
<head>
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
  

  </style>
	<!-- <title>Home</title> -->
</head>
<body>

<h1>
	Hello world!  
</h1>

<P>  ${logintest}. </P>
<%-- <c:if test="${checkID}">
</c:if>
 --%>

 <div class="container">

      <div class="row">

        <div class="col-md-4"></div>
        <div class="col-md-4">
        
        <h4>Click "Create new account?"</h4>


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
	<hr>
                <p class="blue">Sign in with</p>
	
<!-- <input type="submit" id="login" value="Sign In" /> -->
  <hr>
                <p class="text-center">
                  <a href="#" class="fliper-btn">Create new account?</a>
                </p>
                
</form>
</div>

	<script>
		
	</script>
	
	<!-- <form action="auth/logout" method="get">
	
	<input type="submit" name="logout" value="logout"/>
	<a href="logout">logout</a>
	</form> -->
	
	
	
	</div> 
          <div class="face back"> 
            

              <div class="panel panel-default">

              <form class="form-horizontal"  name="fr" action="register" method="post">
                
                <br>

                <h1 class="text-center">LOGO</h1>

                <br>
             <label>Member Information</label>
                 <input class="form-control" placeholder="ID" name="memberID" id="memberID"/>
               
                <input type="button" onclick="checkID()" value="checkID" class="checkID">

               <input class="form-control" placeholder="nickname" name="nickname"/>
               <!--  <label>Private Information</label> -->
                <input class="form-control" placeholder="Password" name="password"/>
                <!-- <input class="form-control" placeholder="Mobile Number"/>-->
                <button class="btn btn-primary btn-block" id="signup">SIGN UP</button>


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

 	$(document).ready(function(){
      var IDchecked = false;
        var flipped = false;
        
        $('#signup').prop("disabled", true);
        
        /*  if(fr.memberID.value.length != 0 && 
        		fr.password.value.length != 0 && fr.nickname.value.length!= 0
        		&& IDchecked){
        	 $('#signup').prop("disabled", false);
        }   */
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
    	var id = $('#memberID').val();
    	if(id.length > 10){
    		$('#memberID').attr("placeholder","아이디는 10자리 이하");
    	}
    	
    	$.ajax({
    		type: "GET",
    		url: "http://localhost:8080/sc30/auth/checkID?memberID="+id,
    		success: function(result){
    			alert("you can use ID");
    			$('.checkID').prop("disabled", true);
    			 $('#signup').prop("disabled", false);
    			IDchecked = true;
    		},
    		error: function(request, error){
    			if(request.status = 409){
    				alert("use another ID");
    			}else{
    				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			}		
    		}
    	})
    	
    }</script>
</body>
<!-- form에 값써지는거 계속 보고 있다가 sign up버튼 disable 버튼 false로 바꿔줘야함-->

</html>
