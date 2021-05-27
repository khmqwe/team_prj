<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<!-- stlye.css -->
<link href="../common/templete/style.css" rel="stylesheet">
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
$(document).ready(function () {
	$(".reviewBox").each(function() {
		var content = $(this).children('.review-text');
		var text = content.text();
		var text_short = text.substring(0, 100) + "...";
		var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');
		console.log(content.text());
		$(this).append(btn_more);
		
		if (text.length >= 100) {
			content.html(text_short);
		} else {
			btn_more.hide();
		}
		
		btn_more.click(toggle_content);
		
		function toggle_content() {
			if ($(this).hasClass('short')) {
				$(this).html('더보기');
				content.html(text_short);
				$(this).removeClass('short');
			} else {
				$(this).html('접기');
				content.html(text);
				$(this).addClass('short');
			}
		}
	});
});
</script>

</head>
<body>
<!--header-->
<%@ include file="../common/template/header.jsp" %>

<div class="mypage">
	<div class="menu__left">
		<div class="menu__left__name">
		My Page
		</div>
		<div class="menu__left__list">
			<ul>
			<li class="list"><a class="list__info" href="17_myPage_purchse_list.jsp">구매목록</a></li>
			<li class="list"><a class="list__info" href="16_myPage_review_list.jsp">내가 쓴 후기</a></li>
			<li class="list"><a class="list__info" href="19_myPage_pass_check.jsp">회원정보 수정</a></li>
			</ul>
		</div>
	</div>
	<div class="menu__right">
		<div class="p__name">
			<h2> <strong>나의 상품후기</strong> </h2> <br>
		</div>
		<div class="p__table">
			<table class="table" style="border-bottom: 1px solid #dfdfdf; ">
				<tr>
					<td style="white-space:nowrap;">구매상품제목<br/>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					</td>
					<td class="review" style="vertical-align: middle; width: 600px;">리뷰 제목</td>
					<td style="text-align: right; vertical-align: middle;">2021.04.11</td>
				</tr>
				<tr>
					<td style="vertical-align: middle;">구매상품제목<br/>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					</td>
					<td class="review" style="vertical-align: middle; width: 600px;">
					<div class="reviewBox">
						<div class="review-text">
						리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 
						내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 내용리뷰 
						내용리뷰 내용리뷰 내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용
						내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용
						내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용
						내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용내용리뷰 내용
						</div>
					</div>
					</td>
					<td style="text-align: right; vertical-align: middle;">2021.05.01</td>
				</tr>
			</table>
		</div>
		<div class="p__list">
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
		</div>
	</div>

</div>
<!--footer-->
<%@ include file="../common/template/footer.jsp" %>
</body>
</html>
