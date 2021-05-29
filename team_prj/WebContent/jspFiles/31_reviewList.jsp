<%@page import="adminDAO.AdminReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="adminDAO.ReviewVO"%>
<%@page import="adminDAO.AdminReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>리뷰목록</title>
	

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

<script type="text/javascript">
$(function() {
	$("#reBtn").click(function() {
		
	});
	
	
});
</script>
</head>
<body>
<%
AdminReviewDAO arDAO=AdminReviewDAO.getInstance();
List<AdminReviewVO> adList= arDAO.selectAdminReview(3, "");
ReviewVO rVO=new ReviewVO();
%>

<div class = "container">

	<div class = "left_bar">
		
		<div class = "left_box" >
		<a href="27_productList.jsp"> 
		<button type="button" class="btn btn-default" style = " width : 150px; height : 50px; font-size: 22px; font-weight: bold; border-radius: 7px;">상품관리</button>
		</a>
		</div>
		
		
		<div class = "left_box">
		<a href="31_reviewList.jsp"> 
		<button type="button" class="btn btn-default" style = " width : 150px; height : 50px; font-size: 22px; font-weight: bold; border-radius: 7px;">리뷰관리</button>
		</a>
		</div>
		
		<div class = "left_box">
		<a href="24_memberList.jsp"> 
		<button type="button" class="btn btn-default" style = " width : 150px; height : 50px; font-size: 22px; font-weight: bold; border-radius: 7px;">회원관리</button>
		</a>
		</div>
		
		<div class = "logout"><button type="button" class="btn btn-default" style = " width : 120px; height : 40px; font-weight: bold;">관리자로그아웃</button></div>
	</div>
		<form action="31_reviewList.jsp" method="post" id="reFrm" >
	<div class = "right_bar">
		<div><h1 style= "font-weight: bold;">리뷰관리</h1></div>
		<div><hr class = "hr_a"/><br/></div>
		
		<div >
			<select name = "search" size = "0" style = "width : 130px; height : 35px; font-size: 15px;">
				<option value = "w_id">작성자아이디</option>
				<option value = "w_title">제목</option>
			</select>
			 <input type="text"  id="reSearch" name="reSearch" style = "width : 150px; height : 35px;"  />
			 <input type="button" id="reBtn" name="reBtn" class = "btn btn-primary" value = "검색" style = "width : 100px; height : 35px; font-size: 18px; "/><br/>
		</div>
		
	
	<div class = "table">
			<table border = "1" cellspacing = "0" bordercolor = "#B4B4B4" class = "table table-striped"
			 style = "width : 800px ; height : 500px ; margin: auto ">
			<tr class = "content_title">
				<td width = 50px;>번호</td>
				<td width = 150px;>작성자아이디</td>
				<td width = 100px;>이름</td>
				<td width = 200px;>리뷰제목</td>
				<td width = 80px;>관리</td>
			</tr>
			
			<%for(int i=0;i<8;i++){ %>
			<tr>
				<td><%=i%></td>
				<td><%=adList.get(i).getM_id() %></td>
				<td><%=adList.get(i).getM_name() %></td>
				<td><%=adList.get(i).getR_title() %></td>
				<td><a href="http://localhost/team_prj/jspFiles/32_reviewRevise.jsp?o_num=<%=adList.get(i).getO_num()%>">
				<input type = "button" value = "수정" class = "btn btn-primary" >
				</a></td>
			</tr>
			<%}%>
		</table>
	</div>
		<nav>
			<ul class="pagination">
			    <li>
			      <a href="#" aria-label="Previous">
			        <span aria-hidden="true" style="color: #3B8841">&laquo;</span>
			      </a>
			    </li>
			    <li><a href="#" style="color: #3B8841">1</a></li>
			    <li><a href="#" style="color: #3B8841">2</a></li>
			    <li><a href="#" style="color: #3B8841">3</a></li>
			    <li><a href="#" style="color: #3B8841">4</a></li>
			    <li>
			      <a href="#" aria-label="Next">
			        <span aria-hidden="true" style="color: #3B8841">&raquo;</span>
			      </a>
			    </li>
			</ul>
		</nav>
	</div>
	</form>

</div>
</body>
</html>