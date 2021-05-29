<%@page import="userDAO.PassChangeVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="userDAO.FindPassVO"%>
<%@page import="userDAO.MemberDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt "%>
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
<link
	href="http://localhost/team_prj/common/bootstrap-3.3.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery CDN(Contents Delivery Network) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- bootstrap -->
<script
	src="http://localhost/team_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<!-- stlye.css -->
<link href="http://localhost/team_prj/common/css/style.css"
	rel="stylesheet">

<style type="text/css">
</style>
<%
request.setCharacterEncoding("UTF-8");
String m_id = request.getParameter("id");
String m_name = request.getParameter("name");
String m_telnum = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-"
		+ request.getParameter("tel3");
MemberDAO mDAO = MemberDAO.getInstance();

FindPassVO FPVO = new FindPassVO(m_id, m_name, m_telnum);
String pass = mDAO.selectFindPass(FPVO);
String NewPass = null;
if (pass == null) {
%>

<script>
			alert("입력한 정보를 확인해주세요.<%=m_id%><%=m_name%><%=m_telnum%><%=pass%>
	");
	history.back();
</script>

<%
} else {
char[] charSet = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
		'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd',
		'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
		'!', '@', '#', '$', '%', '^', '&'};

	StringBuffer sb = new StringBuffer();
	SecureRandom sr = new SecureRandom();
	sr.setSeed(new Date().getTime());

	int idx = 0, len = charSet.length;
	for (int i = 0; i < 5; i++) {
		idx = (int) (len * Math.random());
		idx = sr.nextInt(len); // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
		sb.append(charSet[idx]);
	}

	NewPass = sb.toString();
	PassChangeVO PCVO = new PassChangeVO(m_id, pass, DataEncrypt.messageDigest("MD5", NewPass));
	mDAO.updateNewPass(PCVO);
}
%>
<script type="text/javascript">
	$(function() {
		$("#loginBtn").click(function() {
			location.href = "07_login.jsp"
		});
	});
</script>
</head>
<body>
	<div>
		<!--header-->
		<%@ include file="../common/template/header.jsp"%>
		<div class="content">

			<div class="submitPage">
				<h2>
					<strong>변경된 비밀번호는<%=NewPass%>입니다.
					</strong>
				</h2>
				<br> 로그인 후에 서비스를 이용할 수 있습니다. <br>
				<br> <input type="button" id="loginBtn" value="로그인"
					class="btn btn-success" />
			</div>

		</div>
		<!--footer-->
		<%@ include file="../common/template/footer.jsp"%>
	</div>
</body>
</html>