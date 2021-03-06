<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_event.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>종료된 이벤트</h3>
		<div class="location pc">HOME <span>></span> 이벤트 <span>></span> 종료된 이벤트</div>
		
		<div>
			<ul class="event_list">
				<c:forEach items="${eventList}" var="event">
					<li><a href="eventView.do?code=${event.eventCode}">
						<img src="upload/${event.thumImage}">
						<p>${event.name}
							<span class="date">
								<fmt:formatDate value="${event.startDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.endDate}" pattern="yyyy-MM-dd"/>
							</span>
						</p>
					</a></li>
				</c:forEach>
			</ul>
			
			<div class="event_no_list">등록된 이벤트가 없습니다.</div>
			
			<c:if test="${sessionScope.admin.id eq 'admin'}">
			<a href="eventWrite.do" class="btn_small btn_case2 floatR mt10">글쓰기</a>
			</c:if>
		</div>
		
		
	</div>

</div><!-- //컨텐츠 -->

<script>
	if ($(".event_list li").length == 0){
		$(".event_list").hide()
		$(".event_no_list").show()
	}
</script>

<%@ include file="/include/footer.jsp"%>