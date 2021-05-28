<%@page import="adminDAO.MainManagerVO"%>
<%@page import="adminDAO.AdminProductDAO"%>
<%@page import="adminDAO.AdminMemberVO"%>
<%@page import="adminDAO.AdminMemberDAO"%>
<%@page import="adminDAO.AdminReviewVO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="adminDAO.AdminReviewDAO"%>
<%@page import="adminDAO.LoginVO"%>
<%@page import="adminDAO.AdminLoginDAO"%>
<%@page import="userDAO.ProductReviewVO"%>
<%@page import="userDAO.ProductVO"%>
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
	
	<% } 
	
	ProductVO pVO = upDAO.selectProduct(1);
	
	%>
	<br/>
	---------------------------------------------------------------------
	<br/>
	<%= pVO.getP_name() %> <%= pVO.getP_amount() %> <%= pVO.getP_cooktime() %> <%= pVO.getP_main_img() %> <%= pVO.getP_price() %> <%= pVO.getS_type() %>
	<br/>
	<br/>
	---------------------------------------------------------------------
	<br/>
	<%
		List<ProductReviewVO> list2 = upDAO.selectReviewList(3);
	
		for (ProductReviewVO vo: list2) { %>
		
		<%= vo.getR_title() %>/ <%= vo.getR_content() %>/ <%= vo.getR_score() %>점/ <%= vo.getR_date() %> <br/>
	<% } %>
	<br/>
	---------------------------------------------------------------------
	<br/>
	
	<%
		AdminLoginDAO alDAO = AdminLoginDAO.getInstance();
	
		LoginVO lVO = new LoginVO("admin", "ad123");
	
		boolean chk = alDAO.selectLogin(lVO);
	%>
	<%= chk %> <br/>
	<br/>
	---------------------------------------------------------------------
	<br/>
	<%
	AdminReviewDAO arDAO = AdminReviewDAO.getInstance();
		
	List<AdminReviewVO> list3 = arDAO.selectAdminReview(1, "맛");
	
	for (AdminReviewVO aVO : list3) {%>
	
	<%= aVO.getM_name() %>
	<% } %>
	
	<br/>
	<br/>
	-------------------------------------------------<br/>
	<%
	
	AdminMemberDAO amDAO = AdminMemberDAO.getInstance();
	
	List<AdminMemberVO> adminMemberList = amDAO.selectAdminMember(2, "정");
			
	for (int i = 0; i < adminMemberList.size(); i++) {%>
	
	<%= adminMemberList.get(i).getM_id() %>
	
	<% } %>
	<br/>
	<br/>
	-------------------------------------------------<br/>
	<%
	
		AdminProductDAO apDAO = AdminProductDAO.getInstance();
	
		List<MainManagerVO> mmList = apDAO.selectMainPage(2, "2");
		
		for (MainManagerVO vo : mmList) {
	%>
	
		<%= vo.getP_name() %>
	
	<% } %>

</div>
</body>
</html>
