<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" 	   uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
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
   <link href="/trendproject/css/board.css" rel="stylesheet">
    
    <script src="/trendproject/js/jquery-3.6.0.js"></script>
</head>

<script>
$(function(){
  
	$("#answer_submit").click(function(){
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
		
		//ajax
		let formdata = $("#ansform").serialize();
		$.ajax({
       type:"post", 
       data:formdata, 
       url:"answerWriteSave.do",
       datatype:"json", 
       success:function(data) {
    		if( data.result == "0" ) {
    			alert("문의 저장성공");
    			location="goodsDetail.do";
    		}else if (data.result == "1"){
    			alert("문의 저장 실패");
    		} 
    	},
    	error:function() {     
    		alert("전송실패!");
    	}
       });//ajax end
       
		$("#modal").css('display',"none");
		$("#modal_bak").css('display',"none");
		
		//스크롤 활성화
		document.body.style.position = '';
		document.body.style.width = '';
		document.body.style.top = '';
		document.body.style.overflowY = '';
		window.scrollTo(0, prevScrollY);
		
	});//answer_submit end
});//function end
//문의 게시판 펼침
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
//answer 초기 설정 1페이지
$(document).ready(function(){
    // 초기 페이지 로딩 시 AJAX 요청을 보냅니다.
    $.ajax({
        url: 'answerList.do', // 데이터를 가져올 URL
        type: 'GET',
        dataType: 'html', // 가져올 데이터 형식
        success: function(response) {
            // 성공적으로 데이터를 가져왔을 때, 해당 데이터를 게시판 컨텐츠에 추가합니다.
            $('#answerpage_content').html(response);
        },
        error: function(xhr, status, error) {
            // 데이터를 가져오지 못했을 때의 처리
            console.error('Failed to load initial page data:', error);
        }
    });
});
//review 초기 설정 1페이지
$(document).ready(function(){
    // 초기 페이지 로딩 시 AJAX 요청을 보냅니다.
    $.ajax({
        url: 'reviewList.do', // 데이터를 가져올 URL
        type: 'GET',
        dataType: 'html', // 가져올 데이터 형식
        success: function(response) {
            // 성공적으로 데이터를 가져왔을 때, 해당 데이터를 게시판 컨텐츠에 추가합니다.
            $('#reviewpage_content').html(response);
        },
        error: function(xhr, status, error) {
            // 데이터를 가져오지 못했을 때의 처리
            console.error('Failed to load initial page data:', error);
        }
    });
});
//추후 수정 필요! ------------------------------------------------------
// 페이지가 로드될 때 초기 페이지를 로드하는 함수
function page_load1(pageNumber) {
    // 현재 스크롤 위치를 저장합니다.
    var scrollTop = window.scrollY;
    
    // AJAX를 통해 해당 페이지의 내용을 가져와서 content div에 업데이트
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'answerList.do?pageIndex=' + pageNumber , true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var answerContentDiv = document.getElementById('answerpage_content');
            // 기존 내용을 제거합니다.
            answerContentDiv.innerHTML = '';
            // 새로운 페이지의 내용을 추가합니다.
            answerContentDiv.innerHTML = xhr.responseText;
            
            // 페이지 내용이 업데이트된 후에 스크롤 위치를 변경합니다.
            window.scrollTo(0, scrollTop);
        }
    };
    xhr.send();
}
function page_load2(pageNumber) {
    // 현재 스크롤 위치를 저장합니다.
    var scrollTop = window.scrollY;
    
    // AJAX를 통해 해당 페이지의 내용을 가져와서 content div에 업데이트
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'reviewList.do?pageIndex=' + pageNumber , true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            document.getElementById('reviewpage_content').innerHTML = xhr.responseText;
            
            // 페이지 내용이 업데이트된 후에 스크롤 위치를 변경합니다.
            window.scrollTo(0, scrollTop);
        }
    };
    xhr.send();
}

</script>
<body>

<div class="container">

<%@ include file = "../include/header.jsp"%>
<%@ include file = "../include/nav.jsp"%>

</div>
<main class="container" style="height:600px;">
	<div class="cate">카테고리 > 가방 </div>
	<div class="content_box">
		<div class="content_img">
			<span style="font-size:26px;color:#454545;"><</span>
			<img src="/trendproject/images/goodsimg/celine1.PNG" alt="상품이미지" style="width:300px;height:500px;">
			 <span style="font-size:26px;color:#454545;">></span>
		</div>
	
		<div class="content_tbl">
			<div class="p_container">
			<span class="p_text">CELINE</span> <!-- 카테고리 표시 -->
				<p class="icon_p">
				<!-- 찜 -->
					<img src="/trendproject/images/board/hart_icon.png" alt="하트">
				<!-- 공유 -->
					<img src="/trendproject/images/board/share_icon.png" alt="공유" style="margin-left:15px;">
				</p> 
			</div>
	<!-- 상품 정보 등록 -->		
			<p>셀린느 체인 인 트리오페 캔버스 램스킨 핸드백 24SS 10E382CBX.04LU</p>
			<p>해외배송 ★5(1)</p>
			<p style="font-size:18px;color:#9900cc;">37% <span style="color:#ccc;text-decoration:line-through"> 1,623,800</span></p>
			<p style="font-size:20px;font-weight:bold;color:#000;margin-left:20px;">1,217,910원</p>
			<select name="size">
			
				<option value="" selected>옵션(가방)</option>
			
			</select>
	<!-- 링크 걸기 -->
			<button type="button" class="pay_btn" id="">구매하기</button>
			<button type="button" class="basket_btn" id="">장바구니</button>
			<button type="button" class="shar_btn" id="">셔플하기</button>
		</div>
		
	
	</div>
</main>

<div class="line"></div>
<main class="container">
<!-- 싱품 상세 내용 -->

	<div class="pay_tbl">
		<h3 class="pay_title">구매 정보</h3>
		<table>
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
			<tr>
				<th>배송비</th>
				<td>전상품 무료배송(대형가구와 같은 대형 상품 제외)</td>
				<th>배송 예정일</th>
				<td>8~10일 이내</td>
			</tr>
			<tr>
				<th>관부가세</th>
				<td>관부가세 없음</td>
				<th>반품/교환</th>
				<td>반품/교환 가능</td>
			</tr>
			<tr>
				<th>B머니 적립</th>
				<td>최대 786원 적립</td>
				<th>결제 혜택</th>
				<td><a href="#">페이코 최대 4만원 즉시 할인></a></td>
			</tr>
			<tr>
				<th>결제안내</th>
				<td><a href="#">4월 무이자 카드 할부 안내></a></td>
				<td colspan="2" style="text-align:center;"><a href="#">카드 할인 혜택 더보기></a></td>
				
			</tr>
		</table>
	</div>

	<div class="pay_tbl">
		<h3 class="pay_title">상품 정보</h3>
		<table>
		<colgroup>
			<col width="50%"/>
			<col width="*"/>
			
		</colgroup>
			<tr>
				<th>상품코드</th>
				<td>74790180</td> <!-- 상품번호 정보 기입 -->
				
			</tr>
			<tr>
				<th>상품명</th>
				<td>여성 흰색 가방</td>
				
			</tr>
			<tr>
				<th>상세정보</th>
				<td>상품고시정보</td>
				
			</tr>
			
		</table>
	</div>

<div class="goods_Detail_box">
<!-- 상품 상세 설명 페이지 공간 -->








</div>

</main>
<div class="line"></div>
	<!-- 리뷰게시판 -->
<main class="container">
<div id="reviewpage_content">
<%@include file = "reboardList.jsp" %>
</div>
</main>

<!-- 문의 게시판 -->
<div class="line"></div>
<main class="container">
<div id="answerpage_content">
<%@include file="answerboard.jsp" %>
</div>
</main>
<!-- 문의 게시판 -->

<div class="line"></div>
<main class="container">
	<!-- 안내?? -->
	<table class="pay_tbl1">
	<colgroup>
			<col width="*"/>
			<col width="3%"/>
	</colgroup>
	<tr>
		<td><a class="tbl_a" href="#">상품 고시 정보</a></td>
		<td>></td>
	</tr>
	<tr>
		<td><a class="tbl_a" href="#">배송 안내</a></td>
		<td>></td>
	</tr>
	<tr>
		<td><a class="tbl_a" href="#">교환 / 환불 안내</a></td>
		<td>></td>
	</tr>
	<tr>
		<td><a class="tbl_a" href="#">4월 무이자 카드 할부 안내</a></td>
		<td>></td>
	</tr>
</table>
	<div style="margin-top:70px;">  
		<%@ include file = "../include/footer.jsp"%>
	</div>
</main>

</body>
</html>