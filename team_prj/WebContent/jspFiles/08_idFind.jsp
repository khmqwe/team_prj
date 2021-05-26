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
    <link href="http://localhost/project_2/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery CDN(Contents Delivery Network) -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- bootstrap -->
    <script src="http://localhost/project_2/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
	<!-- stlye.css -->
	<link href="http://localhost/project_2/common/css/style.css" rel="stylesheet">

 <style type="text/css">

 </style>
 <script type="text/javascript">
 
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
			  <li role="presentation" class="active"><a href="#">아이디찾기</a></li>
			  <li role="presentation" ><a href="#" style="color:#ddd;">비밀번호찾기</a></li>
			</ul>
			</div>
			<div>
			<h2>등록정보로 아이디 찾기</h2>
			회원가입 시 등록한 정보로 찾을 수 있습니다.
			</div>
			<div class="idfind-name">
			<label>이름</label>
			<input type="text" placeholder="이름을 입력해주세요."class="name-text"/>
			</div>
			<div class="idfind-telnum">
			<label>휴대폰 번호</label>
			<input type="text" class="tel-text"/> -
			<input type="text" class="tel-text"/> -
			<input type="text" class="tel-text"/>
			</div>
			<br>
			<input type="button" value="확인" class="btn btn-success btn-lg" style="width:450px; height:70px;font-weight: bold;"/>
			</div>
</div>

<!--footer-->
<%@ include file="../common/template/footer.jsp" %>
</div>
</body>
</html>