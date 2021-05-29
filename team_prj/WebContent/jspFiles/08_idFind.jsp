<%@page import="userDAO.FindIdVO"%>
<%@page import="userDAO.MemberDAO"%>
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
	$(function(){
		$("#name").keydown(function(evt){ 
			if(evt.which == 13){
				chkNull();
			}//end if
		});	
		$("#tel1").keydown(function(evt){ 
			if(evt.which == 13){
				chkNull();
			}//end if
		});	
		$("#find").click(function(){ 
			chkNull();
		});	
		
	});
function chkNull() {
		if ($("#name").val() == "") {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return;
		}
		if ($("#tel1").val() == "") {
			alert("휴대폰번호를 입력해주세요.");
			$("#tel1").focus();
			return;
		}
		$("#findFrm").submit();
	} 
 </script>
</head>
<body>
<div>
<!--header-->
<%@ include file="../common/template/header.jsp" %>
<div class="content">


			<div class="box">
			<h2><strong>아이디/비밀번호찾기</strong></h2><br>
			<div class="find-menu" >
			<ul class="nav nav-tabs nav-justified" >
			  <li role="presentation" class="active"><a href="08_idFind.jsp">아이디찾기</a></li>
			  <li role="presentation" ><a href="10_passFind.jsp" style="color:#ddd;">비밀번호찾기</a></li>
			</ul>
			</div>
			<div>
			<h2>등록정보로 아이디 찾기</h2>
			회원가입 시 등록한 정보로 찾을 수 있습니다.
			</div>
			<form action="09_idCheck.jsp" method="post" id="findFrm"> 
			<div class="idfind-name">
			<label>이름</label>
			<input type="text" placeholder="이름을 입력해주세요."class="name-text" name="name" id="name" />
			</div>
			<div class="idfind-telnum">
			<label>휴대폰 번호</label>
			<input type="text" class="tel-text"  maxlength="3" name="tel1" id="tel1"/> -
			<input type="text" class="tel-text"  maxlength="4" name="tel2" id="tel2"/> -
			<input type="text" class="tel-text"  maxlength="4" name="tel3" id="tel3"/>
			</div>
			
			<br>
			<input type="button" name="find" id="find" value="확인" class="btn btn-success btn-lg" style="width:450px; height:70px;font-weight: bold;"/>
			</form>
			</div>

</div>

<!--footer-->
<%@ include file="../common/template/footer.jsp" %>
</div>
</body>
</html>