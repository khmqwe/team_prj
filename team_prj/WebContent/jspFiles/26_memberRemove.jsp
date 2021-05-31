<%@page import="adminDAO.AdminMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원삭제</title>
	

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
  <%
	AdminMemberDAO amDAO = AdminMemberDAO.getInstance();
   request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("m_id");
	
	int chk = amDAO.deleteAdminMember(id);
	String msg = "삭제되지않았습니다.";
  %> 
<script type="text/javascript">
$(function(){
	$("#del_yes").click(function(){
		if(!chk){
			msg = "삭제되었습니다.";
			alert(msg);
			window.close(); 
		}
	});
	$("#del_no").click(function(){
		window.close(); 
	});
});
</script>
</head>
<body>
	<div class = "box">
		<div class = "content">
			<h2> <strong>000회원을 삭제하시겠습니까?</strong> </h2> 
		<br/><br/><br/><br/>
		<div>
			<input type = "button"  class = "btn btn-default" id = "del_yes" value = "예">
			<input type = "button" class = "btn btn-default" id = "del_no" value = "아니오">
		</div>
		</div>
	</div>

</body>
</html>