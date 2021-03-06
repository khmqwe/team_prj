<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="adminDAO.MemberVO"%>
<%@page import="adminDAO.AdminMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원정보수정</title>
	

	<!-- bootstrap -->
	<link href="http://localhost/team_prj/common/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- jQuery CDN(Contents Delivery Network) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	 <!-- bootstrap -->
	<script src="http://localhost/team_prj/common/bootstrap-3.3.2/js/bootstrap.min.js"></script>
	<!-- style CSS -->
	<link href="http://localhost/team_prj/common/css/admin_style.css" rel="stylesheet" type="text/css">
		
	
<style type = "text/css">

</style>

<script type="text/javascript">
$(function() {
	/* //삭제버튼
	$("#member_del").click(function() {
		window.open("26_memberRemove.jsp","삭제","width=610px,height=410px");
	}); */
	//확인버튼
	$("#submitBtn").click(function() {
		$("#mFrm").submit();
	});
});

function idDelete(delID){
	window.open("26_memberRemove.jsp? m_id = " + delID ,"삭제" , "width=610px,height=410px");
}

</script>
</head>
<%
/* 	request.setCharacterEncoding("UTF-8"); */
 	AdminMemberDAO amDAO = AdminMemberDAO.getInstance();

  	String id = request.getParameter("m_id");
	MemberVO mVO = amDAO.selectAdminMember(id);
	String[] telArr = mVO.getM_telnum().split("-");
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-mm-dd"); 


 %> 
<body>
<div class = "container">
	<div class = "left_bar">
		<div class = "left_box" >
		<a href="27_productList.jsp"> 
		<button type="button" class="btn btn-default" style = " width : 150px; height : 50px; font-size: 22px; font-weight: bold; border-radius: 7px;">상품관리</button>
		</a>
		</div>
		
		<div class = "left_box">
		<a href="31_reviewList.jsp"> 
		<button type="button" class="btn btn-default" style = " width : 150px; height : 50px; font-size: 22px; font-weight: bold; border-radius: 7px;">리뷰관리</button>
		</a>
		</div>
		
		<div class = "left_box">
		<a href="24_memberList.jsp"> 
		<button type="button" class="btn btn-default" style = " width : 150px; height : 50px; font-size: 22px; font-weight: bold; border-radius: 7px;">회원관리</button>
		</a>
		</div>
		<div class = "logout"><button type="button" class="btn btn-default" style = " width : 120px; height : 40px; font-weight: bold;">관리자로그아웃</button></div>
	</div>
	
	
	<div class = "right_bar">
	<form action="24_memberList.jsp" method="post" id="mFrm" > 
		<div><h1 style= "font-weight: bold;">회원관리</h1></div>
		<div><hr class = "hr_a"/><br/></div>
		<div>
			<table border = "1" cellspacing = "0" bordercolor = "#B4B4B4"   style = "width : 800px ; height : 600px ; margin: auto; border-radius: 20px;">
				<tr>
					<td class = "title_25" >아이디</td>
					<td colspan = "3"  id="id"  style="padding-left:30px; text-align: left;">
					<%=id%></td>
				</tr>
				<tr>
					<td class = "title_25">이름</td>
					<td  style="padding-left:30px; text-align: left;">
					<input type = "text"  id="name" name="name"   placeholder = "이름" value = "<%=mVO.getM_name() %>" style = "width : 300px; height : 30px;"> </td>
					<td class = "title_25"> 가입일 </td>
					<td><input type = "text"  id="name" name="date"   placeholder = "가입일" value = "<%=mVO.getM_date() %>" style = "width : 300px; height : 30px;"> </td>
				</tr>
				<tr>
					<td class = "title_25">이메일</td>
					<td colspan = "3"  style="padding-left:30px; text-align: left;">
					<input type = "text" id="email" name="email"  placeholder = "이메일을 입력해주세요"  value = "<%=mVO.getM_email() %>" style = "width : 400px; height : 30px;"></td>
				</tr>
				<tr>
					<td class = "title_25">휴대폰번호</td>
					<td colspan = "3"  style="padding-left:30px; text-align: left;">
					
					<input type = "text"  id="tel1" name="tel1"  style = "width : 60px; height : 30px;"  value="<%= telArr[0] %>"> - 
					<input type = "text"  id="tel2" name="tel2" style = "width : 60px;  height : 30px;"  value="<%= telArr[1] %>" > - 
					<input type = "text"  id="tel3" name="tel3" style = "width : 60px;  height : 30px;"  value="<%= telArr[2] %>" ></td>
				</tr>
				<tr >
					<td class = "title_25">주소</td>
					<td colspan = "3"  style="padding-left:30px; text-align: left;">
					<input type = "text" id="zipcode" name="zipcode" placeholder = "우편번호" value="<%= mVO.getM_zipcode() %>" style = "width : 100px; height : 30px;">
					<input type = "text" id="addr" name="addr" placeholder = "주소"  value="<%= mVO.getM_add_address() %>" style = "width : 550px; height : 30px;"><br/><br/>
					<input type = "text" id="addAddr" name="addAddr" placeholder = "상세주소"  value="<%= mVO.getM_add_address() %>"  style = "width : 650px; height : 30px;">
					</td>
				</tr>
				<tr>
					<td class = "title_25">메모</td>
					<td colspan = "3"  style="padding-left:30px; text-align: left;">
					<input type = "text" id="memo" name="memo" placeholder = "내용을 입력해주세요" value="<%= mVO.getM_memo() %>" style = "width : 650px ; height : 120px"></td>
				</tr>
			</table>
		</div>
		<div >
		<br>
			<input type = "button"  class = "btn btn-primary" id="submitBtn" value = "확인" style="width:80px;height:40px; font-weight:bold;" >
			<input type = "button"class = "btn btn-default" id="member_del" value = "삭제" onclick = "idDelete('<%=mVO.getM_id() %>')" style = "background-color: #dfdfdf" >
			<a href = "24_memberList.jsp"><input type = "button"class = "btn btn-default"value = "목록" style = "border: 0.5px solid #dfdfdf"></a>
		</div>
	</form>	
	</div>


</div>

</body>
</html>