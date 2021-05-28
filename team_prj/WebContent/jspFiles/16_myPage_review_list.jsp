<%@page import="userDAO.MyReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.ReviewDAO"%>
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

<%

	ReviewDAO rDAO = ReviewDAO.getInstance();
	
	List<MyReviewVO> mrList = rDAO.selectMyReviewList(id);
	
	int pageCnt = mrList.size() / 4;
	if ((mrList.size() / 4) != 0 && (mrList.size() % 4) != 0) {
		pageCnt += 1;
	}
	
	String curPage = "1";
	int curPageInt = 1;
	if (request.getParameter("page") != null) {
		curPage = request.getParameter("page");
		curPageInt = Integer.parseInt(curPage);
	}
	
	int listLen = 4;
	if (pageCnt == curPageInt) {
		listLen = mrList.size() - ((curPageInt-1) * 4);
	}

%>
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
			var h = $("#menu__right").height() + 30;
			$("#mypage").css("height", h);
		}
	});
	
	if ($("#menu__right").height() > $("#mypage").height()) {
		var h = $("#menu__right").height() + 30;
		$("#mypage").css("height", h)
	}
	
});
</script>

</head>
<body>
<!--header-->
<%@ include file="../common/template/header.jsp" %>

<div class="mypage" id="mypage">
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
	<div class="menu__right" id="menu__right">
		<div class="p__name">
			<h2> <strong>나의 상품후기</strong> </h2> <br>
		</div>
		<div class="p__table">
			<table class="table" style="border-bottom: 1px solid #dfdfdf; ">
			<% for(int i = (curPageInt - 1)*4; i < (curPageInt - 1)*4 + listLen; i++) { %>
				<tr>
					<td style="white-space:nowrap;"><%= mrList.get(i).getP_name() %><br/>
					<% int empty = 5 - mrList.get(i).getR_score(); %>
					<% for (int j = 0; j < mrList.get(i).getR_score(); j++) { %>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<% } %>
					<% for (int j = 0; j < empty; j++) { %>
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					<% } %>
					</td>
					<td class="review" style="vertical-align: middle; width: 600px;"><%= mrList.get(i).getR_title() %><br/>
					<div class="reviewBox">
						<div class="review-text">
							<%= mrList.get(i).getR_comment() %>
						</div>
					</div> 
					</td>
					<td style="text-align: right; vertical-align: middle; width: 120px;"><%= mrList.get(i).getR_date().substring(0, mrList.get(i).getR_date().indexOf(" ")).replaceAll("-", ".") %> </td>
				</tr>
			<% } %>
			</table>
		</div>
		<div class="p__list">
			<ul class="pagination">
				<% for (int i = 0; i < pageCnt; i++) { %>
				    <li><a href="http://localhost/team_prj/jspFiles/16_myPage_review_list.jsp?page=<%= i+1 %>" style="color: #3B8841"><%=i+1 %></a></li>
				<% } %>
			</ul>
		</div>
	</div>
<!--footer-->
</div>
<%@ include file="../common/template/footer.jsp" %>
</body>
</html>
