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
 <script type="text/javascript">
 
 </script>
</head>
<body>
<div>
<!--header-->
<%@ include file="../common/template/header.jsp" %>
<div class="content">
<div class="thumb-img">
<img src="https://sjnfzdfjrjgl1655541.cdn.ntruss.com/goods/3/2021/05/729_tmp_ba0e1cf9a11e544280702e8f1b0e9d982846view.jpg" width="500px"; height="500px";>
</div>
<div style="margin-left:30px">
<h2 class="title"><strong>편스토랑 돈규볶음</strong></h2>
<h3 class="title">6000원</h3>
</div>			
	<div class="cooktime">
	조리시간
	</div>
	<div class="cooktime">
	음식용량
	</div>
	<div class="cooktime">
	음식보관방법
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
	<strong>총 금액 30,000원</strong>
	<input type="button" value="구매" class="btn btn-success btn-lg" style="width:150px; margin-left:50px;"/>
	</div>
	
	<div style="text-align:center;font-size:18px;font-weight:bold; margin-top:70px;">
	<ul class="nav nav-tabs nav-justified" >
		<li role="presentation" ><a href="#" style="color:#666;">상품상세</a></li>
		<li role="presentation" class="active"><a href="#" >리뷰</a></li>
	</ul>
	</div>
	<div class="review-title">
	<strong>리뷰</strong>
	<span style="float:right;"><input type="button" value="리뷰쓰기" class="btn btn-default"/></span>
	</div>
	<!-- <div style="border:solid 1px; width:1200px;"> -->
	<hr align="left" class="hr-type2">
	<div class="review-score">
	별점☆☆☆☆☆ 5/n점
	</div>
    <div class="review-cnt">1건</div>
	<hr align="left" class="hr-type2">
</div>
<div style="clear: both;"></div>

<!--footer-->
<%@ include file="../common/template/footer.jsp" %>
</div>
</body>
</html>