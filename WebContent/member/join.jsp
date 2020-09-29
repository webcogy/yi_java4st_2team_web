<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>

<script>
function TypeCheck (s, spc) { 
	var i; 

	for(i=0; i< s.length; i++) { 
		if (spc.indexOf(s.substring(i, i+1)) < 0) { 
			return false; 
		} 
	} 
	return true; 
} 
</script>

<script>
function id_chk_bb() {
	document.frmName.id_chk.value="";
}

function Member_ID_CHK() {

	function Member_YorN() {

		var NUMBER = "1234567890"; 
		//var SPECIAL = "-_"; 
		var SPECIAL = ""; 
		var SALPHA = "abcdefghijklmnopqrstuvwxyz"; 
		var ALPHA = SALPHA+NUMBER+SPECIAL; 
		//var ALPHA = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"+SALPHA+NUMBER+SPECIAL; 

		if (!document.getElementsByName("member_id")[0].value) {
			alert("아이디를 입력하세요");
			document.getElementsByName("member_id")[0].focus();
			return;
		}
		
		if (!TypeCheck(document.getElementsByName("member_id")[0].value, ALPHA)) { 
			//window.alert("아이디는 영문소문자, 숫자, -, _를 혼합하여 사용할 수 있습니다"); 
			window.alert("아이디는 영문소문자, 숫자, -, _를 조합으로 사용할 수 있습니다"); 
			document.getElementsByName("member_id")[0].focus(); 
			return; 
		} 

		if (document.getElementsByName("member_id")[0].value.length<6 || document.getElementsByName("member_id")[0].value.length>20) {
			window.alert("아이디는 영문소문자, 숫자, -, _를 조합으로 6자~20자이하입니다");
			document.frmName.member_id.focus();
			return;
		}

		createXMLHttpRequest();
		var url = "./member_id_chk.php?member_id="+document.frmName.member_id.value;
		//window.alert(url);
		xmlHttp.open("GET", url, true);
		xmlHttp.onreadystatechange = callback_AA;
		xmlHttp.send(null);
	}

	function callback_AA() {
		if(xmlHttp.readyState == 4) {
			if(xmlHttp.status == 200) {
				var id_status = xmlHttp.responseXML.getElementsByTagName("id_status")[0].firstChild.data;

				if(id_status=="N") {
					window.alert("사용 불가능한 아이디 입니다.");
					document.frmName.id_chk.value="N";
				}else{
					window.alert("사용 가능한 아이디 입니다.");
					document.frmName.id_chk.value="Y";
				}

				//window.alert(aa);
				//document.aaa.price.value = price;
				//document.aaa.mileage.value = mileage;
				//document.aaa.unit_cost.value = unit_cost;
			}
		}
	}

	Member_YorN();
}

function id_chk_bb() {
	document.frmName.id_chk.value="";
}
</script>



<script>
function emailChkYorN() {
	document.frmName.emailChk.value="";
}

function createQueryingChk() {

	var form1 = document.frmName;

	if(!form1.email.value){
		alert("이메일을 입력하세요");
		form1.email.focus();
		return;
	}
	var EMAIL = form1.email.value;
	if (EMAIL) {
		if ((EMAIL.indexOf('@') < 0 )||(EMAIL.indexOf('.') < 0 )) {
			window.alert('이메일을 정확하게 입력하세요');
			form1.email.focus();
			return;
		}
	}

//	validate_EmailDupl();
}
</script>


<script>
function frmChk(){

	form1=document.frmName;
	var NUM=0;

	
	//비밀번호 특수문자 체크
	var regMust1 = /[a-zA-Z0-9_]/;
	var regMust2 = /[^a-zA-Z0-9_]/;

	var NUMBER = "1234567890";
	var SPECIAL = "-_";
	var SPECIAL = "";
	var SALPHA = "abcdefghijklmnopqrstuvwxyz";
	//var ALPHA = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"+SALPHA+NUMBER+SPECIAL;
	var ALPHA = SALPHA+NUMBER+SPECIAL;


	if(!document.getElementsByName("member_id")[0].value){
		window.alert("아이디를 입력하세요");
		document.getElementsByName("member_id")[0].focus();
		return;
	}
	if(document.getElementsByName("member_id")[0].value.length<6 || document.getElementsByName("member_id")[0].value.length>20){
		window.alert("아이디는 영문소문자, 숫자, -, _를 조합으로 6자~20자이하입니다");
		document.getElementsByName("member_id")[0].focus();
		return;
	}
	if (!TypeCheck(document.getElementsByName("member_id")[0].value, ALPHA)) { 
		window.alert("아이디는 영문소문자, 숫자, -, _를 조합으로 사용할 수 있습니다"); 
		document.getElementsByName("member_id")[0].focus(); 
		return; 
	}
	if(!document.getElementsByName("id_chk")[0].value) {
		window.alert("아이디 중복검사를 해주세요");
		return;
	}
	if(document.getElementsByName("id_chk")[0].value=="N") {
		window.alert("이미 사용중인 아이디입니다");
		return;
	}
	if(!document.getElementsByName("passwd")[0].value){
		window.alert("비밀번호를 입력하세요");
		document.getElementsByName("passwd")[0].focus();
		return;
	}
	if(document.getElementsByName("passwd")[0].value.length<6 || document.getElementsByName("passwd")[0].value.length>20){
		window.alert("비밀번호는 6자이상 20자이하입니다");
		document.getElementsByName("passwd")[0].focus();
		return;
	}
	if(!regMust1.test(document.getElementsByName("passwd")[0].value) || !regMust2.test(document.getElementsByName("passwd")[0].value)) {
		window.alert("특수문자를 하나 이상 입력하세요");
		document.getElementsByName("passwd")[0].focus();
		return;
	}
	if(!document.getElementsByName("passwd1")[0].value){
		window.alert("비밀번호를 한번 더 입력하세요");
		document.getElementsByName("passwd1")[0].focus();
		return;
	}
	if(document.getElementsByName("passwd")[0].value != document.getElementsByName("passwd1")[0].value){
		window.alert("비밀번호가 일치하지 않습니다");
		document.getElementsByName("passwd1")[0].focus();
		return;
	}
	if(!document.getElementsByName("member_name")[0].value){
		window.alert("이름을 입력하세요");
		document.getElementsByName("member_name")[0].focus();
		return;
	}
	if(!document.getElementsByName("birthday")[0].value){
		window.alert("생년월일을 선택하세요");
		document.getElementsByName("birthday")[0].focus();
		return;
	}

	if(!document.getElementsByName("zipcode")[0].value){
		window.alert("주소를 입력하세요");
		document.getElementsByName("zipcode")[0].focus();
		return;
	}
	if(!document.getElementsByName("addr1")[0].value){
		window.alert("주소를 입력하세요");
		document.getElementsByName("addr1")[0].focus();
		return;
	}
	if(!document.getElementsByName("cel1")[0].value || !document.getElementsByName("cel2")[0].value || !document.getElementsByName("cel3")[0].value){
		alert("휴대전화번호를 입력하세요");
		document.getElementsByName("cel1")[0].focus();
		return;
	}
	if(!document.getElementsByName("email")[0].value){
		window.alert("이메일을 입력하세요");
		document.getElementsByName("email")[0].focus();
		return;
	}
	var EMAIL = document.getElementsByName("email")[0].value;
	if (EMAIL) {
		if ((EMAIL.indexOf('@') < 0 )||(EMAIL.indexOf('.') < 0 )) {
			window.alert('이메일을 정확하게 입력하세요');
			document.getElementsByName("email")[0].focus();
			return;
		}
	}
	if(!document.getElementsByName("emailChk")[0].value) {
		window.alert("이메일 중복검사를 해주세요");
		return;
	}
	if(document.getElementsByName("emailChk")[0].value=="N") {
		window.alert("이미 사용중인 이메일입니다.");
		return;
	}
/*
	if(!document.getElementsByName("chk_chk")[0].value){
		window.alert("자동등록 방지 필수 입력입니다");
		document.getElementsByName("chk_chk")[0].focus();
		return;
	}
	if(document.getElementsByName("byte_chk")[0].value!=document.getElementsByName("chk_chk")[0].value){
		window.alert("자동등록방지용 빨간글자가 순서대로 입력되지 않았습니다");
		document.getElementsByName("chk_chk")[0].focus();
		return;
	}
*/

	form1.submit();
}
</script>

<%@ include file="/include/sub_member.jsp"%>

<!-- 컨텐츠 -->
<div class="contents_box">
	<div class="contents">
		<h3>회원가입</h3>
		<div class="location pc">HOME <span>></span> 회원관리 <span>></span> 회원가입</div>
		
		<div class="join_step box">
			<ul>
				<li class="col-xs-4">01 약관동의</li>
				<li class="col-xs-4 on">02 정보입력</li>
				<li class="col-xs-4">03 가입완료</li>
			</ul>
		</div>



<form class="form-horizontal" role="form" name="frmName" method="post" action="" onsubmit="return false;" enctype="multipart/form-data">
<input type="hidden" name="mode" value="joinEnd">
		<div class="join">
			<div class="msg_box pc">
				<i class="msg"></i>
				<p>다음 항목들은 회원 관리 및 서비스 제공을 위해 활용됩니다.<br>설명에 따라 내용을 정확하게 입력하여 주십시오.</p>
				<div class="h30"></div>
			</div>

			<div class="title">필수정보 <span>(회원가입 필수 입력 항목입니다.)</span></div>
				
				
			<div class="form-group">
				<label class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-10 divinner">
					<div class="col-xs-8">
						<input type="text" class="form-control" maxlength="20" name="member_id" onKeyUP="id_chk_bb();">
						<input type="hidden" name="id_chk">
					</div>
					<div class="col-xs-4">
						<a href="#void" class="btn btn-normal" onClick="Member_ID_CHK(); return false;">중복확인</a>
					</div>
					<p>영문소문자, 숫자, -, _를 혼합하여 6자~20자까지 입력 가능합니다.</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" maxlength="20" name="passwd">
					<p>특수문자를 하나 이상 포함하여 6~20자로 입력하십시오.</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">비밀번호 확인</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" maxlength="20" name="passwd1">
					<p>비밀번호를 동일하게 다시 한 번 입력하십시오.</p>
				</div>
			</div>
			
			<div class="form-group cal_Box">
				<label class="col-sm-2 control-label">이름</label>
				<div class="col-sm-10">
					<div class="col-xs-5">
						<input type="text" class="form-control" maxlength="10" name="member_name" value="">
					</div>
					<div class="col-xs-7 gender">
						<label class="radio-inline"><input type="radio" name="sex" value="1">남자</label>
						<label class="radio-inline"><input type="radio" name="sex" value="2">여자</label>
					</div>
				</div>
			</div>
			
			<div class="form-group cal_Box years">
				<label class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-10 divinner">
					<div class="col-xs-4" style="width:35%;">
						<input type="text" class="form-control" name="birthday">
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">주소</label>
				<div class="col-sm-10 col-sm-10 divinner addr">
					<div class="col-xs-7">
						<label for="sel1">우편번호</label>
						<input type="text" class="form-control" readonly name="zipcode">
					</div>
					<div class="col-xs-5">
						<a href="#void" class="btn btn-normal" onclick="memberZip('zipcode','addr1',0); return false;">우편번호찾기</a>
					</div>
					<div class="col-xs-12">
						<label for="sel1">주소</label>
						<input type="text" class="form-control" maxlength="100" name="addr1">
					</div>
					<div class="col-xs-12">
						<label for="sel1">상세주소</label>
						<input type="text" class="form-control" maxlength="100" name="addr2">
					</div>
				</div>
			</div>


			<div class="form-group">
				<label class="col-sm-2 control-label">휴대전화</label>
				<div class="col-sm-10 divinner">
					<div class="col-xs-3">
						<select name="cel1" class="selectpicker show-tick form-control">
							<option value="010" selected="selected">010</option>
							<option value="011" >011</option>
							<option value="016" >016</option>
							<option value="017" >017</option>
							<option value="018" >018</option>
							<option value="019" >019</option>
						</select>
					</div>			
					<div class="col-xs-3">
						<input type="text" class="form-control onlyNumber" maxlength="4" name="cel2" placeholder="" style="ime-mode:disabled;">
					</div>
					<div class="col-xs-3">
						<input type="text" class="form-control onlyNumber" maxlength="4" name="cel3" placeholder="" style="ime-mode:disabled;">
					</div>
				</div>
			</div>
			
			<div class="form-group cal_Box">
				<label class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-10 divinner">
					<div class="col-xs-8">
						<input type="text" class="form-control" maxlength="40" name="email" onKeyUp="emailChkYorN();">
					</div>
					<div class="col-xs-2">
						<input type="hidden" name="emailChk" value="" />
						<a href="#void" class="btn btn-normal" onclick="createQueryingChk(); return false;">중복확인</a>
					</div>
				
				</div>
			</div>
	
			<div class="h30"></div>
			<div class="h30"></div>
			<div class="title">선택정보 <span>(회원가입 선택 입력 항목입니다.)</span></div>
			<div class="form-group">
				<label class="col-sm-2 control-label">유선전화</label>
				<div class="col-sm-10 divinner">
					<div class="col-xs-3">
						<input type="text" class="form-control onlyNumber" maxlength="4" name="tel1" placeholder="" style="ime-mode:disabled;">
					</div>			
					<div class="col-xs-3">
						<input type="text" class="form-control onlyNumber" maxlength="4" name="tel2" placeholder="" style="ime-mode:disabled;">
					</div>
					<div class="col-xs-3">
						<input type="text" class="form-control onlyNumber" maxlength="4" name="tel3" placeholder="" style="ime-mode:disabled;">
					</div>
				</div>
			</div>
		</div>
		

		<div class="h30"></div>
		<!-- 버튼 -->
		<div class="btn_box">
			<ul>
				<li><a class="btn btn-blue" href="#void" onclick="frmChk(); return false;">가입하기</a></li>
				<li><a class="btn btn-gray" href="javascript:if(confirm('가입을 취소하시겠습니까?')) location.href='index.do'">작성취소</a></li>
			</ul>
		</div>
</form>


	</div>

</div><!-- //컨텐츠 -->

<%@ include file="/include/footer.jsp"%>