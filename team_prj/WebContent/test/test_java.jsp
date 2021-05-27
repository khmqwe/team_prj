<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="adminDAO.AdminReviewVO"%>
<%@page import="adminDAO.AdminReviewDAO"%>
<%@page import="adminDAO.LoginVO"%>
<%@page import="adminDAO.AdminLoginDAO"%>
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
	<link href="http://localhost/jsp_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- jQuery CDN(Contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	 <!-- bootstrap -->
	<script src="http://localhost/jsp_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
	
<style type = "text/css">

</style>

<script type="text/javascript">

</script>
</head>
<body>
<div>
<%
request.setCharacterEncoding("UTF-8");
AdminReviewDAO aDAO = AdminReviewDAO.getInstance();
List<AdminReviewVO> arVO = aDAO.selectAdminReview(1, "맛");

out.print(arVO);
%>
</div>
</body>
</html>