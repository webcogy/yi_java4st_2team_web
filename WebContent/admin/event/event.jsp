<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->
<script>
$(function(){
	$("#admin_gnb > ul > li:eq(6)").addClass("on")
	
	if( $(".board").length == 0 ){ // 글이 없는 경우
		$(".no_board").show();
		$(".board").hide();
	}
})
</script>

<div id="adimn_content">
	<h2>이벤트</h2>
	<div class="admin_page">
		<div class="divSearch">
		<form name="frmSearch" action="adminEvent.do" method="post">
			<select name="condition">
				<option value="event_code">코드</option>
				<option value="name">제목</option>
				<option value="is_event">진행 여부</option>
			</select> 
			<input type="text" name="keyword" title="검색어 입력">
			<input type="submit" value="검색">
		</form>
		</div>
		
		<table class="table_style1">
			<!-- 글 있는 경우 -->
			<colgroup>
				<col width="8%">
				<col width="">
				<col width="20%">
				<col width="13%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>코드</th>
				<th>제목</th>
				<th>기간</th>
				<th>금액</th>
				<th>진행 여부</th>
			</tr>
			<c:forEach items="${eventList}" var="event">
			<tr class="board">
				<td>${event.eventCode}</td>
				<td class="tl"><a href="eventView.do?code=${event.eventCode}">${event.name}</a></td>
				<td>
					<fmt:formatDate value="${event.startDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.endDate}" pattern="yyyy-MM-dd"/>
				</td>
				<td><fmt:formatNumber value="${event.sale}"/>원</td>
				<td>
					<c:choose>
						<c:when test="${event.isEvent=='y'}">O</c:when>
						<c:when test="${event.isEvent=='n'}">X</c:when>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
			
			<!-- 글 없는 경우 -->
			<tr class="no_board">
				<td colspan="4">작성된 글이 없습니다.</td>
			</tr>
		</table>
		
		<a href="eventWrite.do" class="btn_small btn_case2 floatR mt10">글쓰기</a>
		
		
		<div class="board_list_page clear">
			<a href="adminEvent.do?nowPage=1" class="first arrow"><span class="text_hidden">처음</span></a>
			<c:if test="${paging.nowPage != 1}">
				<a href="adminEvent.do?nowPage=${paging.nowPage-1}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<c:if test="${paging.nowPage == 1}">
				<a href="adminEvent.do?nowPage=${paging.nowPage}" class="prev arrow"><span class="text_hidden">이전</span></a>
			</c:if>
			<ul>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="active"><a>${p}</a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li><a href="adminEvent.do?nowPage=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
			
			<c:if test="${paging.nowPage != paging.lastPage}">
				<a href="adminEvent.do?nowPage=${paging.nowPage+1}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<c:if test="${paging.nowPage == paging.lastPage}">
				<a href="adminEvent.do?nowPage=${paging.nowPage}" class="next arrow"><span class="text_hidden">다음</span></a>
			</c:if>
			<a href="adminEvent.do?nowPage=${paging.lastPage}" class="end arrow"><span class="text_hidden">마지막</span></a>
		</div>
	</div>
</div>


<script>
	function event_is_event(){
		$(".divSearch").append('<p class="progress_txt">[<span>진행 예정</span>] [<span>진행 중</span>] [<span>진행 완료</span>]로 검색해주세요.</p>')		
	}
	$(".divSearch select").change(function(){
		if ($(this).val() == "is_event"){
			event_is_event()
		} else {
			$(".divSearch p:last").remove()
		}
	})
	
	$(document).on("click", ".progress_txt span", function(){
		$(".divSearch input[name=keyword]").val($(this).text())
	})
</script>

<c:if test="${method eq 'post'}">
	<input type="hidden" name="post_condition" value="${condition}">
	<input type="hidden" name="post_keyword" value="${keyword}">
	
	<script>
		$(document).ready(function(){
			$(".divSearch select").val($("input[name=post_condition]").val())
			$(".divSearch input[name=keyword]").val($("input[name=post_keyword]").val())
			
			if ($(".divSearch select").val() == "is_event"){
				event_is_event()
			}
			
			$(".board_list_page a").click(function(){
				var href = $(this).attr("href");
				var hrefArray = href.split('=');
				
				$(".divSearch form").append('<input type="hidden" name="nowPage" value="'+ hrefArray[1] +'">')
				$(".divSearch form").submit();
				return false;
			})
		})
	</script>
</c:if>




<%@ include file="/admin/include/footer.jsp"%>