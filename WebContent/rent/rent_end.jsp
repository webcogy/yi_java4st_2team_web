<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/include/header.jsp"%>
<!-- // header -->

<script type="text/javascript">

</script>

<!-- 상단배경 -->
<section class="bgTop bgSub1 pc">
	<div class="slogan">
		<p>
			<strong>동자승 렌터카</strong> 따라올 수 없는 압도적 1등<br> 이제부터 렌트카 예약은
			동자승렌터카입니다.
		</p>
	</div>
</section>
<!-- //상단배경 -->

<section class="con_wrap box">
	<div class="contents_box out padLeft0">
		<div class="contents">
			<h3>단기렌트 차량예약</h3>
			<div class="location pc">
				HOME <span>></span> 단기렌트 <span>></span> 렌트완료
			</div>
			<div class="page_rentEnd">
				<p class="title">차량 예약이 <br>완료 되었습니다.</p>
				
				<div class="carList_wrap">
					<ul class="carList_common">
						<li>
							<div class="left imgBox insertBg">
								<div class="img"><img src="./images/rentcar/${rent.getCarNo().getKind().getCode()}/${rent.getCarNo().getImage()}" alt="${rent.getCarNo().getName()}"></div>
							</div>
							<div class="right textBox">
								<ul class="text">
									<li>
										<div class="left">
											차량 이름
										</div>
										<div class="right">
											${rent.getCarNo().getName()}
										</div>
									</li>
									<li>
										<div class="left">
											렌트 기간
										</div>
										<div class="right">
											<p>
												<span class="c_blue">${fn:split(rent.getRent_date(),'T')[0]}</span>
												<span>${fn:split(rent.getRent_date(),'T')[1]}</span>
												~
												<span class="c_blue">${fn:split(rent.getReturn_date(),'T')[0]}</span>
												<span>${fn:split(rent.getReturn_date(),'T')[1]}</span>
											</p>
										</div>
									</li>
									<li>
										<div class="left">
											보험
										</div>
										<div class="right">
											<p>${rent.getInsCode().getName()}</p>
										</div>
									</li>
									<li>
										<div class="left">
											추가 옵션
										</div>
										<div class="right">
											<p>
												<c:forEach var="opt" items="${optList}">
													<span>${opt}</span>
												</c:forEach>
												<c:if test="${empty optList}">
													선택안함
												</c:if>
											</p>
										</div>
									</li>
									<li>
										<div class="left">
											할인/쿠폰
										</div>
										<div class="right">
											<p>
												<c:choose>
													<c:when test="${evtList==null}">
														선택안함
													</c:when>
													<c:otherwise>
														${evtList.getName()}
													</c:otherwise>
												</c:choose>
											</p>
										</div>
									</li>
									<li class="priceResult">
										<div class="left">
											총 결제 금액
										</div>
										<div class="right">
											 <p>
												 <fmt:formatNumber value="${rent.getFare()}" pattern="#,###,###" /> 원
											 </p>
										</div>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
				<a href="javascript:;" class="btn_kakaotalk btn" onclick="shareKakaotalk(this)" 
						data-carName="${rent.getCarNo().getName()} (${rent.getCarNo().getNo()})" 
						data-date="${fn:split(rent.getRent_date(),'T')[0]} ${fn:split(rent.getRent_date(),'T')[1]} ~ ${fn:split(rent.getReturn_date(),'T')[0]} ${fn:split(rent.getReturn_date(),'T')[1]}"
						data-rentNo="${rent.getRentNo()}">
					<img src="./images/common/kakao.png" alt="카카오톡 공유"> 내 예약정보 공유하기
				</a>
				
				<a href="renting.do" role="button" class="btn btn-primary">내 렌터카 예약현황 보기</a>
				
				<div class="h50"></div>
			</div>
		</div>
	</div>
	<!-- //컨텐츠 -->


	<%@ include file="/include/footer.jsp"%>