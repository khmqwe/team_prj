<%@page import="userDAO.WriteReviewVO"%>
<%@page import="userDAO.ReviewDAO"%>
<%@page import="userDAO.OrderDateVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="userDAO.OrderVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.OrderDAO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/jsp/common_login.jsp" %>
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

<%
	request.setCharacterEncoding("UTF-8");	

	OrderDAO oDAO = OrderDAO.getInstance();
	List<OrderVO> oList = null;
	if (request.getParameter("calStart") == null) {
		oList = oDAO.selectOrderList(id);
	} else {
		String calStart = request.getParameter("calStart").replaceAll("-", "");
		String calEnd = request.getParameter("calEnd").replaceAll("-", "");
		OrderDateVO odVO = new OrderDateVO(id, calStart, calEnd);
		oList = oDAO.selectOrderDateList(odVO);
	}
	String pageNum = request.getParameter("p");
	final int LEN = 4;
	if (pageNum == null) {
		pageNum = "0";
	}
	
	int pageIntNum = 4 * Integer.parseInt(pageNum);
	
	int end = (pageIntNum + LEN < oList.size())? LEN: oList.size()-pageIntNum;
	String[] img_v = new String[end];
	String[] name_v = new String[end];
	boolean[] flag_v = new boolean[end];
	int[] price_v = new int[end];
	String[] date_v = new String[end];
	
	
	for (int i = pageIntNum, j = 0; i < pageIntNum + end; i++, j++) {
		img_v[j] = oList.get(i).getP_thumb_img();
		name_v[j] = oList.get(i).getP_name();
		flag_v[j] = oList.get(i).getFlag();
		price_v[j] = oList.get(i).getP_price() * oList.get(i).getO_cnt();
		date_v[j] = oList.get(i).getO_date().substring(0, oList.get(i).getO_date().indexOf(" "));
	}
	
	int page_length = (oList.size() / LEN);
	if ((oList.size() % LEN != 0) && (oList.size() / LEN != 0)) {
		page_length += 1;
	}
%>

<%

	//팝업창에서 받은값 확인
	String title = request.getParameter("title_name");
	String comment = request.getParameter("ta_name");
	
	if (title != null) {
		ReviewDAO rDAO = ReviewDAO.getInstance();
		String onum = request.getParameter("onum");
		String score = request.getParameter("star");
		if (score == null) {
			score = "0";
		}
		out.print(onum + " / " + score + " / " + title + " / " + comment);
		WriteReviewVO wrVO = new WriteReviewVO(Integer.parseInt(onum), title, comment, Integer.parseInt(score));
		
		rDAO.insertReview(wrVO);
		response.sendRedirect("http://localhost/team_prj/jspFiles/17_myPage_purchse_list.jsp");
	}
	

%>

<script type="text/javascript">
$(function() {
	
	$("#btnCal").click(function() {
		if($("#calStart").val() == "" || $("#calEnd").val() == "") {
			alert("날짜를 정확히 입력해주세요.");
			return;
		}
		$("#frmCal").submit();
	});
	
	
});

function btnClick(o_num) {
	
	var frmHid = document.frmHid;
	window.open("" ,"popupWindow","width=600px,height=800px");
	frmHid.hid_o_num.value = o_num;
	frmHid.target="popupWindow";
	frmHid.method="post";
	frmHid.action = "http://localhost/team_prj/jspFiles/18_pop_review.jsp";
	frmHid.submit();
}
</script>

</head>
<body>

<!--header-->
<%@ include file="../common/template/header2.jsp" %>
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
		<div class="p__lookup">
		<form action="http://localhost/team_prj/jspFiles/17_myPage_purchse_list.jsp" class="form-inline" id="frmCal">
			<input type="date" id="calStart" name="calStart"/>
			&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
			<input type="date" id="calEnd" name="calEnd"/>
			<input type="button" value="조회하기" id="btnCal" class="btn_lookup btn btn-default"/>
		</form>
		</div>
		<div class="p__name">
			구매목록
		</div>
		<div class="p__table">
			<table class="table" style="border-bottom: 1px solid #dfdfdf;">
				<% for (int i = 0; i < name_v.length; i++) { %>
				<tr>
					<td style="text-align: center;"><img alt="상품사진" src="http://localhost/team_prj/common/images/food/<%= img_v[i] %>" class="p__img"/></td>
					<td style="vertical-align: middle; width: 500px;"><%= name_v[i] %><br/><%= price_v[i] %>원</td>
					<td style="vertical-align: middle;">구매일자<br/><%= date_v[i] %></td>
					<td style="vertical-align: middle;">
					<% if (!flag_v[i]) { %>
							<input type="button" value="후기쓰기" class="btn btn-default" name="write_review" id="write_review" onclick="btnClick('<%= oList.get(i).getO_num() %>')"/>
					<% } %>
					</td>
				</tr>
				<% } %>
				
			</table>
			<form name="frmHid">
				<input type="hidden" name="hid_o_num" id="hid_o_num"/>
			</form>
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
