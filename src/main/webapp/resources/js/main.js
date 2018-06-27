	
	var globalTopicID = -1;
	var globalMemoID = -1;
	var globalOpenComment = false;
	var globalTopicName = null;
	
	var createMemoOpen = false;		
	
	//var globalFileIDList;
	var globalFileNameList;
	
	var filesArray = null;
	
	var globalNickname = null;
	
	$(document).ready(function(){
		
//		topicSelected(globalTopicID)
//		alert(test);
		
		globalFileNameList = new Array();
		
		filesArray = new Array();
	
	})
	
	
	function createTopic(){
//		var topicName = $("#tName").val();
		var topicName = ""; 
			topicName = $("#createTopicName").val();
		
		alert("create Topic");
		alert(topicName);
		var data = {"topicName": topicName, "teamID": teamID};
		//var data = {"topicName": topicName, "teamID": $.cookie("teamID")};
		$.ajax({
			type : "POST", 
			url : contextPath+"/topic",
			data : data,
			success : function(){
				$("#createTopicModal").modal('hide');
				window.location.reload();
			},
			error: function(jqXHR,request, error){
				console.log(jqXHR);
				console.log(request);
				console.log(error);
				
				if(jqXHR.status == 400){
					alert(jqXHR.responseText);
				}
			},
			statusCode: {
				411: function(request, status, error){
					console.log("411- length required");
					alert("topicName 길이 10 이하");
				}
			}
		})
	}
		
	//이거 페이지 넘어가는걸로 바뀔거임
		function topicSelected(topicID){
			globalTopicID = topicID;
			//globalTopicName = topicName;
			$("#createMemoBtn").show();
			
			
			$.ajax({
				type: "GET",
				url : contextPath+"/memo/list/"+topicID,
//				url : "http://localhost:8080/ProjectManager2/memo/list/"+topicID,
				//data: data,
				success: function(result, status,xhr){
					//var memoContainer = $("#memoContainer");
					//alert(memoContainer);
					 //parse(result)
					 //result[0].item
//					 alert("success");
					console.log("result : "+result);
					console.log("status : "+status);
					console.log("xhr : "+xhr);
					
					var jLength = result.length;
					
//					$("#memoContainer > .row").empty();
					/*$("#insideMemoContainer > .row").empty();*/
					$("#insideMemoContainer > #cardContainer").empty();
					
					$("#insideMemoContainer > #cardContainer").show();
					$("#createMemoDiv").hide();
					$("#readMemoDiv").hide();
					$("#updateMemoDiv").hide();
					for(var i=0; i<jLength; i++){
						var title = result[i].title;
//						 bg-primary -파, bg-warning-노, bg-success-초, bg-danger-빨
						$("#insideMemoContainer > #cardContainer").append(`<div class="col-xl-3 col-sm-6 mb-3">
						          <div class="card text-white bg-warning o-hidden h-100">
						            <div class="card-body">
						              <div class="card-body-icon">
						                <i class="fa fa-fw fa-comments"></i>
						              </div>
						              <div class="mr-5">`+title+`</div>
						            </div>
						            <a class="card-footer text-white clearfix small z-1" href="#" onclick="selectMemo(`+result[i].memoID+`)">
						              <span class="float-left" >View Details</span>
						              <span class="float-right">
						                <i class="fa fa-angle-right"></i>
						              </span>
						            </a>
						          </div>
						        </div>`);
							
//						var div1 = $("<div id= 'memo_"+result[i].memoID+"' onclick='selectMemo("+result[i].memoID+")'>"+title+"</div>");

					}
				},
				error : function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(request);
					console.log(error);
					
					if(jqXHR.status == 400){
						alert(jqXHR.responseText);
					}
					
					var insideMemoContainer = $("#insideMemoContainer");
					//alert(memoContainer);
					//var div = $("<div>no Memo</div>");
					//memoContainer.append(div);
					insideMemoContainer.text('No Memo');
					//memoContainer.append("attached");
					//memoContainer.prop('hidden', true);
				}
			});
		}
		
		function createMemo(){
			
//			alert("button먹나");
			var createMemoDiv= $("#createMemoDiv");
//			createMemoDiv.prop('hidden', false);	
			
			if(!createMemoOpen){			
				$("#insideMemoContainer > #cardContainer").hide();
				$("#readMemoDiv").hide();
				$("#updateMemoDiv").hide();
				
				createMemoDiv.show();
				createMemoOpen = true;
			}else{
				createMemoDiv.hide();
				
				$("#insideMemoContainer > #cardContainer").show();
				$("#readMemoDiv").hide();
				$("#updateMemoDiv").hide();
				
				//empty filesArray
				filesArray.length = 0;
				
				$("#title_create").val("");
				$("#content_create").val("");
				$("#responsable_create").val("");
				
				createMemoOpen = false;
			}
		}
		
		function submitMemo(){		
			var totalInfo = new Object();
//			var formData = new FormData();
			
			var title = "";
			var content = "";
			var responsable = "";
			
			title = $("#title_create").val();
			content = $("#content_create").val();
			responsable = $("#responsable_create").val();
			
			totalInfo.title = title;
			totalInfo.content = content;
			totalInfo.responsable = responsable;
			totalInfo.topicID = globalTopicID;
			totalInfo.teamID = teamID;
			
//			formData.append("title", title);
//			formData.append("content", content);
//			formData.append("responsable", responsable);
//			formData.append("files", filesArray);
			
//			var ajaxUrl = "";
//			if(filesArray.length >0){
//				totalInfo.files = filesArray;
//				//ajaxUrl = contextPath+"/memo";
//			}else{
//				//ajaxUrl = contextPath+"/memo/file";
//			}
			
//			totalInfo.files = filesArray;
			
			//fileID, fileName List
			//totalInfo.fileID = globalFileIDList;
			
//			for(var i=0; i<globalFileNameList.length; i++){
//				console.log("submit Memo fileName: "+globalFileNameList[i]);
//				//수정
//				totalInfo.fileName = globalFileNameList[i];
//			}
			//수정
//			totalInfo.fileName = globalFileNameList;
			
			//globalTopicID, teamID 선택 안되면 ""됨 숫자가아닌 String 되
			
			alert("topicMemo");
			console.log(totalInfo);
//			console.log(formData);
			
			$.ajax({
				type: "POST",
				url: contextPath+"/memo",
				data: totalInfo,
//				data: formData,
				//datatype: "JSON",
				//contentType : "application/json; charset=UTF-8",
				success: function(result, status,xhr){
					//function(data){
			
					alert("memo Created");
					console.log(result);
					//read로 바꿔놓아야함 - 해당글
					
					uploadFile(result.memoID);
					
//					selectMemo(result.memoID);	
					
					
//					console.log(result);
					
				},
				error : function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
//					alert(error);
					if(jqXHR.status == 400){
						alert(jqXHR.responseText);
					}
										
				},
				statusCode: {
			        200: function () {
			            console.log("200 - Success");
			        },
			        400: function(){
			        	//alert("Responsable must be a TeamMember");
			        	console.log("400 - Bad Request");
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
		function showCreateModal(){
			$("#createTopicModal").modal('show');
			$("#createTopicName").attr("placeholder", "topicName");
		}
		
		function showUpdateModal(topicID, topicName){
			globalTopicID = topicID;
			$("#updateTopicModal").modal('show');
			$("#updateTopicName").attr("placeholder", topicName);
		}
		
//		function updateTopic(topicID){
		function updateTopic(){
			var topicName = "";
			topicName = $("#updateTopicName").val();

			alert(topicName);
			var totalInfo = new Object();
			totalInfo.topicID = globalTopicID;
			totalInfo.topicName= topicName;
			console.log(totalInfo);
			
			$.ajax({
				type: "PUT",
				url: contextPath+"/topic",
				data: totalInfo,
				success: function(data){
					alert("topic updated");
					window.location.reload();
				},
				error :function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					
					if(jqXHR.status == 400){
						alert(jqXHR.responseText);
					}
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
		
		function deleteTopic(topicID){
			//var totalInfo = {"topicID": topicID};
			var totalInfo = new Object();
			
			var tempID = -1;
			tempID = topicID;
			totalInfo.topicID = tempID;
			
			console.log("lets delete");
			alert("topicID: "+topicID);
			alert(totalInfo);
			$.ajax({
				type:"DELETE",
				url: contextPath+"/topic",
				data : totalInfo,
				//datatype: "JSON",
				//contentType : "application/json; charset=UTF-8",
				success: function(){
					alert("topic deleted");
					window.location.reload();
				},
				error :function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					if(jqXHR.status == 400){
						alert(jqXHR.responseText);
					}
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
		
		function selectMemo(memoID){
			globalMemoID = memoID;
			
			$.ajax({
				type:"GET",
				url: contextPath+"/memo/"+memoID,
				success: function(result, status,xhr){
					console.log("memo Select Success");
					
					$("#insideMemoContainer > #cardContainer").hide();
					$("#createMemoDiv").hide();
					$("#readMemoDiv").show();
					$("#updateMemoDiv").hide();
					/*
					$("#title_read").text(result.title);
					$("#content_read > p").text(result.content);
					$("#responsable_read").text(result.responsable);
					
					$("#writer_read").text(result.writer);*/
					

					$("#title_read").text(result.memo.title);
					$("#content_read > p").text(result.memo.content);
					$("#responsable_read").text(result.memo.responsable);
					
//					$("#date_read").text(result.memo.date);
					$("#writer_read").text(result.memo.writer);
					
					$("#uploadedList_read").empty();
					//show files
					if(result.files != null){
						for(var i=0; i<result.files.length; i++){
							 //var n = result.files[i].fileName.indexOf("_");
			                //var originalName = result.files[i].fileName.substring(n+1);
							var originalName =result.files[i].fileName;
			                str = "<div><a href='resources/upload/"+result.files[i].uuid+"'>"+originalName+"</a>";
			                // 삭제 버튼
			                str += '<span data-src='+result.files[i].fileName+' onclick="deleteFile('+memoID+', '+result.files[i].fileID+', \''+result.files[i].uuid+'\')">[삭제]</span></div>';
			                
			                $("#uploadedList_read").append(str);
						}
					}
                    
                   
					var date = new Date(result.memo.date);
					var year = date.getFullYear();
					var month = date.getMonth()+1;
					var day = date.getDate();
					var hour = date.getHours();
					var minute = date.getMinutes();
					var seconds = date.getSeconds();
					
					
					$("#date_read").text(year+"/"+month+"/"+day+" "+hour+" : "+minute+" : "+seconds);
															
				},
				error :function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					if(jqXHR.status == 400){
						alert(jqXHR.responseText);
					}
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
		
		function updateBtn(){
			var title = $("#title_read").text();
			var content = $("#content_read").text();
			var responsable = $("#responsable_read").text();
		
			$("#readMemoDiv").hide();
			$("#updateMemoDiv").show();
			
			alert(title);
			$("#title_update").val(title);
			$("#content_update").val(content);
			$("#responsable_update").val(responsable);
		}
		
		function updateMemo(){
			var title = $("#title_update").val();
			var content = $("#content_update").val();
			var responsable = $("#responsable_update").val();
			
			var totalInfo = new Object();
			totalInfo.title = title;
			totalInfo.content = content;
			totalInfo.responsable = responsable;
			
			$.ajax({
				type:"PUT",
				url: contextPath+"/memo/"+globalMemoID,
				data : totalInfo,
				success: function(){
					$("#readMemoDiv").show();
					
					$("#title_read").text(title);
					$("#content_read > p").text(content);
					$("#responsable_read").text(responsable);
					
					
					$("#updateMemoDiv").hide();
				
				},
				error :function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					
					if(jqXHR.status == 400){
						alert(jqXHR.responseText);
					}
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
		
		function deleteMemo(){
			$.ajax({
				type:"DELETE",
				url: contextPath+"/memo/"+globalMemoID,
				success: function(result, status,xhr){
					alert("memo deleted");
				},
				error :function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					
					if(jqXHR.status == 400){
						alert(jqXHR.responseText);
						
					}
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
		
//		}
		
		function registerComment(){
			var commentText = $("#commentText").val();
			
			alert("text:"+commentText);
			alert("memoID: "+globalMemoID);
			var jObject = new Object();
			jObject.content = commentText;
			
			$.ajax({
				type:"POST",
				url: contextPath+"/comment/"+globalMemoID,
				data: jObject,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function(result, status,xhr){
					alert("comment created");
					
					globalOpenComment = false;
					$("#commentList").empty();
					getMemoComment();
				},
				error :function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					
					if(jqXHR.status == 400){
						alert(jqXHR.responseText);
					}
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
		
/*		function uploadFile(memoID){
//			var totalObject = new Object();
//			totalObject.memoID = memoID;
			
//			var files = event.originalEvent.dataTransfer.files;
            // 첫번째 파일
//            var file = files[0];
            // 콘솔에서 파일정보 확인
//            console.log(file);

            // ajax로 전달할 폼 객체
            var formData = new FormData();
            formData.enctype = 'multipart/form-data';

            // 폼 객체에 파일추가, append("변수명", 값)
            formData.append("file", filesArray[0]);
            formData.append("memoID", memoID);
			
			$.ajax({
				type: "POST",
				url: contextPath+"/fileUpload",
				data : formData,
				success: function(result, status, xhr){
					
				},
				 contentType:false,
			     processData:false

			})
		}*/
		
		function uploadFile(memoID){
//			var totalObject = new Object();
//			totalObject.memoID = memoID;
			
//			var files = event.originalEvent.dataTransfer.files;
            // 첫번째 파일
//            var file = files[0];
            // 콘솔에서 파일정보 확인
//            console.log(file);

            // ajax로 전달할 폼 객체
            var formData = new FormData();
            formData.enctype = 'multipart/form-data';

            // 폼 객체에 파일추가, append("변수명", 값)

            console.log(filesArray);
            console.log("filesArray length :"+filesArray.length);
            
            for(var i=0; i<filesArray.length; i++){
            	formData.append("file_"+i, filesArray[i]);
            }
            formData.append("memoID", memoID);
			
			$.ajax({
				type: "POST",
				url: contextPath+"/fileUpload",
				data : formData,
				success: function(result, status, xhr){
					console.log(result);
					
					filesArray.length = 0;
					selectMemo(memoID);
				},error(jqXHR, textStatus, errorThrown){
					console.log(jqXHR);
					console.log(textStatus);
					console.log(errorThrown);
				},
				 contentType:false,
			     processData:false

			})
		}
		
		
		
		function getMemoComment(){
//			alert("getMemoComment");
			if(!globalOpenComment){
//				alert("globalOpenComment false");
			$.ajax({
				type:"GET",
				url: contextPath+"/comment/list/"+globalMemoID,
				success: function(result, status,xhr){
//					alert("memoList success");
					console.log("memoList success");
					//comment 붙이기
					
					console.log("length : "+result.length);
					console.log("content:"+result[0].content);
					
//					var commentList = $("#comments-container");
					var commentList = $(".comments-container");
					commentList.empty();
					//commentList.append(`<h1>Comentarios <a href="http://creaticode.com">creaticode.com</a></h1>`);
					commentList.append(`<h1>Comments</h1>`);
//					commentList.append('<ul class="comments"></ul>');
					commentList.append('<ul id="comments-list" class="comments-list"></ul>');
					
					for(var i=0; i<result.length; i++){
						var div = "<div class='commentContainer' id='commentContainer_"+result[i].commentID+"'></div>"; 
						var readDiv = "<div id='commentReadContainer_"+result[i].commentID+"'></div>";
						var writer = "<div class='commentWriter'>글쓴이 : "+result[i].writer+"</div>";
						var contentDiv = "<div class='commentContent' id='commentContentRead_"+result[i].commentID+"'>"+result[i].content+"</div>";
						var updateBtn = "<input type='button' class='commentUpdateBtn' onclick='showUpdateComment("+result[i].commentID+")' value='수정'/>";
						var deleteBtn = "<input type='button' class='commentDeleteBtn' onclick='deleteComment("+result[i].commentID+")' value='삭제'/>";
						
						var updateDiv = "<div class='commentUpdateDiv' id='commentUpdateContainer_"+result[i].commentID+"'></div>";
						var contentUpdate = "<input type='text' class='commentContent' id='commentContentUpdate_"+result[i].commentID+"' placeholder='"+result[i].content+"'/>";
						var updateSendBtn = "<input type='button' class='commentUpdateSend' onclick='updateComment("+result[i].commentID+")' value='저장'/>";
						
						
//						//잘되는거 디자인 없는거
//						commentList.append(div);
//						var comment = $("#commentContainer_"+result[i].commentID);
//						comment.append(readDiv);		
//						
//						commentRead = $("#commentReadContainer_"+result[i].commentID);
//						
//						commentRead.append(writer);
//						commentRead.append(contentDiv);
//					
//						if(result[i].writer == memberID){
//							commentRead.append(updateBtn);
//							commentRead.append(deleteBtn);	
//						}
//						
//						comment.append(updateDiv);
//						var commentUpdate = $("#commentUpdateContainer_"+result[i].commentID);
//						commentUpdate.append(contentUpdate);
//						commentUpdate.append(updateSendBtn);
//							//End					
						
//						var commentList = $("#commentList");
//						commentList.append('<ul class="comments-list"></ul>');	
						
						
//						Hyun
						var date = new Date(result[i].date );
//						date.toLocaleString()
//						var formattedDate = moment(date).format('YYYY-MM-DD');
//						var date2 = result[i].date;
//						date2.format("HH/mm/ss")
						var year = date.getFullYear();
						var month = date.getMonth()+1;
						var day = date.getDate();
						var hour = date.getHours();
						var minute = date.getMinutes();
						var seconds = date.getSeconds();
						

						
						//img 있는거 - 자꾸 화면 정렬 잘안되
//					 사진 추가할라면 div class avatar 추가하면 되
					/*	<li id="commentReadContainer_`+result[i].commentID+`">
						<div class="comment-main-level">
							<!-- Avatar -->
							<div class="comment-avatar" ><img src="http://i9.photobucket.com/albums/a88/creaticode/avatar_1_zps8e1c80cd.jpg" alt=""></div>
							<!-- Contenedor del Comentario -->
							<div class="comment-box">
								<div class="comment-head">
									<h6 class="comment-name by-author"><a href="http://creaticode.com/blog">`+result[i].writer+`</a></h6>
									<span>`+year+` - `+month+` - `+day+` `+hour+`: `+minute+`</span>
									
									<i class="fas fa-edit" onclick="showUpdateComment(`+result[i].commentID+`)"></i>
									<i class="fa fa-trash" onclick="deleteComment(`+result[i].commentID+`)"></i>
								</div>
								<div class="comment-content" id="commentContentRead_`+result[i].commentID+`">
									`+result[i].content+`
								</div>
							</div>
						</div>	
					</li>*/
						
						if(result[i].writer == memberID){
							$("#comments-list").append(`
								<li id="commentReadContainer_`+result[i].commentID+`">
									<div class="comment-main-level">
										<!-- Avatar -->
										
										<!-- Contenedor del Comentario -->
										<div class="comment-box">
											<div class="comment-head">
												<h6 class="comment-name by-author"><a>`+result[i].writer+`</a></h6>
												<span>`+year+` - `+month+` - `+day+` `+hour+`: `+minute+`</span>
											
												
												<i class="fas fa-edit" onclick="showUpdateComment(`+result[i].commentID+`)"></i>
												<i class="fa fa-trash" onclick="deleteComment(`+result[i].commentID+`)"></i>
											</div>
											<div class="comment-content" id="commentContentRead_`+result[i].commentID+`">
												`+result[i].content+`
											</div>
										</div>
									</div>	
								</li>
								<li id="commentUpdateContainer_`+result[i].commentID+`" class="commentUpdateDiv">
									<div class="comment-main-level" id="commentReadContainer_`+result[i].commentID+`">
										<!-- Avatar -->
										
										<!-- Contenedor del Comentario -->
										<div class="comment-box">
											<div class="comment-head">
												<h6 class="comment-name by-author"><a>`+result[i].writer+`</a></h6>
												<span>`+year+` - `+month+` - `+day+`</span>
												
											</div>
											<div class="comment-content">
												<input type="text" id="commentContentUpdate_`+result[i].commentID+`" value="`+result[i].content+`"/>
												<i class="fa fa-arrow-circle-right" onclick="updateComment(`+result[i].commentID+`)"></i>
											</div>		
										</div>
									</div>
								</li>
							`);
						
							$(".commentUpdateDiv").hide();
										
						}else{
						
							$("#comments-list").append(`
								<li id="commentReadContainer_`+result[i].commentID+`">
										<div class="comment-main-level">
											<!-- Avatar -->
											
											<!-- Contenedor del Comentario -->
											<div class="comment-box">
												<div class="comment-head">
													<h6 class="comment-name by-author"><a>`+result[i].writer+`</a></h6>
													<span>`+year+` - `+month+` - `+day+` `+hour+`: `+minute+`</span>
												</div>
												<div class="comment-content" id="commentContentRead_`+result[i].commentID+`">
													`+result[i].content+`
												</div>
											</div>
										</div>	
									</li>`);		
						
						}		
					}
					
					globalOpenComment = true;
					
				},
			
				error :function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					
					if(jqXHR.status == 400){
						alert(jqXHR.responseText);
					}
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
			}else{
				$(".comments-container").empty();
				globalOpenComment = false;
			}
			
		}
		
		
		function deleteComment(commentID){
			$.ajax({
				type:"DELETE",
				url: contextPath+"/comment/"+commentID,
				success: function(result, status,xhr){
					alert("comment deleted");
					
					globalOpenComment = false;
					$("#commentList").empty();
					getMemoComment();
				},
			
				error :function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					if(jqXHR.status ==400){
						alert(jqXHR.responseText);
					}
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
		
		function showUpdateComment(commentID){			
			$("#commentUpdateContainer_"+commentID).toggle();
			$("#commentReadContainer_"+commentID).toggle();
		}
		
		function updateComment(commentID){
			var content =$("#commentContentUpdate_"+commentID).val();
			
			var jObject = new Object();
			jObject.content = content;
			
			$.ajax({
				type:"PUT",
				url: contextPath+"/comment/"+commentID,
				data: jObject,
				success: function(result, status,xhr){
					alert("comment updated");	
					globalOpenComment = false;
					$("#commentList").empty();
					getMemoComment();
				},
			
				error :function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					if(jqXHR.status == 400){
						alert(jqXHR.responseText);
					}
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
		
		function getMyWorkList(){
			alert(memberID);
			$.ajax({
				type:"GET",
				url: contextPath+"/memo/myList/"+memberID,
				success: function(result, status,xhr){
					alert("get myWork success");
					
					alert("result length"+result.length);
					

					$("#insideMemoContainer > #cardContainer").show();
					$("#createMemoDiv").hide();
					$("#readMemoDiv").hide();
					$("#updateMemoDiv").hide();
					
					if(result.length > 0){
							$("#insideMemoContainer > #cardContainer").empty();
							for(var i=0; i<result.length; i++){
								var title = result[i].title;
//								 bg-primary -파, bg-warning-노, bg-success-초, bg-danger-빨
								$("#insideMemoContainer > #cardContainer").append(`<div class="col-xl-3 col-sm-6 mb-3">
								          <div class="card text-white bg-warning o-hidden h-100">
								            <div class="card-body">
								              <div class="card-body-icon">
								                <i class="fa fa-fw fa-comments"></i>
								              </div>
								              <div class="mr-5">`+title+`</div>
								            </div>
								            <a class="card-footer text-white clearfix small z-1" href="#" onclick="selectMemo(`+result[i].memoID+`)">
								              <span class="float-left">View Details</span>
								              <span class="float-right">
								                <i class="fa fa-angle-right"></i>
								              </span>
								            </a>
								          </div>
								        </div>`);
									
//								var div1 = $("<div id= 'memo_"+result[i].memoID+"' onclick='selectMemo("+result[i].memoID+")'>"+title+"</div>");

						}
					}
				},
			
				error :function(jqXHR,request, error){
					console.log(jqXHR);
//					console.log(status);
					console.log(error);
					
					if(jqXHR.status == 400){
						alert(jqXHR.responseText);
					}
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
		
		//ajax 방식으로 file 업로드하기
		$(document).ready(function(){
	        $(".fileDrop").on("dragenter dragover", function(event){
	            event.preventDefault(); // 기본효과를 막음
	        });
	        // event : jQuery의 이벤트
	        // originalEvent : javascript의 이벤트
//	        $(".fileDrop").on("drop", function(event){
//	            event.preventDefault(); // 기본효과를 막음
//          	            // 드래그된 파일의 정보
//	            var files = event.originalEvent.dataTransfer.files;
//	            // 첫번째 파일
//	            var file = files[0];
//	            // 콘솔에서 파일정보 확인
//	            console.log(file);
//
//	            // ajax로 전달할 폼 객체
//	            var formData = new FormData();
//	            // 폼 객체에 파일추가, append("변수명", 값)
//	            formData.append("file", file);
//	       
//
//	            $.ajax({
//	                type: "POST",
//	                //url: contextPath+"/upload/uploadAjax",
//	                url: contextPath+"/fileUpload",
//	                data: formData,
//	                // processData: true=> get방식, false => post방식
//	                dataType: "text",
//	                // contentType: true => application/x-www-form-urlencoded, 
//	                //                false => multipart/form-data
//	                processData: false,
//	                contentType: false,
//	                success: function(data){
//	                    alert(data);
//	                    
//	                    var str = "";
//	                    // 이미지 파일이면 썸네일 이미지 출력
////	                    if(checkImageType(data)){ 
////	                        str = "<div><a href='"+contextPath+"/upload/displayFile?fileName="+getImageLink(data)+"'>";
////	                    	/*str = "<div><a href='"+contextPath+"/upload/displayFile?fileName="+getImageLink(data)+"'>";*/
////	                        str += "<img src='"+contextPath+"/upload/displayFile?fileName="+data+"'></a>";
////	                    // 일반파일이면 다운로드링크
////	                    } else { 
////	                       str = "<div><a href='"+contextPath+"/upload/displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a>";
////	                    	//str = "<div><a href='C:/Users/USER/Desktop/uploadtest"+data+"'>"+getOriginalName(data)+"</a>";
////	
////	                    }
//	                    
//	                    //str = "<div><a href='"+contextPath+"/upload/displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a>";
//	                    
//	                    var n = data.indexOf("_");
//	                    var originalName = data.substring(n+1);
//	                    str = "<div><a href='resources/upload/"+data+"'>"+originalName+"</a>";
//	                    // 삭제 버튼
//	                    str += "<span data-src="+data+">[삭제]</span></div>";
//	                    $("#uploadedList").append(str);
//	                    
//	                    
//	                    globalFileNameList.push(data);
//	                    
//	                    for(var i=0; i<globalFileNameList.length; i++){
//	                    	console.log("push fileName : "+globalFileNameList[i]);
//	                    }
//	                    
//	                },
//	                error :function(jqXHR,request, error){
//						console.log(jqXHR);
//						console.log(status);
//						console.log(error);
//					}
//	                
//	            });
//	        });
	        
	        
	        $(".fileDrop").on("drop", function(event){
	            event.preventDefault(); // 기본효과를 막음
          	            // 드래그된 파일의 정보
	            var files = event.originalEvent.dataTransfer.files;
	            // 첫번째 파일
	            var file = files[0];
	            // 콘솔에서 파일정보 확인
	            console.log(file);

	            filesArray.push(file);
	            // ajax로 전달할 폼 객체
	            //var formData = new FormData();
	            // 폼 객체에 파일추가, append("변수명", 값)
	            //formData.append("file", file);
	            
                // 삭제 버튼
	            var fileName= '<div>'+file.name+'</div>';
	            $("#deleteFileBtn_create").show();
                $("#uploadedList_create").append(fileName);
	       
	        });
	        
	        
	        $(".uploadedList").on("click", "span", function(event){
	            alert("이미지 삭제")
	            var that = $(this); // 여기서 this는 클릭한 span태그
	            $.ajax({
	                url: "${path}/upload/deleteFile",
	                type: "post",
	                // data: "fileName="+$(this).attr("date-src") = {fileName:$(this).attr("data-src")}
	                // 태그.attr("속성")
	                data: {fileName:$(this).attr("data-src")}, // json방식
	                dataType: "text",
	                success: function(result){
	                    if( result == "deleted" ){
	                        // 클릭한 span태그가 속한 div를 제거
	                        that.parent("div").remove();
	                    }
	                }
	            });
	        });
	        
	    });
	
	  
		$("#searchContent").autocomplete({
			source: function(request, response){
				var search = $("#searchContent").val();
				$.ajax({
					url: contextPath+"/memo",
					method: "GET",
					data: {searchContent: search},
					success: function(data){
						console.log(data);
										
						response($.map(data, function(item){
							var index = item.content.indexOf(search);
							
							return {label: item.title+" Memo : "+item.content.substring(index), value: item.content};
						}));
					},
					error : function(jqXHR,request, error){
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				})	
			}
		})
		
	  
	  function searchContent(){
			var searchContent = $("#searchContent").val();
			alert(searchContent);
			var totalInfo = new Object();
			totalInfo.searchContent = searchContent;

			$.ajax({
				type: "GET",
				url: contextPath+"/memo",
				data: totalInfo,
				success: function(result){
					alert("success");
					//success 하면 뭐해야되지?
//					console.log(data);
					
					
//					for(var i=0; i<result.length; i++){
//						var title = result[i].title;
//						var div = $("<div id= 'memo_"+data[i].memoID+"' onclick='selectMemo("+data[i].memoID+")'>"+title+"</div>");
//						$("#memoContainer").empty();
//						$("#memoContainer").append(div);
						
						
						$("#insideMemoContainer > #cardContainer").empty();
						for(var i=0; i<result.length; i++){
							var title = result[i].title;
							
//							$("#insideMemoContainer > #cardContainer").empty();
//							 bg-primary -파, bg-warning-노, bg-success-초, bg-danger-빨
							$("#insideMemoContainer > #cardContainer").append(`<div class="col-xl-3 col-sm-6 mb-3">
							          <div class="card text-white bg-warning o-hidden h-100">
							            <div class="card-body">
							              <div class="card-body-icon">
							                <i class="fa fa-fw fa-comments"></i>
							              </div>
							              <div class="mr-5">`+title+`</div>
							            </div>
							            <a class="card-footer text-white clearfix small z-1" href="#" onclick="selectMemo(`+result[i].memoID+`)">
							              <span class="float-left">View Details</span>
							              <span class="float-right">
							                <i class="fa fa-angle-right"></i>
							              </span>
							            </a>
							          </div>
							        </div>`);
								
//							var div1 = $("<div id= 'memo_"+result[i].memoID+"' onclick='selectMemo("+result[i].memoID+")'>"+title+"</div>");

						}
						
						
						
				},
				error :function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					if(jqXHR.status == 400){
						alert(jqXHR.responseText);
					}
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
//$(document).on('click','#responsable_create',function(){
//	console.log($('#responsable_create').val());
//});
		$("#responsable_create").autocomplete({
			source: function(request, response){
				console.log(request);
				$.ajax({
					url: contextPath+"/team/member/auto",
					method: "GET",
					data: {teamID: teamID, memberID: $("#responsable_create").val()},
					success: function(data){
						console.log(data);
						response($.map(data, function(item){
							return {label: item.memberID, value: item.memberID};
						}));
					},
					error : function(jqXHR,request, error){
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				})
			}
		});
		
		$("#responsable_update").autocomplete({
			source: function(request, response){
				console.log(request);
				$.ajax({
					url: contextPath+"/team/member/auto",
					method: "GET",
					data: {teamID: teamID, memberID: $("#responsable_update").val()},
					success: function(data){
						console.log(data);
						response($.map(data, function(item){
							return {label: item.memberID, value: item.memberID};
						}));
					},
					error : function(jqXHR,request, error){
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				})
			}
		});
		
		
		function deleteFile(memoID, fileID, uuid){
			var totalObject = new Object;
			totalObject.uuid = uuid;
			
			console.log("deleteFile start");
			console.log("fileID : "+fileID);
			console.log("uuid : "+uuid);
			//file DB에서도 지우고, 업로드 된 위치에서도 지우고
			$.ajax({
				url:contextPath+"/file/"+fileID,
				method: "DELETE",
				data: totalObject,
				success : function(result){
					console.log("deleteFile result : "+result);
					
					selectMemo(memoID);
				},
				error: function(jqXHR,textStatus, errorThrown){
//					jqXHR :브라우저 XMLHttpRequest Object의 집합
//					if(jqXHR.status == 400){
//						alert(jqXHR.responseText);
//					}
//					if(jqXHR.status == 500){//InternalServerError - file Not Deleted
//						
//					}
					alert("file Deleted fail");
					
					console.log(jqXHR);
					console.log(textStatus);
					console.log(errorThrown);
				}
			})
		}
		
		function deleteFileArray(){
			filesArray.length = 0;
			
			$("#uploadedList_create").empty();
		}
		
		function teamMemberAdd(){
			var teamMemberID = $("#teamMemberAdd").val();
			var totalObject = new Object();
			
			totalObject.memberID = teamMemberID;
			totalObject.teamID = teamID;
			totalObject.nickname = globalNickname;
			
			console.log("teamMemberAdd nickname : "+globalNickname);
			
			$.ajax({
				url:contextPath+"/team/member",
				method: "POST",
				data: totalObject,
				success : function(result){
					//if result null 이미 있는 teamMember
					if(result != null && result!= ""){
					console.log("add TeamMember result : "+result);
					
					$("#teamMemberDropDown").append(
			`<div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fas fa-user-alt"></i>&nbsp ${result.memberID}</strong>
              </span>
              <div class="dropdown-message small">${result.nickname}</div>
            </a>`);
					}					
				},
				error: function(jqXHR,textStatus, errorThrown){

					console.log(jqXHR);
					console.log(textStatus);
					console.log(errorThrown);
					
//					if(jqXHR.status ==){
//						
//					}
				}
			})
		}
		
		
		
		
$("#teamMemberAdd").autocomplete({			
			source: function(request, response){
				$.ajax({
					url: contextPath+"/member",
					method: "GET",
					data: {search: $("#teamMemberAdd").val()},
					success: function(data){
						console.log(data);
						
						$(".ui-helper-hidden-accessible").hide();
						response($.map(data, function(item){
							return {label: item.memberID, value: item.memberID, nickname: item.nickname};
						}));
					},
					error : function(jqXHR,request, error){
						console.log(jqXHR);
						console.log(status);
						console.log(error);			
					}
				})	
			},
			select : function(event, ui){
				globalNickname = ui.item.nickname;
				
				console.log("autocomplete select nickname : "+ui.item.nickname);
			}
		})
		
		
		