<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp"%>
<!-- // header -->

<div id="adimn_content">
	<h2>브랜드 목록</h2>
	<div class="admin_page">
		<form action="brandUpdate.do" method="post"
			enctype="multipart/form-data">
			<table border=1>
				<tr>
					<td><input type="text" value="${brand.name }"></td>
				</tr>
				<tr>
					<td><img src="upload/${brand.image }"></td>
				</tr>
				<tr>
					<td><input type="file" name="uploadfile" class="list_file"></td>
				</tr>
			</table>
			<ul class="button_style3 mt50">
				<li><input type="submit" value="확인" class="btn_small btn_case2"
					id="add"></li>
				<li><a href="brandList.do" class="btn_small btn_case4">취소</a></li>
			</ul>
		</form>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp"%>