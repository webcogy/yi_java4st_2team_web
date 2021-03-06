<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_event.jsp"%>


<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>이벤트</h3>
		<div class="location pc">HOME <span>></span> 이벤트</div>
		
		<div class="longrent_content">
			<div class="board_view">
				<p class="tit">${event.name}</p>
				<p class="date">
					<fmt:formatDate value="${event.startDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.endDate}" pattern="yyyy-MM-dd"/>
				</p>
				<div class="content">
					<div class="event_img"><img src="upload/${event.viewImage}"></div>
				</div>
				<a href="event.do" class="btn_small btn_case2 floatR mt10">목록</a>
				<c:if test="${sessionScope.admin.id eq 'admin'}">
				<a href="eventUpdate.do?code=${event.eventCode}" class="btn_small btn_case2 floatR mt10 mr5">수정</a>
				<a href="eventDelete.do?code=${event.eventCode}" class="btn_small btn_case2 floatR mt10 mr5">삭제</a>
				</c:if>
			</div>
		</div>
		
		<c:if test="${member eq 'nonmember'}">
			<div class="event_popup">
				<div>
					<div>
						<h4>알림</h4>
						<div>
							<p>로그인 후 쿠폰발급이 가능합니다.<br>아래 로그인 버튼을 눌러 로그인 해주세요.</p>
							<ul>
								<li><a href="#" class="btn1 cancle">닫기</a></li>
								<li><a href="login.do" class="btn2 login">로그인</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${member eq 'member'}">
			<div class="event_popup">
				<div>
					<div>
						<h4>알림</h4>
						<div>
							<p>쿠폰을 발급 받으시겠습니까?</p>
							<ul>
								<li><a href="#" class="btn1 cancle">닫기</a></li>
								<li><a href="event_coupon.do?code=${event.eventCode}" class="btn2 login">확인</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${member eq 'coupon_exist'}">
			<div class="event_popup">
				<div>
					<div>
						<h4>알림</h4>
						<div>
							<p>이미 해당 쿠폰을 다운로드 하셨습니다.<br>쿠폰 보관함으로 이동하시겠습니까?</p>
							<ul>
								<li><a href="#" class="btn1 cancle">닫기</a></li>
								<li><a href="coupon.do" class="btn2 login">확인</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${event_end eq 'event_end'}">
			<div class="event_popup">
				<div>
					<div>
						<h4>알림</h4>
						<div>
							<p>이미 종료된 이벤트입니다.</p>
							<ul class="btn_one">
								<li><a href="#" class="btn1 cancle">닫기</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>