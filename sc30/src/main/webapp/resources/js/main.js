	var globalTopicID = null;
	var globalMemoID = null;
	
	function createTopic(){
		var topicName = $("#tName").val();
		//alert("create Topic");
		//alert(${teamID});
		var data = {"topicName": topicName, "teamID": teamID};
		//var data = {"topicName": topicName, "teamID": $.cookie("teamID")};
		$.ajax({
			type : "POST", 
			url : "http://localhost:8080/sc30/topic",
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
		
		function topicSelected(topicID){
			globalTopicID = topicID;
			//var data = {"topicID" : topicID};
			alert("topicID: "+topicID);
			$.ajax({
				type: "GET",
				url : "http://localhost:8080/sc30/memo/list/"+topicID,
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
					
						
					var jsonString = JSON.stringify(result);
					var jObject = JSON.parse(jsonString);
					var jLength = jObject.length;
					//alert("length: " + jObject.length);
					
					//alert(jObject[0].memoID);
					//alert(jObject[0].title);
					
					for(var i=0; i<jLength; i++){
						var title = jObject[i].title;
						var div = $("<div id= 'memo_"+i+"' onclick='selectMemo("+jObject[i].memoID+")'>"+title+"</div>");
						$("#memoContainer").append(div);
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
			var createMemoDiv= $("#createMemoDiv");
			createMemoDiv.prop('hidden', false);			
		}
		
		function submitMemo(){		
			var totalInfo = new Object();
			
			totalInfo.title = $("#title_create").val();
			totalInfo.content = $("#content_create").val();
			totalInfo.responsable = $("#responsable_create").val();
			totalInfo.topicID = globalTopicID;
			
			alert("topicMemo");
			console.log(totalInfo);
			//topicID가 여기서 string으로 됨 controller에서 int로 변환이 안됨
			//var jsonInfo =JSON.stringify(totalInfo);
					
			//var data = {"title" : title, "content": content, "responsable" : responsable};
			$.ajax({
				type: "POST",
				url: "http://localhost:8080/sc30/memo",
				data: totalInfo,
				//datatype: "JSON",
				//contentType : "application/json; charset=UTF-8",
				success: function(result, status,xhr){
					//function(data){
			
					alert("memo Created");
					//read로 바꿔놓아야함 - 해당글
					
					//console.log(result);
					//var jsonString = JSON.stringify(result);
					//var jObject = JSON.parse(jsonString);
					//alert(jObject[0].memoID);
					//var data_title = jObject.title;
					//var data_content = obj;
					
					console.log(result);
					
				/* var obj = JSON.parse(json);
					var data_title = obj.title;
					var data_content= obj.content;
					var data_responsable = obj.responsable; */
					/* 
					$("#createMemoDiv").prop('hidden', true);
					$("#readMemoDiv").prop('hidden', false);
					$("#title_read").text(data_title);
					$("#content_read").text(data_content);
					$("#responsable_read").text(data_responsable); */
				},
				error : function(jqXHR,request, error){
					console.log(jqXHR);
					console.log(status);
					console.log(error);
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
				url: "http://localhost:8080/sc30/topic",
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
			alert("topicID"+topicID);
			$.ajax({
				type:"DELETE",
				url:"http://localhost:8080/sc30/topic",
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
				url:"http://localhost:8080/sc30/memo/"+memoID,
				success: function(result, status,xhr){
					alert("memo select success");
					
					var jsonString = JSON.stringify(result);
					var jObject = JSON.parse(jsonString);
					$("#title_read").text(jObject.title);
					$("#content_read").text(jObject.content);
					$("#responsable_read").text(jObject.responsable);
					
					$("#readMemoDiv").prop('hidden', false);
					$("#noMemoDiv").prop('hidden', true);
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
				url:"http://localhost:8080/sc30/memo"+globalMemoID,
				data : totalInfo,
				success: function(){
					$("#readMemoDiv").show();
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
				url:"http://localhost:8080/sc30/memo/"+globalMemoID,
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
		
//		function addComment(){
//			alert("addComment");
//			var readMemoDiv = $("#readMemoDiv");
//			var div = "<div class='commentContainer'></div>"; 
//			var id = "<div class='commentWriter'></div>";
//			var content = "<div class='commentContent'></div>";
//			var updateBtn = "<input type='button' class='commentUpdateBtn' value='수정'/>";
//			var deleteBtn = "<input type='button' class='commentDeleteBtn' value='삭제'/>";
//		
//			readMemoDiv.append(div);
//			
//			$('.commentContainer').append(id);
//			$('.commentContainer').append(content);
//			$('.commentContainer').append(updateBtn);
//			$('.commentContainer').append(deleteBtn);
//		}
		
		function registerComment(){
			var commentText = $("#commentText").val();
			
			alert("text:"+commentText);
			alert("memoID: "+globalMemoID);
			var jObject = new Object();
			jObject.content = commentText;
			
			$.ajax({
				type:"POST",
				url:"http://localhost:8080/sc30/comment/"+globalMemoID,
				data: jObject,
				success: function(result, status,xhr){
					alert("comment created");
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
			$.ajax({
				type:"GET",
				url:"http://localhost:8080/sc30/comment/list/"+globalMemoID,
				data: jObject,
				success: function(result, status,xhr){
					alert("memoList success");
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