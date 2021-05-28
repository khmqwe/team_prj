<%@page import="userDAO.ProductDetailVO"%>
<%@page import="userDAO.ProductVO"%>
<%@page import="userDAO.MainVO"%>
<%@page import="java.util.List"%>
<%@page import="userDAO.UserPageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserPageDAO updao =UserPageDAO.getInstance();

	/* ProductVO pvo =updao.selectProduct(1);
	out.print(pvo.getP_amount()); */
	
	 ProductDetailVO pvo=updao.selectProductDetail(1);
	 out.print(pvo.getP_detailes_img());
%>	
	
	
	