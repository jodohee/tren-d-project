<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
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
    <script src="/trendproject/js/jquery-3.6.0.js"></script><!-- jquery -->
</head>

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}


</style>
<script>
function fn_notice(){
	
	location="noticeList.do";
	
}
//tr 클릭시 tr 펼쳐짐 움직임 구현
var cnt = 1;
function fn_open(n){
	
		if(cnt==0){
			$('.contents_'+n).attr('style', "display:none;");
			cnt = 1;
		}else{
			$('.contents_'+n).attr('style', "display:'';");
			cnt = 0;
		}
	
}//fn_open() end
function fn_click(n){
	document.frm.faq_page_no.value = n;
	document.frm.submit();
}


</script>

<body>

<div class="container">

<%@ include file = "../include/header.jsp"%>
<%@ include file = "../include/nav.jsp"%>

</div>

<main class="container">
	<div class="csc_title">
	<h4>고객센터</h4>
	</div>
	<table class="icon_text_tbl">
	<colgroup>
		<col width="15%"/>
		<col width="30%"/>
		<col width="15%"/>
		<col width="40%"/>
	</colgroup>
	<tr>
		<td>
			<img src="/trendproject/images/board/text_box_icon.png" alt="고객센터">
		</td>
		<td>
			실시간 채팅 상담
		</td>
		
		<td>
			<img src="/trendproject/images/board/clock_icon.png" alt="운영시간">
		</td>
		<td>
			
			운영시간 : 오전 10시 ~ 오후 5시<br>
			점심시간 : 오후 12시 ~ 오후 1시<br>
			(주말/공휴일 휴무)
			
		</td>
	</tr>
	</table>
	
	<div class="text_div">
		<ul>
			<li>상품 페이지 하단의 [상품 문의] 또는 마이페이지에서 [판매자 문의]를 통해 문의를 남겨 보세요.</li>
			<li>판매자로부터 더욱 정확하고 빠른 답변을 받으실 수 있습니다.</li>
			<li>판매자 연락처는 구매완료 후 주문상세에서 확인 가능합니다.</li>
		</ul>
	</div>
	<div class="tap_tbl">
		<button type="button" class="tap_1" style="background:#454545; color:#fff;">자주 찾는 질문</button>
		<button type="button" class="tap_2" onclick="fn_notice();">공지사항</button>
	</div>
	<form name="frm">
	<input type="hidden" name="faq_page_no" value="">
	<table class="list_tbl" >
	
		<colgroup>
			<col width="10%"/>
			<col width="20%"/>
			<col width="*"/>
		</colgroup>
	
	<tr>
		<td colspan="3">
		
			<a href="#" onclick="fn_click('0')">전체보기</a>
			<a href="#" onclick="fn_click('1')">회원</a>
			<a href="#" onclick="fn_click('2')">주문/결제</a>
			<a href="#" onclick="fn_click('3')">상품/배송</a>
			<a href="#" onclick="fn_click('4')">취소/교환/환불</a>
			<a href="#" onclick="fn_click('5')">중고</a>
			<a href="#" onclick="fn_click('6')">셔플</a>
			<a href="#" onclick="fn_click('7')">기타</a>
		
		</td>
	</tr>
		<tr>
			<th></th>
			<th>유형</th>
			<th>질문</th>
		</tr>
		<c:forEach var="list" items="${list }">
		<tr style="cursor:pointer;" onclick="fn_open('${list.faqnum}')">
			<td>${number }</td>
			<td style="text-align:center;">${list.faqcode }</td>
			<td class="title_${list.faqnum}" >${list.faqtitle }</td>
		</tr>
		<tr class="contents_${list.faqnum}" style="display:none;">
			<td colspan="3" style="padding:10px 0px 10px 100px;" >
				└ ${list.faqans }
			</td>
		</tr>
		<c:set var="number" value="${number-1 }"/>
		</c:forEach>
	</table>
	</form>
<c:if test="${total>0 }">
	<div class="pagging">
		<c:set var="before" value="${firstPno-1 }"/>
		<c:set var="next" value="${lastPno+1 }"/>
		<c:if test="${pageIndex != 1}">	
		<a href ="faqList.do?pageIndex='1'&faq_page_no=${tap }">[처음]</a>
		</c:if>
		<c:if test="${firstPno > 1 }">
		<a href ="faqList.do?pageIndex=${lastPno-1 }&faq_page_no=${tap }">[이전]</a>
		</c:if>
			<c:forEach var="p" begin="${firstPno }" end="${lastPno }" >
		
				<c:if test="${pageIndex == p }">
				<b><font color="red">${p }</font></b>
			</c:if>
			<c:if test="${pageIndex != p }">
			<!--<a href="uploadList.do?pageIndex=${p }">${p }</a> get방식 전송-->
			<a href="faqList.do?pageIndex=${p }&faq_page_no=${tap }">${p }</a>  <!-- post방식 전송 -->
			</c:if>
			
		</c:forEach>
		<c:if test="${lastPno < totalPage }">
		<a href ="faqList.do?pageIndex=${lastPno+1 }&faq_page_no=${tap }">[다음]</a>
		</c:if>
		<c:if test="${pageIndex != totalPage }">
		<a href ="faqList.do?pageIndex=${totalPage }&faq_page_no=${tap }">[마지막]</a>
		</c:if>
	</div>
</c:if>
</main>
 <%@ include file = "../include/footer.jsp"%>


</body>
</html>