<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원관리</title>
	
	
	
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
	$("#modify_btn").click(function() {
		location.href="25_memberManage.jsp";
	});
	
	
});
</script>
</head>
<body>


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
	
	<div class = "right_bar">
		<div><h1 style= "font-weight: bold;">회원관리</h1></div>
		<div><hr class = "hr_a"/><br/></div>
		
		<div >
			 <select name = "search" size = "0" style = "width : 130px; height : 35px; font-size: 15px;">
				<option value = "m_id">회원아이디</option>
				<option value = "m_name">회원명</option>
			</select>
			 <input type="text" style = "width : 150px; height : 35px;"  />
			 <input type="button" class = "btn btn-primary" value = "검색" style = "width : 100px; height : 35px; font-size: 18px; "/><br/>
		</div>
		
		<div class = "table">
			<table border = "1" cellspacing = "0" bordercolor = "#B4B4B4" class = "table table-striped"
			 style = "width : 800px ; height : 500px ; margin: auto ">
			<tr class = "content_title">
				<td width = 50px;>번호</td>
				<td width = 150px;>아이디</td>
				<td width = 100px;>이름</td>
				<td width = 200px;>회원가입일</td>
				<td width = 80px;>관리</td>
			</tr>
			<%for(int i=0;i<8;i++){ %>
			<tr>
				<td><%=i%></td>
				<td>아이디 값</td>
				<td> 이름 값 </td>
				<td>회원가입일</td>
				<td><input type = "button" value = "수정" class = "btn btn-primary" id="modify_btn" ></td>
			</tr>
			<%} %>
			
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


</div>

</body>
</html>