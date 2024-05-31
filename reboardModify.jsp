<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰수정</title>
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
</head>
<script type="text/javascript">
function fn_fileDelete(a,b) {
	
	let mydata = "revnum="+a+"&revfilename="+b;
	
	if( !confirm("정말 삭제 하시겠습니까?") ) {
		return false;
	}
	
	$.ajax({  // ajax :: 비동기전송방식
		data:mydata, 
		url :"reviewFileDelete.do",
		type:"post",

      	datatype:"json",    // json
		success:function(data) {
			if(data.result == "0") {
				alert("파일이 삭제가 완료되었습니다.");
				//location="";
				location.reload();
			} else if(data.result == "1") {
				alert("파일이 삭제에 실패하였습니다\n관리자에게 문의바랍니다.");
			}
		},
		error:function() { 
			alert("전송실패!");
		}
	});//ajax
	
}//function

$(function(){
	
	$("#reviewmodifySave_btn").click(function(){
	
		let myform = new FormData(document.getElementById('reviewModify'));
		$.ajax({  // ajax :: 비동기전송방식
			data:myform, 
			url :"reviewModifySave.do",
			type:"post",
			
			processData: false, // 물리적 파일을 전송하는 경우의 설정
	      	contentType: false, // 물리적 파일을 전송하는 경우의 설정
			
	      	datatype:"json",    // json
			success:function(data) {     //  let data = {"result":"0"};
				if(data.result == "0") {
					alert("저장이 완료되었습니다.");
					//location="";
				} else if(data.result == "1") {
					alert("저장에 실패하였습니다.!");
				}
			},
			error:function() { 
				alert("전송실패!");
			}
		});//ajax
	});//modifySave_btn
	
	$("#reviewdelete_btn").click(function(){
		if(confirm("정말 삭제하시겠습니까?")){
			let myform = new FormData(document.getElementById('reviewModify'));
			$.ajax({  // ajax :: 비동기전송방식
				data:myform, 
				url :"reviewDelete.do",
				type:"post",
				
				processData: false, // 물리적 파일을 전송하는 경우의 설정
		      	contentType: false, // 물리적 파일을 전송하는 경우의 설정
				
		      	datatype:"json",    // json
				success:function(data) {     //  let data = {"result":"0"};
					if(data.result == "0") {
						alert("삭제가 완료되었습니다.");
						//location="";
					} else if(data.result == "1") {
						alert("삭제가 실패하였습니다.\n관리자에게 문의바랍니다.");
					}
				},
				error:function() { 
					alert("전송실패!");
				}
			});//ajax
		}
	});//reviewdelete_btn
	
});//funtion


</script>
<body>

<div class="container">

<%@ include file = "../include/header.jsp"%>
<%@ include file = "../include/nav.jsp"%>

</div>
<main class="container" >
	<div class="review_write">
		<h4 class="review_write_title">상품리뷰수정/삭제</h4>
		<p class="review_msg">작성했던 리뷰글 수정화면입니다.</p>
<form  name="reviewModify" id="reviewModify"enctype="multipart/form-data">
<!-- hidden -->
<input type="hidden" name="revnum" value="${vo.revnum }">
		<table class="review_write_tbl">
			<colgroup>
				<col width="30%"/>
				<col width="*"/>
			</colgroup>
			<tr>
				<th>사진</th>
				<td>
				<c:set var="files"     value="${fn:split(vo.revfilename,'／') }" />
				<c:set var="hh"        value="${fn:split(img_h,'／') }" />
				<c:set var="files_len" value="${fn:length(files) }" />
				
				<c:set var="cnt" value="0" />
				<c:set var="endcnt" value="4" />
				<c:if test='${vo.revfilename != "" }'>
					<c:forEach var="i" begin="0" end="${files_len-1 }">
						<div style="margin-bottom:3px;">
							<img src="review_upload/${files[i] }" style="width:160px;height:180px;">
							<button class="btn_style" onclick="fn_fileDelete('${vo.revnum}','${files[i] }')"type="button">x</button>
						</div>
						<div style="margin-bottom:10px;">
							<input type="file" name="file${i+1}" 
							   	   class="form-control" style="width:400px;"><!-- 파일명 부여 -->
						</div>
						<c:set var="cnt" value="${cnt+1 }"/>
						<c:set var="endcnt" value="${4-files_len }"/>
					</c:forEach>
				</c:if>
				
				<c:forEach var="i" begin="${cnt }" end="3">
					<input type="file" name="file${i+1}" class="form-control"> <br>
				</c:forEach>
				
				
				</td>
			</tr>
			
			<tr>
				<th>작성자아이디</th>
				<td>
					<input type="text" name="userid" value="test1234" readonly>
				</td>
			</tr>
			<tr>
			<tr>
				<th>상품리뷰</th>
				<td>
					<textarea class="ip" id="revcont" name="revcont">${vo.revcont }</textarea>
				</td>
			</tr>
			<tr>
				<th>만족도</th>
				<td>
					<input name="revgrade" class="rd" type="radio" value="1"
					<c:if test="${vo.revgrade=='1' }">checked</c:if>
					> ★☆☆☆☆
					<input name="revgrade" class="rd" type="radio" value="2"
					<c:if test="${vo.revgrade=='2' }">checked</c:if>
					> ★★☆☆☆
					<input name="revgrade" class="rd" type="radio" value="3"
					<c:if test="${vo.revgrade=='3' }">checked</c:if>
					> ★★★☆☆
					<input name="revgrade" class="rd" type="radio" value="4"
					<c:if test="${vo.revgrade=='4' }">checked</c:if>
					> ★★★★☆
					<input name="revgrade" class="rd" type="radio" value="5"
					<c:if test="${vo.revgrade=='5' }">checked</c:if>
					> ★★★★★
				</td>
			</tr>
		</table>
		<div class="btn_submit">
			<button class="review_btn" id="reviewmodifySave_btn" onclick="return false;" type="submit">수정</button>
			<button class="review_btn" id="reviewdelete_btn" onclick="return false;" type="submit">삭제</button>
			<button class="review_btn" type="reset">취소</button>
		</div>
		
</form>		
	</div>
</main>
 <%@ include file = "../include/footer.jsp"%>


</body>
</html>