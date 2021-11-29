<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../priv.jsp" %>
<%@ page import="java.util.regex.*,java.sql.*,edu.jmi.shop.dao.ProductCategoryDAO" %>
<%
	String sName=request.getParameter("name");
	ProductCategoryDAO productCategoryDAO =new ProductCategoryDAO();
    if (productCategoryDAO.deletebyName(sName)==true){
    	response.sendRedirect(request.getContextPath()+"/admin/productCategory/productCategoryList.jsp");
    }else{
    	request.getRequestDispatcher(request.getContextPath()+"/admin/productCategory/productCategoryList.jsp").forward(request,response);
    }
%>

