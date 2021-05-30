<%@page import="userDAO.ProductVO"%>
<%@page import="userDAO.UserPageDAO"%>
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
    <link href="http://localhost/team_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery CDN(Contents Delivery Network) -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- bootstrap -->
    <script src="http://localhost/team_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
	<!-- stlye.css -->
	<link href="http://localhost/team_prj/common/css/style.css" rel="stylesheet">
 <style type="text/css">

 </style>
<%-- <%
	String num=request.getParameter("p_num");
	int intNum=Integer.parseInt(num);
	request.setCharacterEncoding("UTF-8");
	UserPageDAO upDAO=UserPageDAO.getInstance();
	ProductVO pVO=new ProductVO();
	pVO=upDAO.selectProduct(intNum);
	%> --%>
 
 
 <script type="text/javascript">
 $(function() {
		$("#buy").click(function() {
			$("#p_Frm").submit();
		});
	});//ready
 </script>
</head>
<body>
<div>
<!--header-->
<%@ include file="../common/template/header.jsp" %>
<div class="content">
<form action="14_buyCheck.jsp" method="post" id="p_Frm"> 
<div class="thumb-img">
<img src="https://sjnfzdfjrjgl1655541.cdn.ntruss.com/goods/3/2021/05/729_tmp_ba0e1cf9a11e544280702e8f1b0e9d982846view.jpg" width="500px"; height="500px";>
</div>
<div style="margin-left:30px">
<h2 class="title"><strong>편스토랑 돈규볶음<%-- <%=pVO.getP_name() %> --%></strong></h2>
<h3 class="title">6000원<%-- <%=pVO.getP_price()% --%></h3>
</div>			
	<div class="cooktime">
	조리시간<%-- <%=pVO.getP_cooktime() %> --%>
	</div>
	<div class="cooktime">
	음식용량<%-- <%=pVO.getP_amount() %> --%>
	</div>
	<div class="cooktime">
	음식보관방법<%-- <%=pVO.getS_type() %> --%>
	</div>
	<hr align="left" style="border: solid 1px #ccc; width: 550px;">
	<div class="info-menu" >
	<strong>배송정보</strong>
	</div>
	<div class="info-menu" >
	당일배송
	</div>
	<div class="info-menu" >
	<strong>배송비</strong>
	</div>
	<div class="info-menu" >
	3000원
	</div>
	<div class="info-time" >
	밤 12시까지 주문시~시까지 도착
	</div>
		<hr align="left" style="border: solid 1px #ccc; width: 550px;">
	<div style="text-align: left;">
	</div>
	<div class="total-price">
	<input type="button" value="-"/>
	<input type="text" class="" placeholder="수량" style="width:100px;height:40px;" />
	<input type="button" value="+"/> &nbsp;&nbsp;
	<strong>총 금액 30,000<%-- <%=pVO.getP_price() %> --%>원</strong>
	<input type="button"  id="buy" value="구매" class="btn btn-success btn-lg" style="width:150px; margin-left:50px;"/>
	</div>
	<div style="text-align:center;font-size:18px;font-weight:bold; margin-top:70px;">
	<ul class="nav nav-tabs nav-justified" >
			<li role="presentation" class="active"><a href="#">상품상세</a></li>
			<li role="presentation" ><a href="http://localhost/team_prj/jspFiles/13_product_review.jsp" style="color:#666;">리뷰</a></li>
	</ul>
	</div>
	<hr align="left" class="hr-type2">
	<div>
	<div class="product-detail-img">
		<img src="https://sjnfzdfjrjgl1655541.cdn.ntruss.com/editor/goods/3/2021/05/729_55cc285025b70963107e3a528ddec7a21656234.jpg">
	</div>
	</div>
	
</form>
</div>
<div style="clear: both;"></div>
<!--footer-->
<%@ include file="../common/template/footer.jsp" %>
</div>
</body>
</html>