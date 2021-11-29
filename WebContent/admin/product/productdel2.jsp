<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../priv.jsp" %>
<%@ page import="java.util.regex.*,java.sql.*,edu.jmi.shop.dao.ProductDAO" %>
<%
	String sName=request.getParameter("name");
	ProductDAO productDAO =new ProductDAO();
    if (productDAO.deletebyName(sName)==true){
    	response.sendRedirect(request.getContextPath()+"/admin/product/productlist.jsp");
    }else{
    	request.getRequestDispatcher(request.getContextPath()+"/admin/product/productlist.jsp").forward(request,response);
    }
%>

