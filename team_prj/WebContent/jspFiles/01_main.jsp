<%@page import="userDAO.MainVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.UserPageDAO"%>
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
 
 $(function() {
		$("#loginBtn").click(function() {
			chkNull();
		});
		
		$("#id").keydown(function(evt) {
			if (evt.which == 13) {
				chkNull();
			}
		});
		$("#pass").keydown(function(evt) {
			if (evt.which == 13) {
				chkNull();
			}
		});
		
		$("#btn_0").click(function() {
			location.href = "01_main.jsp?menu=0";
		});
		$("#btn_1").click(function() {
			location.href = "01_main.jsp?menu=1";
		});
		$("#btn_2").click(function() {
			location.href = "01_main.jsp?menu=2";
		});
	});//ready
	
function chkNull() {
		if ($("#id").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return;
		}
		if ($("#pass").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return;
		}
		$("#loginFrm").submit();
	}
 </script>
</head>

<!-- 메인페이지 메뉴 뿌리는 부분 -->
<%
	int menu = 0;
	if (request.getParameter("menu") != null) {
		menu = Integer.parseInt(request.getParameter("menu"));
	}
	UserPageDAO upDAO = UserPageDAO.getInstance();
	List<MainVO> mainList = upDAO.selectMainList(menu);
	String a = request.getParameter("menu");
	
	int pagenation = mainList.size() / 6;
	if ((mainList.size() / 6) != 0 && (mainList.size() % 6) != 0) {
		pagenation += 1;
	}
	int selectedPage = 1;
	if (request.getParameter("val") != null) {
		selectedPage = Integer.parseInt(request.getParameter("val"));
	}
	
	int listLen = 6;
	if (pagenation == selectedPage) {
		listLen = mainList.size() - ((selectedPage-1) * 6);
	}
	
	String hidOut = request.getParameter("hidOut");
	
	if (hidOut != null) {
		if (hidOut.equals("out")) {
			session.removeAttribute("name");
			session.removeAttribute("id");
		}
	}
%>
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
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
    <a href="https://www.naver.com">
      <img src="http://localhost/project_2/common/images/banner1.png" >
    </a>
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
	
<div class="btn-group btn-csc" role="group" aria-label="분류">
  <button type="button" class="btn btn-default" value="1" id="btn_1" name="btn_1">한식</button>
  <button type="button" class="btn btn-default" value="2" id="btn_2" name="btn_2">중식</button>
  <button type="button" class="btn btn-default" value="3" id="btn_0" name="btn_0">전체</button>
</div>

	<div class="row"> <!-- 섬네일 --> 
	<% for (int i=(selectedPage-1)*6; i< (selectedPage-1)*6 + listLen; i++){ %>
  <div class="col-xs-6 col-md-4"> 
  <div class="pList">
    <a href="#" class="thumbnail">
	<img src="http://localhost/team_prj/common/images/food/<%= mainList.get(i).getP_thumb_img() %>" class="img-rounded">
    </a>
	<h4><strong><%= mainList.get(i).getP_name() %></strong></h4>
  </div>
  </div>	
	<%}//end for %>
</div> 	<!-- 섬네일 끝 -->
	<!-- 페이지네이션 -->
	<div id="page">
	<nav>
  <ul class="pagination">
  	<% for (int i = 0; i < pagenation; i++) { %>
  	<li><a href="01_main.jsp?val=<%= i+1 %>&menu=<%= menu %>"><%= i+1 %></a></li>
  	<% } %>
  </ul>
</nav>
</div>
	<!-- 페이지네이션 끝 -->
	</div>

	<div id="rightSide">
	<div id="login"> <!-- 로그인창 -->
	<form action="02_main_login.jsp" method="post" id="loginFrm">
		<!-- id 입력폼 -->	
		<div class="form-group-lg">
		 <label class="sr-only" for="id">input id</label>
			<div class="input-group input-fix">
		    <div class="input-group-addon input-form"> 아이디 </div>
		    <input type="text" class="form-control" id="id" name="id" placeholder="아이디 입력" >
		    </div>
		</div>
		<!-- pass입력폼 -->
			<div class="form-group-lg"> 
			 <label class="sr-only" for="id">input pass</label>
			<div class="input-group">
		      <div class="input-group-addon">비밀번호</div>
		      <input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호 입력" >
		      </div>
			</div>
				<!-- 회원가입/비밀번호 찾기 -->
		<div style="text-align:center; margin-top: 22px;">
		<a href="03_signIn.jsp"><span>회원가입</span></a>
		<a href="08_idFind.jsp"><span>아이디/비밀번호찾기</span></a>&nbsp;&nbsp;&nbsp;  
		<input type="button" value="로그인" id="loginBtn" class="btn btn-success btn-lg" style="width:140px;">
		</div>
	</form>	
	</div><!-- 로그인끝 -->
	<!-- 광고영역 -->
	<div id="ad"> 
		<iframe class="embed-responsive-item" width="370" height="200" scrolling="no" src="http://localhost/team_prj/common/images/ad1.png"></iframe>
	</div>

	<div id="ad2" class="embed-responsive embed-responsive-4by3">
  		<iframe class="embed-responsive-item" width="370" height="310" src="http://localhost/team_prj/common/images/ad2.png"></iframe>
	</div>
	
	</div> 
	
	</div><!-- 메인끝 -->
	<%@ include file="../common/template/footer.jsp" %>
</div>
</body>
</html>