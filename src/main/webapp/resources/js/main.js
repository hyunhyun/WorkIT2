	
	var globalTopicID = -1;
	var globalMemoID = -1;
	var globalOpenComment = false;
	var globalTopicName = null;
	
	var createMemoOpen = false;		
	
	
	$(document).ready(function(){
		
//		topicSelected(globalTopicID)
//		alert(test);
	})
	
	
	function createTopic(){
		var topicName = $("#tName").val();
		alert("create Topic");
		alert(topicName);
		var data = {"topicName": topicName, "teamID": teamID};
		//var data = {"topicName": topicName, "teamID": $.cookie("teamID")};
		$.ajax({
			type : "POST", 
			url : contextPath+"/topic",
			data : data,
			success : function(){},
			error: function(){},
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
			//var data = {"topicID" : topicID};
			alert("topicID: "+topicID);
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
					 alert("success");
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
				
				createMemoOpen = false;
			}
		}
		
		function submitMemo(){		
			var totalInfo = new Object();
			
			totalInfo.title = $("#title_create").val();
			totalInfo.content = $("#content_create").val();
			totalInfo.responsable = $("#responsable_create").val();
			totalInfo.topicID = globalTopicID;
			totalInfo.teamID = teamID;
			
			//globalTopicID, teamID 선택 안되면 ""됨 숫자가아닌 String 되
			
			alert("topicMemo");
			console.log(totalInfo);

			$.ajax({
				type: "POST",
				url: contextPath+"/memo",
				data: totalInfo,
				//datatype: "JSON",
				//contentType : "application/json; charset=UTF-8",
				success: function(result, status,xhr){
					//function(data){
			
					alert("memo Created");
					console.log(result);
					//read로 바꿔놓아야함 - 해당글
					
					selectMemo(result.memoID);	
					
					
					console.log(result);
					
				},
				error : function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
//					alert(error);
//					if(jqXHR.status == 400){
//						alert(jqXHR.responseText);
//					}
				},
				statusCode: {
			        200: function () {
			            console.log("200 - Success");
			        },
			        400: function(){
			        	alert("Responsable must be a TeamMember");
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
		function showModal(topicID, topicName){
			globalTopicID = topicID;
			$("#updateTopicModal").modal('show');
			$("#updateTopicName").attr("placeholder", topicName);
		}
		
		function updateTopic(topicID){
			var topicName = $("#updateTopicName").val();
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
		
		function deleteTopic(topicID){
			//var totalInfo = {"topicID": topicID};
			var totalInfo = new Object();
			totalInfo.topicID = topicID;
			
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
					
					$("#title_read").text(result.title);
					$("#content_read > p").text(result.content);
					$("#responsable_read").text(result.responsable);
															
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
		
		
		function getMemoComment(){
			alert("getMemoComment");
			if(!globalOpenComment){
				alert("globalOpenComment false");
			$.ajax({
				type:"GET",
				url: contextPath+"/comment/list/"+globalMemoID,
				success: function(result, status,xhr){
					//alert("memoList success");
					console.log("memoList success");
					//comment 붙이기
					
					console.log("length : "+result.length);
					console.log("content:"+result[0].content);
					
					var commentList = $("#commentList");
					commentList.append('<ul class="comments"></ul>');
					
					for(var i=0; i<result.length; i++){
						var div = "<div class='commentContainer' id='commentContainer_"+result[i].commentID+"'></div>"; 
						var readDiv = "<div id='commentReadContainer_"+result[i].commentID+"'></div>";
						var writer = "<div class='commentWriter'>글쓴이 : "+result[i].writer+"</div>";
						var contentDiv = "<div class='commentContent' id='commentContentRead_"+result[i].commentID+"'>"+result[i].content+"</div>";
						var updateBtn = "<input type='button' class='commentUpdateBtn' onclick='showUpdateComment("+result[i].commentID+")' value='수정'/>";
						var deleteBtn = "<input type='button' class='commentDeleteBtn' onclick='deleteComment("+result[i].commentID+")' value='삭제'/>";
						
						var updateDiv = "<div id='commentUpdateContainer_"+result[i].commentID+"'  hidden='true'></div>";
						var contentUpdate = "<input type='text' class='commentContent' id='commentContentUpdate_"+result[i].commentID+"' placeholder='"+result[i].content+"'/>";
						var updateSendBtn = "<input type='button' class='commentUpdateSend' onclick='updateComment("+result[i].commentID+")' value='저장'/>";
						
						var comment = commentList.append(div);
						commentList.append(div);
						var commentRead = comment.append(readDiv);
						var comment = $("#commentContainer_"+result[i].commentID);
						comment.append(readDiv);		
						
						commentRead = $("#commentReadContainer_"+result[i].commentID);
						
						commentRead.append(writer);
						commentRead.append(contentDiv);
					
						if(result[i].writer == memberID){
							commentRead.append(updateBtn);
							commentRead.append(deleteBtn);	
						}
						
						comment.append(updateDiv);
						var commentUpdate = $("#commentUpdateContainer_"+result[i].commentID);
						commentUpdate.append(contentUpdate);
						commentUpdate.append(updateSendBtn);
						comment.append(contentUpdate);
												
						//바꾸는거
//						$(".comments").append(div);
//						var comment = $("#commentContainer_"+result[i].commentID);
//						comment.append(readDiv);
//						commentRead = $("#commentReadContainer_"+result[i].commentID);
						
						
						
						
						
////						Hyun
//						var date = new Date(result[i].date * 1000);
////						date.toLocaleString()
////						var formattedDate = moment(date).format('YYYY-MM-DD');
//						var date2 = result[i].date;
//						
//						$(".comments").append(`<li class="clearfix" id="commentReadContainer_'+result[i].commentID+'">					  
//						  <div class="post-comments">
//						      <p class="meta" id="commentDateRead_`+result[i].commentID+`">`+result[i].date2.format("HH/mm/ss")+` <a>`+result[i].writer+`</a> says : <i class="pull-right"><a href="#"><small>Reply</small></a></i></p>
//						      <p class="commentContent" id="commentContentRead_`+result[i].commentID+`">`+result[i].content+`</p>				
//						  </div
//						</li>`);
//						if(result[i].writer == memberID){
//							$("#commentReadContainer_"+result[i].commentID).append(updateBtn);
//							$("#commentReadContainer_"+result[i].commentID).append(deleteBtn);	
//						}
//						
//						$(".comments").append(`<li class="clearfix" id="commentUpdateContainer_`+result[i].commentID+`" hidden="true">
//								 
//								  <div class="post-comments">
//								      <input type="text" class="commentContent" id="commentContentUpdate_`+result[i].commentID+`" placeholder="`+result[i].content+`"/>
//								      <input type="button" class="commentUpdateSend" onclick="updateComment(`+result[i].commentID+`)" value="저장"/>
//								  </div>
//								</li>`);
										
						
					}
					
					globalOpenComment = true;
					
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
			}else{
				$("#commentList").empty();
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
			
//			$("#commentUpdateContainer_"+commentID).prop('hidden', 'false');
//			$("#commentReadContainer_"+commentID).prop('hidden', 'true');
			
			var content = $("#commentContentRead_"+commentID).text();
			alert(content);
			$("#commentContentUpdate_"+commentID).val(content);
			
			$("#commentUpdateContainer_"+commentID).toggle();
			$("#commentReadContainer_"+commentID).toggle();
			
//			$("#commentUpdateContainer_"+commentID).show();
//			$("#commentReadContainer_"+commentID).hide();
			
			
//			$().attr('value',content);
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
					
					if(result.length > 0){
//						$("#memoContainer").empty();
//						for(var i=0; i<result.length; i++){
//							var title = result[i].title;
//							var div = $("<div id= 'memo_"+result[i].memoID+"' onclick='selectMemo("+result[i].memoID+")'>"+title+"</div>");							
//							$("#memoContainer").append(div);
		
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
		
		//ajax 방식으로 file 업로드하기
		$(document).ready(function(){
	        $(".fileDrop").on("dragenter dragover", function(event){
	            event.preventDefault(); // 기본효과를 막음
	        });
	        // event : jQuery의 이벤트
	        // originalEvent : javascript의 이벤트
	        $(".fileDrop").on("drop", function(event){
	            event.preventDefault(); // 기본효과를 막음
          	            // 드래그된 파일의 정보
	            var files = event.originalEvent.dataTransfer.files;
	            // 첫번째 파일
	            var file = files[0];
	            // 콘솔에서 파일정보 확인
	            console.log(file);

	            // ajax로 전달할 폼 객체
	            var formData = new FormData();
	            // 폼 객체에 파일추가, append("변수명", 값)
	            formData.append("file", file);


	            $.ajax({
	                type: "POST",
	                url: contextPath+"/upload/uploadAjax",
	                data: formData,
	                // processData: true=> get방식, false => post방식
	                dataType: "text",
	                // contentType: true => application/x-www-form-urlencoded, 
	                //                false => multipart/form-data
	                processData: false,
	                contentType: false,
	                success: function(data){
	                    alert(data);
	                    
	                    var str = "";
	                    // 이미지 파일이면 썸네일 이미지 출력
	                    if(checkImageType(data)){ 
	                        str = "<div><a href="+contextPath+"'/upload/displayFile?fileName="+getImageLink(data)+"'>";
	                        str += "<img src='"+contextPath+"/upload/displayFile?fileName="+data+"'></a>";
	                    // 일반파일이면 다운로드링크
	                    } else { 
	                        str = "<div><a href='"+contextPath+"/upload/displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a>";
	                    }
	                    // 삭제 버튼
	                    str += "<span data-src="+data+">[삭제]</span></div>";
	                    $(".uploadedList").append(str);
	                    
	                },
	                error :function(jqXHR,request, error){
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
	                
	            });
	        });
	        
	        
	      
	        
	    });
	
	  function addFilePath(msg){
	        console.log(msg); // 파일명 콘솔 출력
	        document.getElementById("formFile").reset(); // ifream에 업로드결과를 출력 후 form에 저장된 데이터 초기화
	    }
	  
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
						
						
						$("#insideMemoContainer > #CardContainer").empty();
						for(var i=0; i<result.length; i++){
							var title = result[i].title;
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
		
		
		