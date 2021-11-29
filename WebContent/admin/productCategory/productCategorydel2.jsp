<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../priv.jsp" %>
<%@ page import="java.util.regex.*,java.sql.*,edu.jmi.shop.dao.ProductCategoryDAO" %>
<%
	String sid=request.getParameter("id");
	ProductCategoryDAO productCategoryDAO =new ProductCategoryDAO();
    if (productCategoryDAO.delete(sid)==true){
    	response.sendRedirect(request.getContextPath()+"/admin/productCategory/productCategoryList.jsp");
    }else{
    	request.getRequestDispatcher(request.getContextPath()+"/admin/productCategory/productCategoryList.jsp").forward(request,response);
    }
%>

