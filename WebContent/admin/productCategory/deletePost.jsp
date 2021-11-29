<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../priv.jsp" %>
<%@ page import="java.util.regex.*,java.sql.*,edu.jmi.shop.dao.ProductCategoryDAO" %>


   
<jsp:useBean id="delete" class="edu.jmi.shop.bean.ProductCategory"/>
<jsp:setProperty property="*" name="delete"/>

<% //1.提取表单数据
//3.插入数据库	
	String sName=request.getParameter("name");
	ProductCategoryDAO productCategoryDAO =new ProductCategoryDAO();
    if (productCategoryDAO.delete(sName)==true){
    	response.sendRedirect(request.getContextPath()+"/admin/productCategory/productCategoryList.jsp");
    }else{
    	request.getRequestDispatcher(request.getContextPath()+"/admin/productCategory/productCategoryList.jsp").forward(request,response);
    }
%>