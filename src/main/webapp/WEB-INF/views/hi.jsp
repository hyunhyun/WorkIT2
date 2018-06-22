<!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Cards</li>
      </ol>
<h1>MainPage</h1>
<hr>

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
<!-- <button type="button" class="btn btn-default" id="createMemoBtn" onclick="createMemo()">
<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
</button> -->

<!-- <button type="button" class="btn btn-default" id="createMemoBtn" onclick="createMemo()"> -->
<button class="far fa-plus-square btn btn-default" id="createMemoBtn" onclick="createMemo()">메모 추가하기</button>
<!-- </button> -->

<i class="fas fa-arrow-alt-circle-left"></i> 

<div class="container-fluid" id="memoContainer">


<div id="insideMemoContainer"><!-- <span>memoContainer</span> -->
<div class="row" id="cardContainer"></div>
</div>




</div>


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
		<h2 class="blog-post-title mt-4" id="title_read">제목</h2>
		<!-- <div id="title_read">제목</div> -->
		<p class="lead">author</p>
		<hr>
		<p id="date_read">Date</p>
		<hr>
		<div id="content_read"><p class="lead">내용</p></div>
		<div id="responsable_read">책임자</div>
		<input type="button" value="댓글" onclick="getMemoComment()"/>
		<!-- <input type="button" onclick="addComment()" value="+댓글"/> -->
		<!-- <h2>AJAX File Upload</h2>-->
 <!--  <!--   <!--  파일을 업로드할 영역 -->
    <!-- <div class="fileDrop"></div>
    업로드된 파일 목록
    <div class="uploadedList"></div>  -->
    
		<!-- </div> --> 
	<!-- 	<div id="createComment">
		<input type="text" id="commentText" placeholder="댓글 작성"/>
		<input type="button" onclick="registerComment();" value="댓글 저장"/>
		</div> -->
		
		<div class="card my-4" id="createComment">
            <h5 class="card-header">Leave a Comment:</h5>
            <div class="card-body">
              <form>
                <div class="form-group">
                  <textarea class="form-control" rows="3" id="commentText"></textarea>
                </div>
                <button  class="btn btn-primary" onclick="registerComment()">Submit</button>
              </form>
            </div>
          </div>
		
		
		<div id="commentList"></div>
	</div>
	<!-- blog post -->
	</div>
	
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

</section>
<!--Section: Contact v.2-->
	<!-- <input type="button"  value="저장하기" onclick="updateMemo()"/>
		<input type="text" id="title_update"/>
		<input type="text" id="content_update"/>
		<input type="text" id="responsable_update"/> -->
	</div>
		