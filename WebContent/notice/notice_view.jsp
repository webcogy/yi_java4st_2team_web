<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<!-- // header -->
<%@ include file="/include/sub_notice.jsp"%>


<!-- 컨텐츠 -->
<div class="contents_box padLeft0">
	<div class="contents">
		<h3>공지사항</h3>
		<div class="location pc">HOME <span>></span> 공지사항</div>
		
		<div class="notice_content">
			<div class="board_view">
				<p class="tit">공지사항입니다.</p>
				<p class="date">2020.10.18</p>
				<div class="content">
					 공지사항 내용 글 입니다.
				</div>
				<a href="notice.do" class="btn_small btn_case2 floatR mt10">목록</a>
				<a href="noticeUpdate.do" class="btn_small btn_case2 floatR mt10 mr5">수정</a>
			</div>
		</div>
	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>