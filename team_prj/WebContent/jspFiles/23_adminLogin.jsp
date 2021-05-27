<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>관리자로그인</title>
	

	<!-- bootstrap -->
	<link href="http://localhost/team_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- jQuery CDN(Contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	 <!-- bootstrap -->
	<script src="http://localhost/team_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
	<!-- style CSS -->
	<link href="http://localhost/team_prj/common/css/admin_style.css" rel="stylesheet" type="text/css">
	
<style type = "text/css">

</style>

<script type="text/javascript">
$(function(){
	$("#btnLogin").click(function(){
		$("#log_in").submit();
	});//get
});//ready
</script>
</head>
<body>
<div class = "container">
	<div class = "log_in">
		<h1 style= "font-weight: bold;">관리자 로그인</h1><br/><br/>
		아이디<br/>
		 <input type="text" class="inputBox" name= "id" /><br/>
		비밀번호 <br/>
		 <input type="text" class="inputBox" name= "password" /><br/>
		<input type = "button" class = "btn btn-primary" value = "로그인"  style = "height : 50px; width : 300px; margin-top: 20px; font-size: 20px; border-radius: 10px;" />
	</div>
</div>
</body>
</html>