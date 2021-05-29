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
  <%
	request.setCharacterEncoding("UTF-8");
	String m_name = request.getParameter("name");
	String m_telnum = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-" + request.getParameter("tel3");
	
	MemberDAO mDAO = MemberDAO.getInstance();
	
	FindIdVO FVO = new FindIdVO(m_name, m_telnum);
	String id = mDAO.selectFindId(FVO);
	if (id == null) { %>
	
		<script>
			alert("이름과 전화번호를 확인해주세요.");
			history.back();
		</script>
<% } %>
 <script type="text/javascript">
 $(function() {
	 $("#loginBtn").click(function() {
		location.href="07_login.jsp"
 	 });
	 $("#passfind").click(function() {
		location.href="10_passFind.jsp"
 	 });
 });
 </script>
</head>
<body>
<div>
<!--header-->
<%@ include file="../common/template/header.jsp" %>
<div class="content">

<div class="submitPage">
<h2> <strong >등록하신 아이디는 <%=id%> 입니다.</strong> </h2> <br>
로그인 후에 서비스를 이용할 수 있습니다. <br><br>
<input type="button" id="passfind" value="비밀번호찾기" class="btn btn-success"/>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" id="loginBtn" value="로그인" class="btn btn-success"/>
</div>

</div>
<!--footer-->
<%@ include file="../common/template/footer.jsp" %>
</div>
</body>
</html>
