<%@page import="userDAO.ModifyMemberVO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="userDAO.LoginVO"%>
<%@page import="userDAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/jsp/common_login.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>

<!-- bootstrap -->
<link href="http://localhost/team_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet"/>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://localhost/team_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
    <!-- daum postcode -->
 	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- stlye.css -->
	<link href="http://localhost/team_prj/common/css/style.css" rel="stylesheet">

<style type="text/css">

</style>

<%

	MemberDAO mDAO = MemberDAO.getInstance();
	
	String pass = request.getParameter("pass");
	pass = DataEncrypt.messageDigest("MD5", pass);
	LoginVO lVO = new LoginVO(id, pass);
	String nameChk = mDAO.selectLogin(lVO);
	
	if (!name.equals(nameChk)) { %>
		
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		location.href = "http://localhost/team_prj/jspFiles/19_myPage_pass_check.jsp";
		</script>
	<%}%>
	
	<%
		ModifyMemberVO mmVO = mDAO.selectMember(id);
	
		String[] emailArr = mmVO.getM_email().split("@");
		String[] telArr = mmVO.getM_telnum().split("-");
	%>
	
<script type="text/javascript">
$(function() {
//비밀번호 변경 팝업
	$("#pass_change").click(function() {
		window.open("21_pop_change_pass.jsp","pass_change","width=460px,height=405px");
	})
//변경버튼
	 $("#btnMod").click(function() {
		 $("#updateFrm").submit();
	 });
//취소 버튼 > 마이페이지 홈으로 
	 $("#btnCancel").click(function() {
		 location.href="15_myPage_main.jsp";
	 });
	
	//우편번호 검색
	 $("#zipcodeBtn").click(function() {
	      new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("zipcode").value = data.zonecode;
	                document.getElementById("addr").value = roadAddr;
	                document.getElementById("addAddr").value = "";
	            }
	        }).open();
	 });//click
	 
	 $("#frmSelect").change(function() {
	 	var updateFrm = document.updateFrm;
	 	
	 	if (updateFrm.frmSelect.value == 'self') {
	 		updateFrm.domain.readonly = false;
	 		updateFrm.domain.value='';
	 		updateFrm.domain.focus();
	 	} else if (updateFrm.frmSelect.value == 'none') {
	 		updateFrm.domain.readonly = true;
	 		updateFrm.domain.value = '';
	 	} else {
	 		updateFrm.domain.readonly = true;
	 		updateFrm.domain.value = updateFrm.frmSelect.value;
	 	}
	 	
	 });
});
</script>

</head>
<body>
<!--header-->
<%@ include file="../common/template/header2.jsp" %>

<div class="mypage">
	<div class="menu__left">
		<div class="menu__left__name">
		My Page
		</div>
		<div class="menu__left__list">
			<ul>
			<li class="list"><a class="list__info" href="17_myPage_purchse_list.jsp">구매목록</a></li>
			<li class="list"><a class="list__info" href="16_myPage_review_list.jsp">내가 쓴 후기</a></li>
			<li class="list"><a class="list__info" href="19_myPage_pass_check.jsp">회원정보 수정</a></li>
			</ul>
		</div>
	</div>
	<div class="menu__right">
		
		<div class="m__name">
			
		</div>
		<div class="m__table">
			<form action="22_revise_confirm.jsp" method="post" name="updateFrm" id="updateFrm" class="form-inline">
			<table style="position:absolute;">
				<tr>
				<td colspan="2" class="center"><font size="6"><strong>회원정보수정</strong></font></td>
				</tr>
				<tr class="height font-medium">
					<td style="padding-top: 15px;">아이디</td>
					<td style="padding-top: 15px;"><%= id %></td>
				</tr>
				<tr class="height font-medium">
					<td style="padding-top: 15px;">이름</td>
					<td><input type="text" name="name" id="name" value="<%= mmVO.getM_name() %>"/></td>
				</tr>
				<tr class="height font-medium">
					<td style="padding-top: 15px;">이메일</td>
					<td>
					<input type="text" name="email" id="email" style="width: 150px;" value="<%= emailArr[0] %>"/> @ <input type="text" name="domain" id="domain" style="width: 150px;" value="<%= emailArr[1] %>"/>
					<select class="select form-control" id="frmSelect" name="frmSelect">
						<option value="none">--- 선택해주세요 ---</option>
						<option value="google.com">google.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="self">직접입력</option>
					</select>
					</td>
				</tr>
				<tr class="height font-medium">
					<td style="padding-top: 15px;">휴대폰번호</td>
					<td> <input type="text" name="tel1" style="width: 70px;" value="<%= telArr[0] %>"/> - 
					<input type="text" name="tel2" style="width: 70px;" value="<%= telArr[1] %>"/> - 
					<input type="text" name="tel3" style="width: 70px;" value="<%= telArr[2] %>"/></td>
				</tr>
				<tr class="height font-medium">
					<td style="padding-top: 15px;">우편번호</td>
					<td><input type="text" id="zipcode" name="zipcode" value="<%= mmVO.getM_zipcode() %>"/>  <input type="button" value="우편번호찾기" class="btn btn-default" id="zipcodeBtn"></td>
				</tr>
				<tr class="height font-medium">
					<td style="padding-top: 30px;">주소</td>
					<td><input type="text" name="addr" id="addr" size="50" style=" margin-bottom: 5px;" value="<%= mmVO.getM_address() %>"/><br/><input type="text" name="addAddr" id="addAddr" size="50" value="<%= mmVO.getM_add_address() %>"/></td>
				</tr>
				<tr class="height font-medium">
					<td style="padding-top: 15px;">비밀번호</td>
					<td><input type="button" value="비밀번호 변경" class="btn btn-default" id="pass_change"></td>
				</tr>
				<tr class="height font-medium">
					<td colspan="2" style="padding-top: 15px;">
					<div id="btn_div">
					<input type="button" id="btnMod" name="btnMod" value="변경" class="btn btn-success "/>
					<input type="reset" id="btnCancel" name="btnCancel" value="취소" class="btn btn-default"/>
					</div>
					</td>

				</tr>
			</table>
			</form>
		</div>
		
	</div>
	
</div>
<!--footer-->
<%@ include file="../common/template/footer.jsp" %>
</body>
</html>
