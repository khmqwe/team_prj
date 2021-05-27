<%@page import="userDAO.MainVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.UserPageDAO"%>
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
<title></title>

<!-- bootstrap -->
<link href="http://localhost/jsp_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet"/>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://localhost/jsp_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

</style>

<script type="text/javascript">

</script>

</head>
<body>
<div>
<%-- <%

MemberDAO mDAO = MemberDAO.getInstance();

FindIdVO fiVO = new FindIdVO("스타버그", "010-0001-0001");
String id = mDAO.selectFindId(fiVO);

%>

<%= id %> --%>

<%

	UserPageDAO upDAO = UserPageDAO.getInstance();

	List<MainVO> list = upDAO.selectMainList(0);
	
	for (MainVO vo : list) { %>
	<img alt="사진" src="http://localhost/team_prj/common/images/food/<%= vo.getP_thumb_img() %>" width=200 height=200>
	 <%= vo.getP_name() %> <%= vo.getP_num() %> <%= vo.getT_type() %> <br/>
	
<% } %>
</div>
</body>
</html>
