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

</style>

<script type="text/javascript">
$(function() {
	 $("#submitBtn").click(function() {
		 $("#passFrm").submit();
	 });
});//ready
</script>

</head>
<body>
<!--header-->
<%@ include file="../common/template/header2.jsp" %>
<div class="mypage">

<div class="submitPage" style="padding-top:150px">	
	
	<h3> <strong>회원님의 개인정보를 안전하게 보호하기 위해<br/><br/>
	<span style="color: #DC1437;">인증 후 변경이 가능</span>합니다.</strong> </h3> <br>
	<br>
	
	<form action="20_myPage_modify_info.jsp" method="post" id="passFrm" name="passFrm"> 
	<div class="content__inputpass"> <input type="password" placeholder="비밀번호를 입력해주세요." id="pass" name="pass"/> </div>
	<input type="button" value="확인" id="submitBtn" class="btn btn-success" style="width: 200px;"/>
	</form>
	
</div>
</div>	
<!--footer-->
<%@ include file="../common/template/footer.jsp" %>
</body>
</html>
