<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>수정확인</title>
	
	
	<!-- bootstrap -->
	<link href="http://localhost/team_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery CDN(Contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	 <!-- bootstrap -->
	<script src="http://localhost/team_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
	<!-- stlye.css -->
	<link href="http://localhost/team_prj/common/css/style.css" rel="stylesheet">
	
<style type = "text/css">

</style>

<script type="text/javascript">
$(function() {
	 $("#submitBtn").click(function() {
		 location.href="15_myPage_main.jsp";
	 });
});//ready
</script>
<!--header-->
<%@ include file="../common/template/header.jsp" %>
<div class="mypage">

<div class="submitPage" style="padding-top:150px">	
	
	<h2> <strong>회원정보가 수정되었습니다.</strong> </h2> <br>
	<br>
	<input type="button" id="submitBtn" value="확인" class="btn btn-success "/>
	</div>

</div>	
<!--footer-->
<%@ include file="../common/template/footer.jsp" %>
</body>
</html>