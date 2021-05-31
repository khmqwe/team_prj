<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.sql.SQLException"%>
<%@page import="userDAO.MemberVO"%>
<%@page import="userDAO.MemberDAO"%>
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
<%
request.setCharacterEncoding("UTF-8");
MemberDAO mDAO=MemberDAO.getInstance();

String id=request.getParameter("id");
String pass=DataEncrypt.messageDigest("MD5", request.getParameter("password"));
String name=request.getParameter("name");
String email=request.getParameter("email");
String telnum=request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
String zipcode=request.getParameter("zipcode");
String address=request.getParameter("addr");
String add_address=request.getParameter("addAddr");
MemberVO mVO=new MemberVO(id,pass,name,email,telnum,zipcode,address,add_address);


try{
mDAO.insertMember(mVO);
%>
<div class="submitPage">
<h2> <strong>정은아님 가입을 축하드립니다.</strong> </h2> <br>
로그인 후에 서비스를 이용할 수 있습니다. <br><br>
<a href="07_login.jsp"><input type="button" value="확인" class="btn btn-success"></a>
</div>
 
<%
}catch(SQLException se){
	se.printStackTrace();
	%>
	죄송합니다. 글 저장에 문제가 발생하였습니다. <br>
	잠시후 다시 시도해 주세요. 
	<%
}
%>	

</div>
<!--footer-->
<%@ include file="../common/template/footer.jsp" %>
</div>
</body>
</html>