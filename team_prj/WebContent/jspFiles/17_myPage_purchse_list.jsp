<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
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
<link href="http://localhost/team_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet"/>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://localhost/team_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
	<!-- stlye.css -->
<link href="http://localhost/team_prj/common/css/style.css" rel="stylesheet">
<style type="text/css">

</style>

<script type="text/javascript">
$(function() {
	$("input[name=write_review]").click(function() {
		window.open("18_pop_review.jsp","idchk","width=600px,height=800px");
	});
});
</script>

</head>
<body>
<%
	String pageNum = request.getParameter("p");
	final int LEN = 2;
	if (pageNum == null) {
		pageNum = "0";
	}
	
	int pageIntNum = 2 * Integer.parseInt(pageNum);
	
	String id = request.getParameter("hid_id");
	String[] img = {"icon1.png", "icon2.png", "icon3.png", "img1.png", "img2.png"};
	String[] name = {"닭갈비", "왕돈까스", "매운카레", "호호호떡", "맛난곱창"};
	String[] price = {"12900", "8900", "6000", "3300", "11900"};
	String[] date = {"2021.05.10", "2021.04.23", "2021.04.20", "2021.04.19", "2021.04.02"};
	
	int end = (pageIntNum + LEN < name.length)? LEN: name.length-pageIntNum;
	String[] img_v = new String[end];
	String[] name_v = new String[end];
	String[] price_v = new String[end];
	String[] date_v = new String[end];
	
	for (int i = pageIntNum, j = 0; i < pageIntNum + end; i++, j++) {
		img_v[j] = img[i];
		name_v[j] = name[i];
		price_v[j] = price[i];
		date_v[j] = date[i];
	}
	
	int page_length = (int)Math.ceil(name.length / 2.0);
	
%>
<!--header-->
<%@ include file="../common/template/header.jsp" %>
<div class="mypage">
	<div class="menu__left">
		<div class="menu__left__name">
		My Page
		</div>
		<div class="menu__left__list">
			<ul>
			<li class="list"><a class="list__info" href="https://www.naver.com">구매목록</a></li>
			<li class="list"><a class="list__info">내가 쓴 후기</a></li>
			<li class="list"><a class="list__info">회원정보 수정</a></li>
			</ul>
		</div>
	</div>
	<div class="menu__right">
		<div class="p__lookup">
		<form class="form-inline">
			<input style="width: 80px;" type="text" placeholder="년" class="input form-control"/>년&nbsp;&nbsp;
			<input style="width: 60px;" type="text" placeholder="월" class="input form-control"/>월&nbsp;&nbsp;
			<input style="width: 60px;" type="text" placeholder="일" class="input form-control"/>일 
			&nbsp;~&nbsp;
			<input style="width: 80px;" type="text" placeholder="년" class="input form-control"/>년&nbsp;&nbsp;
			<input style="width: 60px;" type="text" placeholder="월" class="input form-control"/>월&nbsp;&nbsp;
			<input style="width: 60px;" type="text" placeholder="일" class="input form-control"/>일
			<input type="button" value="조회하기" class="btn_lookup btn btn-default"/>
		</form>
		</div>
		<div class="p__name">
			구매목록
		</div>
		<div class="p__table">
			<table class="table" style="border-bottom: 1px solid #dfdfdf;">
				<% for (int i = 0; i < name_v.length; i++) { %>
				
				<tr>
					<td style="text-align: center;"><img alt="상품사진" src="../common/images/<%= img_v[i] %>" class="p__img"/></td>
					<td style="vertical-align: middle;"><%= name_v[i] %><br/><%= price_v[i] %>원</td>
					<td style="vertical-align: middle;">구매일자<br/><%= date_v[i] %></td>
					<td style="vertical-align: middle;"><input type="button" value="후기쓰기" class="btn btn-default" name="write_review"></td>
				</tr>
				
				<% } %>
				
			</table>
		</div>
		<div class="p__list">
			<ul class="pagination">
				<%for (int i = 0; i < page_length; i++) {%>
						
			    <li><a href="17_myPage_purchse_list.jsp?p=<%=i%>" style="color:#3B8841"><%= i+1 %></a></li>
						
				<% } %>
				
			</ul>
		</div>
	</div>
</div>
<!--footer-->
<%@ include file="../common/template/footer.jsp" %>
</body>
</html>
