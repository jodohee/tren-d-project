<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 수정</title>
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
   
    <link href="/trendproject/css/board.css" rel="stylesheet"><!-- css 파일 적용중.. -->
    <script src="/trendproject/js/jquery-3.6.0.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

</style>
<script type="text/javascript">
$(function(){
	$("#ans_submit_btn").click(function(){
		
		alert("aa");
		if($("#qnatitle").val()==""){
			alert("문의 제목을 입력해주세요.");
			$("#qnatitle").focus();
			return false;
		}
		if($("#qnacont").val()==""){
			alert("문의 내용을 입력해주세요.");
			$("#qnacont").focus();
			return false;
		}
		let formdata = $("#ansmodifyfrm").serialize();
		$.ajax({
		       type:"post", 
		       data:formdata, 
		       url:"answerModifySave.do",
		       datatype:"json", 
		       success:function(data) {
		    	   if( data.result == "0" ) {
		   			alert("문의 수정이 완료되었습니다.");
		   			//location.reload;  --> 개인 정보 수정으로 링크
		   		}else if (data.result == "1"){
		   			alert("문의 수정에 실패하였습니다\n관리자에게 문의바랍니다.");
		   		} 
		   	},
		   	error:function() {     
		   		alert("전송실패!");
		   	}
		   });//ajax end
	
		
	});//ans_submit_btn end

	$("#ans_delete_btn").click(function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			let formdata = $("#ansmodifyfrm").serialize();
			$.ajax({
			       type:"post", 
			       data:formdata, 
			       url:"answerDelete.do",
			       datatype:"json", 
			       success:function(data) {
			    	   if( data.result == "0" ) {
			   			alert("문의 삭제 완료");
			   			//location.reload;  --> 개인 정보 수정으로 링크
			   		}else if (data.result == "1"){
			   			alert("문의 삭제 실패");
			   		} 
			   	},
			   	error:function() {     
			   		alert("전송실패!");
			   	}
			   });//ajax end
			
		}
	});//ans_delete_btn ens
	
	
	
	
	
	
});//function end

</script>
<body>

<div class="container">

<%@ include file = "../include/header.jsp"%>
<%@ include file = "../include/nav.jsp"%>

</div>
<main class="container" >
<form name="ansmodifyfrm" id="ansmodifyfrm">
<!-- hidden 값 설정 -->
<input type = "hidden" name="userid" id="userid" value="${vo1.userid }">
<input type = "hidden" name="prounq" id="prounq" value="${vo1.prounq }">
<input type = "hidden" name="qnanum" id="qnanum" value="${vo1.qnanum }">

	<div id="modal" class="answer_Modify">
	<div>
		<h4 class="answer_Modify_title">문의 수정하기</h4>
		<div class="goods_info">
<!-- 제품 번호+제품이름+파일이름 -->
			<img src="product_upload/${provo.profilename }" alt="상품사진" style="width:60px;height:60px;">
			<span>상품명 : ${provo.proname }</span>
		</div>
		<p class="p_text">위 상품에 대한 문의사항을 수정화면입니다.</p>
		<table class="answer_Modify_tbl">
		
		<tr>
			<td>문의유형</td>
		</tr>
		<tr>
			<td>
				<select name="qnacode">
					<option value="">문의유형을 선택해주세요</option>
					<option value="1"
					<c:if test="${vo.qnacode=='1' }">selected</c:if>
					>상품</option>
					<option value="2"
					<c:if test="${vo.qnacode=='2' }">selected</c:if>
					>배송</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>문의 제목</td>
		</tr>
		<tr>
			<td>
				<input style="width:100%;" type="text" id="qnatitle" name="qnatitle" value="${vo.qnatitle }">
			</td>
		</tr>
		<tr>
			<td>문의내용</td>
		</tr>
		<tr>
			<td>
				<textarea id="qnacont" name="qnacont">${vo.qnacont }</textarea>
			</td>
		</tr>
		
		</table>
		<div class="btn_submit2">
			<button class="review_btn" type="button" id="ans_submit_btn" onclik="return false;">수정</button>
			<button class="review_btn" type="button" id="ans_delete_btn">삭제</button>
			<button class="review_btn" type="button" id="modal_close">취소</button>
		</div>
	</div>
</div>
</form>
</main>
 <%@ include file = "../include/footer.jsp"%>


</body>
</html>