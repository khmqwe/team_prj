<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>리뷰수정</title>
	

	
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
	$("#review_del").click(function() {
		window.open("30_productRemove.jsp","삭제","width=610px,height=410px");
	})
	
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
		<div><h1 style= "font-weight: bold;">리뷰관리</h1></div>
		<form action="" method="post" id="reFrm" > 
		<div><hr class = "hr_a"/><br/></div>
		<div>
			<table border = "1" cellspacing = "0" bordercolor = "#B4B4B4"  style = "width : 800px ; height : 600px ;margin: auto ">
				<tr>
					<td  class = "title_btn">작성자이름</td>
					<td ><input type = "text" id="name" name="name"  placeholder = "이름"  style = "width : 200px; height : 30px;" readonly> </td>
					<td  class = "title_btn">작성자아이디</td>
					<td ><input type = "text" id="id" name="id" placeholder = "아이디" style = "width : 200px; height : 30px;" readonly> </td>
				</tr>
				<tr>
					<td class = "title_btn">평점</td>
					<td>★ </td>
					<td class = "title_btn"> 작성일 </td>
					<td>2021-05-15</td>
				</tr>
				
				<tr>
					<td class = "title_btn" >구매상품</td>
					<td colspan = "3"><input type = "text" id="p_name" name="p_name" placeholder = "구매상품이름" style = "width : 600px ; height : 30px" readonly></td>
				</tr>
				<tr>
					<td class = "title_btn" >리뷰제목</td>
					<td colspan = "3"><input type = "text" id="re_title" name="re_title" placeholder = "리뷰제목" style = "width : 600px ; height : 30px" readonly></td>
				</tr>
				<tr>
					<td class = "title_btn" >리뷰내용</td>
					<td colspan = "3"><input type = "text" id="re_text" name="re_text" placeholder = "리뷰내용" style = "width : 600px ; height : 300px" readonly></td>
				</tr>
				
				</table>
				
				<br/>	<br/>
		</div>
		
		<div class = "button_div">
			<input type = "button" class = "btn btn-primary" value = "삭제" id="review_del" style="width:80px;height:40px; font-weight:bold;" >
			<a href="31_reviewList.jsp"><input type = "button" class = "btn btn-default"value = "목록" style = "border: 0.5px solid #dfdfdf"></a>
		</div>
		</form>
	</div>
</div>
</body>
</html>