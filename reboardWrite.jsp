<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰등록</title>
	<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/blog/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
	<script src="https://kit.fontawesome.com/0be5d50f06.js" crossorigin="anonymous"></script>
	<link href="/trendproject/css/bootstrap.min.css" rel="stylesheet">
	<link href="/trendproject/css/slide.css" rel="stylesheet">
	<link href="/trendproject/css/carousel.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/trendproject/css/blog.css" rel="stylesheet">
   <link rel="stylesheet" href="/myproject2/css/myStyle.css">
    <link href="/trendproject/css/board.css" rel="stylesheet"><!-- css 파일 적용중.. -->
    <script src="/trendproject/js/jquery-3.6.0.js"></script>
</head>
<script type="text/javascript">
$(function(){
	
	$("#reviewWrite").click(function(){
		
		if($("#revcont").val() == ""){
			alert("상품에 대한 리뷰를 작성해주세요.");
			$("#revcont").focus();
			return false;
		}
		var tf = false; /*상태를 체크할 변수*/
		var len = document.reviewWritefrm.revgrade.length;
		for(var i=0; i<len; i++){
			if(document.reviewWritefrm.revgrade[i].checked == true){
				tf = true;
			}
		}/*for문 종료*/	
		if(tf == false){
			alert("만족도가 선택되지 않았습니다.");
			return false;
		}

		let myform = new FormData(document.getElementById('reviewWritefrm'));
		$.ajax({  // ajax :: 비동기전송방식
			data:myform, 
			url :"reviewWriteSave.do",
			type:"post",
			
			
			processData: false, // 물리적 파일을 전송하는 경우의 설정
	      	contentType: false, // 물리적 파일을 전송하는 경우의 설정
			
	      	datatype:"json",    // -->> data={"result":"0"}
			success:function(data) {
				if(data.result == "0") {
					alert("리뷰가 저장되었습니다.");
					//location="";
				} else if(data.result == "1") {
					alert("리뷰가 저장에 실패하였습니다!");
				}
			},
			error:function() { 
				alert("전송실패!");
			}
		});//ajax end
       
       
	});//reviewWrite_btn end
	
	
});//function end


</script>
<body>

<div class="container">

<%@ include file = "../include/header.jsp"%>
<%@ include file = "../include/nav.jsp"%>

</div>
<main class="container" >
	<div class="review_write">
		<h4 class="review_write_title">상품리뷰등록</h4>
		<p class="review_msg">구매하신 상품에 대한 솔직한 평가를 적어주세요</p>
<form name="reviewWritefrm" id="reviewWritefrm" enctype="multipart/form-data">
		<table class="review_write_tbl">
			<colgroup>
				<col width="30%"/>
				<col width="*"/>
			</colgroup>
			<tr>
				<th>사진<br><font style="font-size:12px;color:#454545;">(사진은 최대 4장까지 업로드 가능)</font></th>
				<td>
					<input name="file1"  type="file" value="사진업로드"  class="form-control">
					<input name="file2"  type="file" value="사진업로드" class="form-control">
					<input name="file3"  type="file" value="사진업로드" class="form-control">
					<input name="file4"  type="file" value="사진업로드" class="form-control"> 
				</td>
			</tr>
			<tr>
				<th>작성자아이디</th>
				<td>
					<input type="text" name="userid" value="${userid }" readonly>
				</td>
			</tr>
			<tr>
			<tr>
				<th>상품리뷰</th>
				<td>
					<textarea class="ip" id="revcont" name="revcont"></textarea>
				</td>
			</tr>
			<tr>
				<th>만족도</th>
				<td>
					<input name="revgrade" class="rd" type="radio" value="1"> 1점
					<input name="revgrade" class="rd" type="radio" value="2"> 2점
					<input name="revgrade" class="rd" type="radio" value="3"> 3점
					<input name="revgrade" class="rd" type="radio" value="4"> 4점
					<input name="revgrade" class="rd" type="radio" value="5"> 5점
				</td>
			</tr>
		</table>
		
		<div class="btn_submit">
			<button class="review_btn" id="reviewWrite" type="submit" onclick="return false;">저장</button>
			<button class="review_btn" type="reset">취소</button>
		</div>
</form>	
		
	</div>
</main>
 <%@ include file = "../include/footer.jsp"%>


</body>
</html>