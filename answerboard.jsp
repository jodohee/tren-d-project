<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

</head>

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

</style>
<script>
//상품 문의하기 모달창
var cnt = 0;
$(".mun_btn").click(function(){
	$("#modal").css('display',"block");
	$("#modal_bak").css('display',"block");
	
	
	//스크롤 비활성화
	const currentScrollY = window.scrollY;
	document.body.style.position = 'fixed';
	document.body.style.width = '100%';
	document.body.style.top = -${currentScrollY}px; // 현재 스크롤 위치
	document.body.style.overflowY = 'scroll';
	return currentScrollY;
	
	cnt = 1;
});//modal_open end
$("#modal_close").click(function(){
	$("#modal").css('display',"none");
	$("#modal_bak").css('display',"none");
	
	//스크롤 활성화
	document.body.style.position = '';
	document.body.style.width = '';
	document.body.style.top = '';
	document.body.style.overflowY = '';
	window.scrollTo(0, prevScrollY);
	cnt = 0;
});//modal_open end
</script>

<body>
<c:if test="${total == 0 }"><!-- 게시글이 없으면 보임 -->
	<main class="container">
		<!-- 상품 문의 -->
		<div class="mun_div">
			<p>작성된 문의가 없습니다.</p>
			<button type="button" id="modal_open" class="mun_btn">상품 문의하기</button>
		</div>
	
	</main>
</c:if>
<c:if test="${total > 0 }"><!-- 게시글이 있으면 보임 -->

		<h5 class="answer_title">문의게시판</h5>	
		<div class="btn_answer">
		<button type="button" id="modal_open2" class="mun_btn">문의글쓰기</button>	
		</div>
		<table class="answer_tbl" >
		<colgroup>
			<col width="10%"/>
			<col width="10%"/>
			<col width="*"/>
			<col width="10%"/>
			<col width="15%"/>
		</colgroup>
		
				<tr>
					<th></th>
					<th>문의유형</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
				</tr>
				<c:forEach var="list" items="${list }">
				<tr style="cursor:pointer;">
					<td class="td_cen">${ansnumber }</td>
					<td class="td_cen">${list.qnacode }</td>
					<td class="title_${list.qnanum }" onclick="fn_open('${list.qnanum}')">
						${list.qnatitle }
					</td>	<!-- 제목클릭하면 내용 펼치기 -->
					<td class="td_cen">${list.userid }</td>
					<td class="td_cen">${list.qnadate }</td>
				</tr>
				<tr style="display:none; " class="contents_${list.qnanum }">
					<td></td>
					<td colspan="2" class="detaile" >
					<c:if test='${list.recont==null }'>	
						아직 답변이 없습니다.
					</c:if>
					<c:if test='${list.recont!=null }'>	
						└ <b>[답변]</b> ${list.recont }
					</c:if>
					</td>
					<td>${list.redate }</td>
				</tr>
				<c:set var="ansnumber" value="${ansnumber-1 }"/>
				</c:forEach>
				
				
			</table>
		
		
		
	<c:if test="${total != 0 }">
	<div class="pagging" id="pagging">
	    <c:set var="before" value="${svo.pageStartNo - 1}"/>
	    <c:set var="next" value="${svo.pageLastNo + 1}"/>	
	    
	    <c:if test="${svo.pageIndex != 1 }">
	    <a href="#" onclick="page_load1(1)">[처음]</a> 
	    </c:if>
	    <c:if test="${before > 0}">
	        <a href="#" onclick="page_load1('${before}')">[이전]</a> 
	    </c:if>
	    
	    <c:forEach var="p" begin="${svo.pageStartNo}" end="${svo.pageLastNo}">
	        <c:if test="${p != svo.pageIndex}">
	            <a href="#" onclick="page_load1('${p}')">${p}</a>
	        </c:if>
	        <c:if test="${p == svo.pageIndex}">
	            <span style="font-weight:bold; color:red;">${p}</span>
	        </c:if> 
	    </c:forEach> 
	    
	    <c:if test="${next < svo.totalPageCnt}">
	        <a href="#" onclick="page_load1('${next}')">[다음]</a>
	    </c:if>
	    <c:if test="${svo.pageIndex != svo.totalPageCnt }">
	    <a href="#" onclick="page_load1('${svo.totalPageCnt}')">[마지막]</a>
	    </c:if>
	</div>
	</c:if>
			
	
</c:if>

<!-- answerWrite 모달창 -->
<div id="modal_bak"class="modal_black"></div>
<div id="modal" class="modal_mun">
	<div>
		<h4 class="modal_title">문의하기</h4>
		
<form name="ansform"  id="ansform">
		<table class="mun_modal_tbl">
	
		
		<tr>
		<tr>
			<td>문의제목</td>
		</tr>
		<tr>
			<td>
			<input type="text"  id="qnatitle"name="qnatitle" style="width:100%;">
			</td>
		</tr>
		<tr>
			<td>문의유형</td>
		</tr>
		<tr>
			<td>
			<select name="qnacode" style="width:100%;">
			
				<option value="0">-- 유형 --</option>
				<option value="1">회원관련</option>
				<option value="2">주문/결제</option>
				<option value="3">상품/배송</option>
				<option value="4">취소/교환/환불</option>
				<option value="5">중고</option>
				<option value="6">셔플</option>
				<option value="7">기타</option>
				
			</select>
			</td>
		</tr>
		<tr>
			<td>문의내용</td>
		</tr>
		<tr>
			<td>
				<textarea name="qnacont" id="qnacont"></textarea>
			</td>
		</tr>
		
		</table>
		
		<div class="btn_submit1">
			<button class="review_btn" type="submit" id="answer_submit"onclick="return false;">저장</button>
			<button class="review_btn" type="button" id="modal_close">닫기</button>
		</div>
</form>
	</div>
</div>

</body>
</html>