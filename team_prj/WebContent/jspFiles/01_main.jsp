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
    <link href="http://localhost/project_2/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery CDN(Contents Delivery Network) -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- bootstrap -->
    <script src="http://localhost/project_2/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
	<!-- stlye.css -->
	<link href="http://localhost/project_2/common/css/style.css" rel="stylesheet">

 <style type="text/css">

 </style>
 <script type="text/javascript">
 
 </script>
</head>
<body>
<%@ include file="../common/template/header.jsp" %>
<div>
	<!-- main content영역-->
	<div id="slide">
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="http://localhost/project_2/common/images/banner1.png" >
    </div>
    <div class="item">
      <img src="http://localhost/project_2/common/images/banner2.png" >
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
	</div>
	<div id="main">
	<div id="leftSide">
	
<div class="btn-group" role="group" aria-label="분류">
  <button type="button" class="btn btn-default">한식</button>
  <button type="button" class="btn btn-default">중식</button>
  <button type="button" class="btn btn-default">전체</button>
</div>
	
 <div class="row"> <!-- 섬네일 -->
  <div class="col-xs-6 col-md-4"> 
  <div class="pList">
    <a href="#" class="thumbnail">
	<img src="http://localhost/project_2/common/images/p_1.png" class="img-rounded">
    </a>
	<h4><strong>고기만두</strong></h4>
	<span>7,800원</span>
  </div>
  </div>
  <!--  -->
    <div class="col-xs-6 col-md-4"> 
  <div class="pList">
    <a href="#" class="thumbnail">
	<img src="http://localhost/project_2/common/images/p_1.png" class="img-rounded">
    </a>
	<h4><strong>고기만두</strong></h4>
	<span>7,800원</span>
  </div>
  </div>
  <!--  -->
    <div class="col-xs-6 col-md-4"> 
  <div class="pList">
    <a href="#" class="thumbnail">
	<img src="http://localhost/project_2/common/images/p_1.png" class="img-rounded">
    </a>
	<h4><strong>고기만두</strong></h4>
	<span>7,800원</span>
  </div>
  </div>
    <!--  -->
    <div class="col-xs-6 col-md-4"> 
  <div class="pList">
    <a href="#" class="thumbnail">
	<img src="http://localhost/project_2/common/images/p_1.png" class="img-rounded">
    </a>
	<h4><strong>고기만두</strong></h4>
	<span>7,800원</span>
  </div>
  </div>
    <!--  -->
    <div class="col-xs-6 col-md-4"> 
  <div class="pList">
    <a href="#" class="thumbnail">
	<img src="http://localhost/project_2/common/images/p_1.png" class="img-rounded">
    </a>
	<h4><strong>고기만두</strong></h4>
	<span>7,800원</span>
  </div>
  </div>
    <!--  -->
    <div class="col-xs-6 col-md-4"> 
  <div class="pList">
    <a href="#" class="thumbnail">
	<img src="http://localhost/project_2/common/images/p_1.png" class="img-rounded">
    </a>
	<h4><strong>고기만두</strong></h4>
	<span>7,800원</span>
  </div>
  </div>

</div> 	<!-- 섬네일 끝 -->
	<!-- 페이지네이션 -->
	<div id="page">
	<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>
	<!-- 페이지네이션 끝 -->
	
	</div>

	<div id="rightSide">
	
	<div id="login"> <!-- 로그인창 -->
		<!-- id 입력폼 -->	
		<div class="form-group-lg"> 
		 <label class="sr-only" for="id">input id</label>
			<div class="input-group">
		    <div class="input-group-addon"> 아이디 </div>
		    <input type="text" class="form-control" id="id" placeholder="아이디 입력" >
		    </div>
		</div>
		<!-- pass입력폼 -->
			<div class="form-group-lg"> 
			 <label class="sr-only" for="id">input pass</label>
			<div class="input-group">
		      <div class="input-group-addon">비밀번호</div>
		      <input type="text" class="form-control" id="pass" placeholder="비밀번호 입력" >
		      </div>
			</div>
				<!-- 회원가입/비밀번호 찾기 -->
		<div style="text-align:center;">
		<span>회원가입</span>
		<span>아이디/비밀번호찾기</span>&nbsp;&nbsp;&nbsp;  
		<input type="button" value="로그인" class="btn btn-success btn-lg" style="width:140px;">
		</div>
	</div><!-- 로그인끝 -->
	<!-- 광고영역 -->
	<div id="ad"> </div>
	<div id="ad2">	</div>
	
	</div> 
	
	</div><!-- 메인끝 -->
	<%@ include file="../common/template/footer.jsp" %>
</div>
</body>
</html>