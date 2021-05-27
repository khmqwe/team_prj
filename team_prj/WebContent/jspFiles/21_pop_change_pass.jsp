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
	padding-top: 20px;
}

#ok {
	width: 150px;
}

</style>

<script type="text/javascript">

</script>

</head>
<body>
<div id="chage_page">
<div id="name">비밀번호 변경</div>
<div style="width: 400px; height: 5px; background-color: #ffffff" ></div>
<div id="passPage">
	<table id="tab">
		<tr>
			<td><strong>기존 비밀번호</strong></td>
			<td><input type="password" name="oldPass" id="oldPass"/></td>
		</tr>
		<tr>
			<td><strong>새로운 비밀번호</strong></td>
			<td><input type="password" name="newPass1" id="newPass1"/></td>
		</tr>
		<tr>
			<td><strong>비밀번호 확인</strong></td>
			<td><input type="password" name="newPass2" id="newPass2"/></td>
		</tr>
	</table>
</div>
<div id="divOk">
	<input type="button" value="확인" class="btn btn-success" name="ok" id="ok"/>
</div>
</div>
</body>
</html>
