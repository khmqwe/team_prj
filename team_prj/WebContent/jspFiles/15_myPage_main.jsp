<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>

	<!-- bootstrap -->
	<link href="http://localhost/project_2/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet"/>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="http://localhost/jsp_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
	<!-- stlye.css -->
	<link href="http://localhost/project_2/common/css/style.css" rel="stylesheet">
<style type="text/css">

</style>

<script type="text/javascript">

$(document).ready(function() {
	$("#btn1").click(function() {
		$("#frm1").submit();
	});
	$("#btn2").click(function() {
		$("#frm2").submit();
	});
	$("#btn3").click(function() {
		$("#frm3").submit();
	});
});

</script>

</head>
<body>
<!--header-->
<%@ include file="../common/template/header.jsp" %>
<div class="mypage" style="padding-top:150px">
	<div class="mypage__name">
		OOO님의 마이페이지
	</div>
	<div class="mypage__btn">
		<form action="17_myPage_purchse_list.jsp" id="frm1" name="frm1">
		<input class="btn btn-default btn-size" id="btn1" type="button" value="구매목록"/>
		<input type="hidden" name="hid_id" value="아이디123"/>
		</form>
		<form action="16_myPage_review_list.jsp" id="frm2" name="frm2">
		<input class="btn btn-default btn-size" id="btn2" type="button" value="내가 쓴 리뷰"/>
		<input type="hidden" name="hid_id" value="아이디123"/>
		</form>
		<form action="19_myPage_pass_check.jsp" id="frm3" name="frm3">
		<input class="btn btn-default btn-size" id="btn3" type="button" value="회원정보 수정"/>
		<input type="hidden" name="hid_id" value="아이디123"/>
		</form>
	</div>
</div>
<!--footer-->
<%@ include file="../common/template/footer.jsp" %>
</body>
</html>
