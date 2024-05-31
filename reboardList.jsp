<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>
// VO 나누면서 기능 깨짐 (수정 ok)
function fn_DetailOpen(n) {
    $("#revnum").val(n);
    $.ajax({
        type: "GET",
        url: "reviewDetail.do",
        dataType: "json",
        data: { revnum: n },
        success: function(data) {
            if (data.result === "0") {
                // 모달 열기
                $("#modalDetail").show();
                $("#modalDetail_bak").show();
                
                // 리뷰 상세 정보 표시
                var vo1 = data.vo1;
                var img_h = data.img_h;
                $("#review_photo").empty();
                if (vo1.revfilename !== "") {
                    var files1 = vo1.revfilename.split("／");
                    for (var i = 0; i < files1.length-1; i++) {
                        var imgTag = "<img src='review_upload/" + files1[i] + "' style='width:200px;height:210px;'>";
                        $("#review_photo").append(imgTag);
                    }
                }
                $("#review_grade").text(vo1.revgrade + "점");
                $("#review_content").text(vo1.revcont);
                $("#review_writer").text(vo1.nickname);
                $("#review_date").text(vo1.revdate);
                
                // 스크롤 방지 적용
                $('.container').on('scroll touchmove mousewheel', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    return false;
                });
            }
        },
        error: function(error) {
            alert("전송실패");
        }
    });
}

// 모달 닫기
$("#btn_close, .btn_close").click(function(){
    $("#modalDetail").hide();
    $("#modalDetail_bak").hide();
    // 스크롤 방지 풀기
    $('.container').off('scroll touchmove mousewheel');
});
</script>
<body>

<c:if test="${retotal == 0 }"><!-- 게시글이 없으면 보임 -->
	<main class="container">
		
		<div class="mun_div">
			<p>작성된 리뷰가 없습니다.</p>	
		</div>
	</main>
</c:if>
<c:if test="${retotal > 0 }">
<div>
	<table class="review_tbl">
	<tr>
			<td>
				<div class="review_top">
					<h5 class="review_title">상품 리뷰</h5>
					<div><span class="star">전체 ${total }개의 리뷰 평균 ${avg }점 
					<c:forEach begin="1" end="${avg }" >
							<img src="/trendproject/images/board/star1.PNG" width="25"height="25"style="margin-right:-10px;">
						</c:forEach>
						<c:set var="avg1" value="${avg }"/>
						<c:if test="${avg>3&&avg<4 }">
							<img src="/trendproject/images/board/star3.PNG" width="25"height="25"style="margin-right:-10px;">
							<c:set var="avg1" value="${avg+1 }"/>
						</c:if>
						<c:forEach begin="${avg1 }" end="4" >
							<img src="/trendproject/images/board/star2.PNG" width="25"height="25"style="margin-right:-10px;">
						</c:forEach>
					</span></div>
				</div>
			</td>
		</tr>
		
	<c:forEach var="list" items="${list }">
		
		<tr>
			<td>
			
				<p style="cursor:pointer;" class="reviewDetail" onclick="fn_DetailOpen('${list.revnum}')">
				<c:set var="files" value="${fn:split(list.revfilename,'／') }" />
				<c:set var="hh" value="${fn:split(img_h,'／') }" />
				<c:set var="files_len" value="${fn:length(files) }" />

				<c:if test='${list.revfilename != "" }'>

				<c:forEach var="i" begin="0" end="${files_len-1 }">
				<img src="review_upload/${files[i] }"  style="width:120px;height:160px;">
				</c:forEach>
			
			</c:if>
				
				</p>
				<p class="star">${list.revgrade }점 
					<c:forEach begin="1" end="${list.revgrade}" >
						<img src="/trendproject/images/board/star1.PNG" width="15"height="15"style="margin-right:-10px;">
					</c:forEach>
					<c:forEach begin="${list.revgrade}" end="4" >
						<img src="/trendproject/images/board/star2.PNG" width="15"height="15"style="margin-right:-10px;">
					</c:forEach>
				</p>
				<p style="cursor:pointer;" class="reviewDetail">${list.revcont }</p>
				<p style="color:#454545;">${list.nickname } | ${list.revdate }</p>
					
				
				</td>
			</tr>
		</c:forEach>
	
		</table>
		
	</div>
</c:if>
	<c:if test="${retotal > 0 }">
	<div class="pagging" id="pagging">
	    <c:set var="before" value="${svo.pageStartNo - 1}"/>
	    <c:set var="next" value="${svo.pageLastNo + 1}"/>	
	    
	    <c:if test="${svo.pageIndex != 1 }">
	    <a href="#" onclick="page_load2(1)">[처음]</a> 
	    </c:if>
	    <c:if test="${before > 0}">
	        <a href="#" onclick="page_load2('${before}')">[이전]</a> 
	    </c:if>
	    
	    <c:forEach var="p" begin="${svo.pageStartNo}" end="${svo.pageLastNo}">
	        <c:if test="${p != svo.pageIndex}">
	            <a href="#" onclick="page_load2('${p}')">${p}</a>
	        </c:if>
	        <c:if test="${p == svo.pageIndex}">
	            <span style="font-weight:bold; color:red;">${p}</span>
	        </c:if> 
	    </c:forEach> 
	    
	    <c:if test="${next < svo.totalPageCnt}">
	        <a href="#" onclick="page_load2('${next}')">[다음]</a>
	    </c:if>
	    <c:if test="${svo.pageIndex != svo.totalPageCnt }">
	    <a href="#" onclick="page_load2('${svo.totalPageCnt}')">[마지막]</a>
	    </c:if>
	</div>
	</c:if>

<!-- 모달 리뷰 상세 페이지 -->
<div class="modalDetail_bak" id="modalDetail_bak" style="display:none;"></div>
<div class="modalDetail" id="modalDetail" style="display:none;">
    <div class="btn_align">
        <button type="button" class="btn_X" id="btn_close">X</button>
    </div>
    <h4 class="h_title">상세페이지</h4>
    <table class="modalDetail_tbl">
        <colgroup>
            <col width="15%"/>
            <col width="*"/>
        </colgroup>
        <tr>
            <th>사진</th>
            <td id="review_photo"></td>
        </tr>
        <tr>
            <th>별점</th>
            <td id="review_grade"></td>
        </tr>
        <tr>
            <th>리뷰</th>
            <td id="review_content"></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td id="review_writer"></td>
        </tr>
        <tr>
            <th>작성일자</th>
            <td id="review_date"></td>
        </tr>
    </table>
    <div class="btn_div">
        <button type="button" class="btn_close">창닫기</button>
    </div>
</div>
<form name="reviewDetailfrm" id="reviewDetailfrm">
<input type="hidden" name="revnum" value="">
</form>
</body>
</html>
