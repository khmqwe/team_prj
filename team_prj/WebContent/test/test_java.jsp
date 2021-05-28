<%@page import="adminDAO.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="adminDAO.AdminReviewVO"%>
<%@page import="adminDAO.AdminReviewDAO"%>
<%@page import="adminDAO.LoginVO"%>
<%@page import="adminDAO.AdminLoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
   AdminReviewDAO arDAO = AdminReviewDAO.getInstance();
	ReviewVO rVO = arDAO.selectAdminReview(23); 
%>
    
   <%=rVO.getM_id() %>,
   <%= rVO.getM_name() %>,
	<%=rVO.getP_name() %>,
	<%=rVO.getR_score() %>,
	<%=  rVO.getR_date() %>,
	<%= rVO.getR_title() %>,
	<%= rVO.getR_content() %>

</div>
</body>
</html>