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
    <script src="/trendproject/js/jquery-3.6.0.js"></script>
</head>
<style>

</style>
<script>
function fn_search(){
	document.searchfrm.method="post";
	document.searchfrm.action="noticeList.do";
	document.searchfrm.submit();
}

function fn_notice(){
	
	location="faqList.do";
	
}
//미완)!! 추후에 테이블 순서 클레스 순번에 변수 사용하기 _1 < 반복문 순서 같이 대입...
$(function(){
	
});//function end

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
		<button type="button" class="tap_1" onclick="fn_notice();">자주 찾는 질문</button>
		<button type="button" class="tap_2"style="background:#454545; color:#fff;">공지사항</button>
	</div>

	<table class="list_tbl" >
	
		<colgroup>
			<col width="5%"/>
			<col width="*"/>
			<col width="20%"/>
		</colgroup>
	
		<tr>
			<th colspan="2">제목</th>
			<th>작성일자</th>
		</tr>
		
		<c:forEach var="list" items="${list }">
		<tr class="title_${list.noticenum }" style="cursor:pointer;" onclick="fn_open('${list.noticenum}')">
			<td>${number }</td>
			<td>${list.noticetitle } 
			<c:if test="${list.noticestate=='1' }">	
				&nbsp;<img src="/trendproject/images/board/icon_stress.jpg" width="20"height="20">
			</c:if>
			</td>
			<td style="text-align:center;">${list.noticedate }</td>
		</tr>
		<tr class="contents_${list.noticenum }" style="display:none;">
			<td colspan="3" style="padding:10px 0px 10px 50px;">
				${list.noticecont }
				
			</td>
		</tr>
		<c:set var="number" value="${number-1 }"/>
		</c:forEach>
		
		
	</table>
	<div class="search">
		<form name="searchfrm">
		<select name="searchCondition" style="width:80px;">
			<option value="noticetitle"
			<c:if test="${searchCondition=='noticetitle' }">selected</c:if>
			>제목</option>
			<option value="noticecont"
			<c:if test="${searchCondition=='noticecont' }">selected</c:if>
			>내용</option>
		</select>
		<input style="padding:5px;" type="text" name="searchKeyword" value="${searchKeyword }">
		<button type="submit" class="basket_btn1"onclick="fn_search()">검색</button>
		</form>
	</div>
<c:if test="${total > 0 }">
	<div class="pagging">
		
		<c:set var="before" value="${firstPno-1 }"/>
		<c:set var="next" value="${lastPno+1 }"/>	
		<c:set var="search" value="searchKeyword=${searchKeyword }" />
		<c:if test="${pageIndex != 1}">
		<a href="noticeList.do?pageIndex=1&${search }">[처음]</a> 
		</c:if>
		<c:if test="${before > 0  }">
		<a href="noticeList.do?pageIndex=${before }&${search }">[이전]</a> 
		</c:if>
		
		<c:forEach var="p" begin="${firstPno }" end="${lastPno }">
			<c:if test="${p != pageIndex }">
				<a href="noticeList.do?pageIndex=${p }&${search }">${p }</a>
			</c:if>
			<c:if test="${p == pageIndex }">
				<span style="font-size:13px;
							 font-weight:bold;
							 color:red;">${p }</span>
			</c:if> 
		</c:forEach> 
		
		<c:if test="${next < totalPage }">
		<a href="noticeList.do?pageIndex=${next }&${search }">[다음]</a>
		</c:if>
		<c:if test="${pageIndex != totalPage }">
		<a href="noticeList.do?pageIndex=${totalPage }&${search }">[마지막]</a>
		</c:if>		

	</div>
</c:if>
</main>
 <%@ include file = "../include/footer.jsp"%>


</body>
</html>