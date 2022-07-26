<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>                                         
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>       
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="${ctx}/resources/js/reply.js"></script>
<!-- 즉시 실행함수 테스트 -->
<script type="text/javascript">
/* 	$(document).ready(function(){
		console.log(replyFunc);
	}) */

	console.log("===========");
	console.log("JS 등록 테스트");
	
	var bidVal = '<c:out value="${board.bid}"/>';
	
	// 등록 처리 테스트
/* 	console.log(replyFunc);
	replyFunc.register(
		{reply_contents:"JS TEST", replyer:"tester", bid:bidVal}
		,
		function(result){
			alert("Result : " + result);
		}
	) */
	
	// 댓글 리스트 가져오기 테스트
/*  	replyFunc.getList(
		{bid:bidVal}, function(list){
			for(var i = 0, len=list.length || 0; i<len; i++){
				console.log(list[i]);
			}
		}		
	); */

	// 댓글 삭제
/* 	replyFunc.remove(6, function(cnt){
		console.log(cnt);
		
		if(cnt === "success"){
			alert("삭제 성공!!")
		}
	});
 */
 	// 댓글 수정 테스트
/*  	replyFunc.update(
 		{rno:8, reply_contents:"수정 수정 수정...."},
 		function(result){
 			alert("수정 완료!!!");
 		}
 	); */
 
 
 	// 특정 댓글 조회
/*  	replyFunc.get(10, function(data){
 		console.log(data);
 	}); */
</script>         
         
</head>
<body>
<div class="container d-flex mt-5 justify-content-center">
	<div class="w-75 shadow p-5 rounded border">
		<h3>글상세보기</h3>
		<div class="d-flex justify-content-between">
			<div class="form-group">
				<label for="subject">번호</label>
				<input type="text" class="form-control" id="bid" 
					name="bid" disabled value="${board.bid}"/>
			</div>
			<div class="form-group px-2">
				<label for="writer">글쓴이</label>
				<input type="text" class="form-control" id="writer" 
					name="writer" disabled value="${board.writer}"/>
			</div>
			<div class="form-group">
				<label for="hit">조회수</label>
				<input type="text" class="form-control" id="hit" 
					name="hit" disabled value="${board.hit}"/>
			</div>
		</div>
		
		<div class="form-group">
			<label for="subject">제목</label>
			<input type="text" class="form-control" id="subject" 
				name="subject" disabled value="${board.subject}"/>
		</div>

		<div class="form-group">
			<label for="contents">내용</label>
			<textarea class="form-control" id="contents" 
				name="contents" rows="4" disabled><c:out value="${board.contents}" escapeXml="false"/></textarea>
		</div>
		<div class="form-group mt-4">
			<button type="submit" id="btn-modify" class="btn btn-primary me-2">수정하기</button>
			<button type="button" id="btn-list" class="btn btn-primary">리스트</button>
		</div>
		<!-------------------- 댓글 UI ------------------>
		<div class="mt-5 d-flex justify-content-between mb-2">
			<h6 class=""><i class="fa fa-comments-o"></i> 댓글</h6>
			<button id="btn-addReply" class="btn btn-sm btn-outline-secondary">새댓글</button>
		</div>
		
		<ul class="m-0 p-0 reply" style="list-style:none">
			<li class="mb-2">
				<div class="form-control">
					<div class="d-flex justify-content-between">
						<h6><b>홍길동</b></h6><span>2022-07-14 16:02</span>
					</div>
					<p>댓글 테스트 입니다.....</p>
				</div>
			</li>
			<li>
				<div class="form-control">
					<div class="d-flex justify-content-between">
						<h6><b>홍길동</b></h6><span>2022-07-14 16:02</span>
					</div>
					<p>댓글 테스트 입니다.....</p>
				</div>
			</li>
		</ul>
		
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		/// 댓글 리스트 ///
		var bidValue = "<c:out value='${board.bid}'/>";
		
		var rUL = $(".reply");
		
		displayList();
		
		function displayList(){
			replyFunc.getList(
				{bid:bidValue}, function(list){
					console.log('list: '+ list);
					
					var str= "";
					
					
					if(list == null || list.length == 0){
						rUL.html("");
						return;
					}
					
					for(var i = 0, len = list.length || 0; i < len; i++){
						str +='<li class="mb-2"><div class="form-control">'
							+'<div class="d-flex justify-content-between"><h6><b>'
							+list[i].replyer+'</b></h6>';
						str +='<span>'+list[i].reply_date+'</span></div>';
						str +='<p>'+list[i].reply_contents+'</p></div></li>'
					}
					
					rUL.html(str);
				});
		} // displayList
		
		
		$("#btn-list").click(() => {
			location.href="<c:url value='/list.do?viewPage=${viewPage}&searchType=${bvo.searchType}&keyWord=${bvo.keyWord}'/>";
		})
		
		$("#btn-modify").click(() => {
			location.href="<c:url value='/modify.do?bid=${board.bid}&viewPage=${viewPage}&searchType=${bvo.searchType}&keyWord=${bvo.keyWord}'/>";
		})
	});
</script>

</body>
</html>