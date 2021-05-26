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
	<!-- stlye.css -->
<style type="text/css">

#review {
	width: 580px;
	height: 775px;
	background-color: #fff;
	margin: auto;
}

.product {
	text-align: left;
	padding-top: 40px;
	padding-left: 50px;
	
}

.review__score {
	text-align: center;
	padding-top: 30px;
	padding-bottom: 10px;
}

.review__comment {
	text-align: center;
}

#stars input {
	display: none;
}

#stars label {
	color: #ccc;
	font-size: 35px;
	cursor: pointer;
}

#stars label.on {
	color: #444;
}

.font {
	font-size: 17px;
	font-weight: bold;
}

#comment1 {
	font-size: 25px;
	font-weight: bold;
}

#comment2 {
	font-size: 17px;
}

#ta {
	padding: 10px;
	font-size: 15px;
}

#register, #cancel {
	outline: none;
	 width: 130px;
	 margin: 10px;
	 border: 0;
}

.title__name {
	background-color: #5E5E5E;
	padding: 5px 20px 5px 20px;
	font-size: 18px;
	color: #FAF7FA;
	text-align: center;
	margin-right: 10px;
	border-radius: 3px;
	height: 30px;
	font-weight: bold;
}

#title__box {
	padding-bottom: 10px;
}


table{ 
	margin: auto;
	border-collapse: separate; 
	border-spacing: 10px 20px;
}

#title {
	padding-bottom: 10px;
}

#cancel {
	background-color: #5E5E5E;
	color: #FAF7FA;
	border-radius: 3px;
	height: 33px;
}

#cancel:hover {
	background-color: #4D4D4D;
}
#cancel:active {
	background-color: #3C3C3C;
}

</style>

<script type="text/javascript">

$(function() {
	
	$('#stars label').click(function() {
		$(this).parent().children("label").removeClass("on");
		$(this).addClass("on").prevAll("label").addClass("on");
	});
	
	$('#go').click(function() {
		var txt = $(".star:checked").val();
		
		$('#ta').html(txt);
	});
	
});
</script>

</head>
<body>
<div id="review">
<div class="review__product">
	<div class="product">
		<img alt="상품사진" src="../common/images/img1.png" width=110px height=110px/>
		<span class="font" style="margin-left: 20px;">상품명</span>
	</div>
	<div style="height: 10px; background-color: #fff; margin-top: 20px;"></div>
</div>
<form action="">
<div class="review__score">
	<div id="comment1">상품은 만족하셨나요?</div>
	<div id="stars">
		<input type="radio" class="star" id="star-1" name="star" value="1">
		<label for="star-1" class="star">★</label>
		<input type="radio" class="star" id="star-2" name="star" value="2">
		<label for="star-2" class="star">★</label>
		<input type="radio" class="star" id="star-3" name="star" value="3">
		<label for="star-3" class="star">★</label>
		<input type="radio" class="star" id="star-4" name="star" value="4">
		<label for="star-4" class="star">★</label>
		<input type="radio" class="star" id="star-5" name="star" value="5">
		<label for="star-5" class="star">★</label>
		
	</div>
	<div id="comment2">어떤점이 좋으셨나요?</div>
</div>
<div class="review__comment">
	<div id="title">
		<table>
			<tr>
				<td align="left">
					<div class="title__name" style="width: 100%">제목</div>
				</td>
				<td colspan="3">
					<input type="text" name="title" style="width: 100%; font-size: 18px;"/>
				</td>
			</tr >
			<tr>
				<td colspan="4">
					<textarea rows="13" cols="60" style="resize: none;"></textarea>
				</td>
			</tr>
		</table>
		<div id="btnDiv">
			<input type="button" id="register" value="등록" class="btn btn-success"/>
			<input type="button" id="cancel" value="취소" class="btn btn-defualt"/>
		</div>
	</div>
</div>
</form>
</div>
</body>
</html>
