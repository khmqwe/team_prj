<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>상품추가</title>
	

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

</script>
</head>
<body>
<div class = "container">
	<div class = "left_bar">
		<div class = "left_box"><button type="button" class="btn btn-default" style = " width : 150px; height : 50px; font-size: 22px; font-weight: bold; border-radius: 7px;">상품관리</button></div>
		<div class = "left_box"><button type="button" class="btn btn-default" style = " width : 150px; height : 50px; font-size: 22px; font-weight: bold; border-radius: 7px;">리뷰관리</button></div>
		<div class = "left_box"><button type="button" class="btn btn-default" style = " width : 150px; height : 50px; font-size: 22px; font-weight: bold; border-radius: 7px;">회원관리</button></div>
		<div class = "logout"><button type="button" class="btn btn-default" style = " width : 120px; height : 40px; font-weight: bold;">관리자로그아웃</button></div>
	</div>
	
	<div class = "right_bar">
		<div><h1 style= "font-weight: bold;">상품추가</h1></div>
		<div><hr class = "hr_a"/><br/></div>
			<table border = "1" cellspacing = "0" bordercolor = "#B4B4B4" style = "width : 800px ; height : 150px ; margin: auto ">
				<tr>
					<td  class = "title_btn" width = 120px>상품명</td>
					<td colspan = "3" style="padding-left:30px; text-align: left;"><input type = "text"  placeholder = "상품명을 입력해주세요." style = "width : 300px; height : 30px;  "> </td>
				</tr>
				<tr>
					<td class = "title_btn" width = 120px>상품금액</td>
					<td style="padding-left:30px; text-align: left;"><input type = "text"  placeholder = "금액" style = "width : 300px; height : 30px;"> </td>
					<td class = "title_btn"> 상품분류 </td>
					<td>
						<select name = "search" size = "0" style = "width : 100px; height : 35px;">
						<option >----------</option>
						<option >중식</option>
						<option >한식</option>
						</select> 
					</td>
				</tr>
				</table>
				
				<br/>	
				
				<table border = "1" cellspacing = "0" bordercolor = "#B4B4B4" style = "width : 800px ; height : 75px ; margin: auto ">
					<tr >
						<td class = "title_btn">조리시간</td>
						<td><input type = "text"  placeholder = "시간입력" style = "width : 150px; height : 30px;"> </td>
						<td class = "title_btn"> 음식용량 </td>
						<td><input type = "text"  placeholder = "용량입력" style = "width : 150px; height : 30px;"> </td>
						<td class = "title_btn">음식보관법</td>
						<td>
							<select name = "storage" size = "0" style = "width : 100px; height : 35px;">
								<option >----------</option>
								<option>냉동</option>
								<option>냉장</option>
								<option>실온</option>
							</select> 
						</td>
					</tr>
				</table>
				
				<br/>	
				
				<table border = "1" cellspacing = "0" bordercolor = "#B4B4B4" style = "width : 800px ; height : 120px ; margin: auto ">
					<tr>
						<td class = "title_btn" width = 120px>썸네일이미지</td>
						<td><input type ="file"></td>
					</tr>
					<tr>
						<td class = "title_btn" width = 120px>상품이미지</td>
						<td><input type ="file"></td>
					</tr>
					<tr>
						<td class = "title_btn" width = 120px>상세이미지</td>
						<td><input type ="file"></td>
					</tr>
				</table>
				
					<br/>	
				<table border = "1" cellspacing = "0" bordercolor = "#B4B4B4" style = "width : 800px ; height : 150px ; margin: auto ">
					<tr>
						<td class = "title_btn" width = 120px>설명</td>
						<td colspan = "3"><input type = "text" placeholder = "내용을 입력해주세요" style = "width : 600px ; height : 120px"></td>
					</tr>
				</table>
		<br>
		<div >
			<input type = "button" class = "btn btn-primary" value = "추가" style="width:80px;height:40px; font-weight:bold;">
			<a href = "27_productList.jsp"><input type = "button" class = "btn btn-default" value = "목록"  style = "border: 0.5px solid #dfdfdf"></a>
		</div>
	
	
	</div>
</div>
</body>
</html>