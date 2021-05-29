<%@page import="userDAO.PassChangeVO"%>
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
	<!-- stlye.css -->
	<link href="http://localhost/team_prj/common/css/style.css" rel="stylesheet">
<style type="text/css">

#chage_page {
	width: 400px;
	height: 400px;
	background-color: #fff;
	margin: auto;
	
}

#tab {
	font-size: 15px;
	margin: auto;
	border-collapse: separate;
	border-spacing: 15px;
}

#passPage {
	padding-top: 20px;
}

#name {
	font-size: 24px;
	padding-top: 30px;
	font-weight: bold;
	text-align: center;
}

#divOk {
	text-align: center;
	margin: auto;
	padding-top: 120px;
}

#cancel

</style>

<%
	String oldPass = request.getParameter("oldPass");
	oldPass = DataEncrypt.messageDigest("MD5", oldPass);
	String newPass = request.getParameter("newPass1");
	newPass = DataEncrypt.messageDigest("MD5", newPass);
	
	MemberDAO mDAO = MemberDAO.getInstance();
	LoginVO lVO = new LoginVO(id, oldPass);
	String nameChk = mDAO.selectLogin(lVO);
	
	boolean oldPassFlag = false;
	if (name.equals(nameChk)) {
		oldPassFlag = true;
	}
	int result = 0;
	
	if (oldPassFlag) {
		PassChangeVO pcVO = new PassChangeVO(id, oldPass, newPass);
		result = mDAO.updateNewPass(pcVO);
	}
%>

<script type="text/javascript">
$(document).ready(function() {
	$("#cancel").click(function() {
		self.close();
	});
	
	if (<%= result %> == 1) {
		$("#chkText").html("비밀번호 변경에 성공하였습니다.");
	} else {
		$("#chkText").html("기존 비밀번호 입력이 틀려<br/> 변경에 실패하였습니다.");
	}
});

</script>

</head>
<body>
<form action="" method="post" name="passFrm" id="passFrm">
<div id="chage_page">
<div id="name">비밀번호 변경</div>
<div style="width: 400px; height: 5px; background-color: #ffffff" ></div>
<div id="passPage">
	<h3 id="chkText" style="text-align: center;"></h3>
</div>
<div id="divOk">
	<input type="button" value="닫기" class="btn btn-success" name="cancel" id="cancel"/>
</div>
</div>
</form>
</body>
</html>
