<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- bootstrap -->
    <link href="http://localhost/project_2/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery CDN(Contents Delivery Network) -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- bootstrap -->
    <script src="http://localhost/project_2/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
    <!-- daum postcode -->
 	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- stlye.css -->
	<link href="http://localhost/project_2/common/css/style.css" rel="stylesheet">
<style type="text/css">
 .idtitle{font-size:25px;}
 #wrap{text-align: center; border:1px solid #333; width:400px;height:250px;padding:30px; margin:15px auto }
 .use{font-size: 14px; color:#fff; background-color:#333; width:100px; height:27x; font-weight:bold;}
</style>
<script type="text/javascript">
function useId() {
	var obj=document.idFrm;
	//부모창을사용할때는 opener로 접근 
	var pObj=opener.window.document.singUp;
	//부모창에 값전송
	pObj.id.value=obj.id.value;
	//자식창을 닫기
	self.close();
}//useid

$(function() {
	 $("#use").click(function() {
		 useId();
	 });
});

</script>

</head>
<body>

<div align="center" id="wrap">
<form action="#" name="idFrm">
<span class="idtitle"><strong>ID CHECK</strong> 아이디 중복확인</span> <br>
사용하고자 하는 아이디를 입력해주세요.<br>
아이디 중복확인 후 사용 가능한 아이디를 등록합니다. <br>
<br>
<input type="text" class="inputbox" name="id"> <input type="button" value="ID 중복확인" class="btn btn-default" id="chkid"> <br>
<br>
<input type="button" value="사용하기" class="use" id="use">
</form>
</div>

</body>
</html>