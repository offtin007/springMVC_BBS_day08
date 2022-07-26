<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>                                         
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js'></script>  
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>       
<style>
	.ck-editor__editable { height: 200px;}
	.ck-content {font-size: 12px;}
</style>
</head>
<body>
<div class="container d-flex mt-5 justify-content-center">
	<div class="w-75 shadow p-5 rounded border">
		<h3>글쓰기</h3>
		<form method="post" action="<c:url value='register.do'/>">
			<div class="form-group">
				<label for="subject">제목</label>
				<input type="text" class="form-control" id="subject" 
					name="subject" placeholder="글 제목을 입력하세요"/>
			</div>
			<div class="form-group">
				<label for="contents">내용</label>
				<textarea class="form-control" id="contents" 
					name="contents" rows="3"></textarea>
				<script type="text/javascript">
					ClassicEditor.defaultConfig={
						toolbar:{
							items:[
								'heading',
								'|',
								'bold',
								'|',
								'link',
								'|',
								'bulletedList',
								'numberedList',
								'|',
								'indent',
								'|',
								'outdent',
								'|',
								/* 'imageUpload',
								'|', 
								'insertTable',
								'|',*/
								'undo',
								'redo'
							]
						},
						language: "ko"
					};
					CKEDITOR.editorConfig = function(config){
						config.enterMode = CKEDITOR.ENTER_BR
					};
					ClassicEditor.create(document.querySelector('#contents'))
						.catch(error => {
							console.error(error);
						});
				</script>
			</div>
			<div class="form-group">
				<label for="writer">글쓴이</label>
				<input type="text" class="form-control" id="writer" 
					name="writer" placeholder="이름을 입력하세요"/>
			</div>
			<div class="form-group mt-4">
				<button type="submit" class="btn btn-primary">등록</button>
				<button type="button" id="btn-list" class="btn btn-secondary">리스트</button>
			</div>
		</form>

	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn-list").click(() => {
			location.href="<c:url value='list.do?viewPage=${viewPage}'/>";
		})
	});
</script>

</body>
</html>