<%@page import="userDAO.LoginVO"%>
<%@page import="userDAO.MemberDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>한끼사조</title>

    <!-- bootstrap -->
    <link href="http://localhost/team_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery CDN(Contents Delivery Network) -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- bootstrap -->
    <script src="http://localhost/team_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
	<!-- stlye.css -->
	<link href="http://localhost/team_prj/common/css/style.css" rel="stylesheet">
 <style type="text/css">

 </style>
 
 
 <script type="text/javascript">

 
 $(function() {
	 $("#login").click(function() {
		 chkNull();
 	 });
		
	$("#id").keydown(function(evt) {
		if (evt.which == 13) {
			chkNull();
		}
	});
	$("#pass").keydown(function(evt) {
		if (evt.which == 13) {
			chkNull();
		}
	});
	 
 });
 
 function chkNull() {
		if ($("#id").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return;
		}
		if ($("#pass").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return;
		}
		$("#loginFrm").submit();
	}
 </script>
</head>
<body>
<div>
<!--header-->
<%@ include file="../common/template/header.jsp" %>
<div class="content">
<form action="02_main_login.jsp" method="post" id="loginFrm"> 
			<div class="box">
			<h2> <strong>로그인</strong> </h2>
			<div class="id-label">
 			 <label>아이디</label>
 			 </div>
 			<div>
  			<input type="text" class="pass-text" id="id" name="id" placeholder="아이디를 입력하세요.">
			</div>
			<div class="pass-label">
  			<label>비밀번호</label>
  			</div>
  			<div>
  			<input type="password" class="pass-text" id="pass" name="pass" placeholder="비밀번호를 입력하세요." >
  			</div>
			<div> <br>	
			<input type="button" id="login" value="로그인" class="btn btn-success btn-lg" style="width:477px; height:70px;font-weight: bold;"/>
			</div>
		<div>
          <div class="member-check">
            <p class=""><a href="03_signIn.jsp">회원이 아니신가요?</a></p>
          </div>
          <div>
              <p class=""><a href=08_idFind.jsp>아이디/비밀번호 찾기</a></p>
          </div>          
		</div>
		</div>
</form>
</div>
<!--footer-->
<%@ include file="../common/template/footer.jsp" %>
</div>
</body>
</html>