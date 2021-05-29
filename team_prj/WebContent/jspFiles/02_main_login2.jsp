<%@page import="userDAO.MainVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.UserPageDAO"%>
<%@page import="userDAO.LoginVO"%>
<%@page import="userDAO.MemberDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/jsp/common_login.jsp" %>
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
%>

 <script type="text/javascript">
 $(function() {
		$("#mypage").click(function() {
			location.href ='15_myPage_main.jsp';
		});	
		
		$("#btn_0").click(function() {
			location.href = "02_main_login2.jsp?menu=0";
		});
		$("#btn_1").click(function() {
			location.href = "02_main_login2.jsp?menu=1";
		});
		$("#btn_2").click(function() {
			location.href = "02_main_login2.jsp?menu=2";
		});
		
		$("#logout").click(function() {
			$("#frmOut").submit();
		});
});

 </script>
</head>
<body>
<%@ include file="../common/template/header2.jsp" %>
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
	
<div class="btn-group btn-csc" role="group" aria-label="분류">
  <button type="button" class="btn btn-default" value="1" id="btn_1" name="btn_1">한식</button>
  <button type="button" class="btn btn-default" value="2" id="btn_2" name="btn_2">중식</button>
  <button type="button" class="btn btn-default" value="3" id="btn_0" name="btn_0">전체</button>
</div>
	
 <div class="row"> <!-- 섬네일 -->
  
  <!--  -->
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
  	<li><a href="02_main_login2.jsp?val=<%= i+1 %>&menu=<%= menu %>"><%= i+1 %></a></li>
  	<% } %>
  </ul>
</nav>
</div>
	<!-- 페이지네이션 끝 -->
	
	</div>

	<div id="rightSide">
	
	<div id="login"> <!-- 로그인창 -->
	
				<!-- 회원가입/비밀번호 찾기 -->
		<div style="text-align:center;">
		<span class="memberName"> <%= name %> 님</span> 안녕하세요.
		<form action="http://localhost/team_prj/jspFiles/01_main.jsp" method="post" name="frmOut" id="frmOut">
		<div class="btnRight"><input type="button" class="btn btn-success" value="로그아웃" id="logout" name="logout"></div>
		<input type="hidden" name="hidOut" id="hidOut" value="out"/>
		</form>  
		<br><br>
		<input type="button" id="mypage" value="마이페이지" class="btn  btn-default btn-lg" style="width:100%; height:70px;font-weight: bold; ">
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