<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../priv.jsp" %>
<%@ page import="java.util.regex.*,java.sql.*,edu.jmi.shop.dao.ProductCategoryDAO" %>

<%	String sName = request.getParameter("name");
	String sDescription = request.getParameter("description");
if (sName==null   || sName.matches("^.{1,100}$")==false){
	request.getRequestDispatcher("productCategoryedit.jsp").forward(request,response);
	return;
} 
if (sDescription==null   || sDescription.matches("^.{1,200}$")==false){
	request.getRequestDispatcher("productCategoryedit.jsp").forward(request,response);
	return;
} %>
<jsp:useBean id="productCategoryadd" class="edu.jmi.shop.bean.ProductCategory"/>
<jsp:setProperty property="*" name="productCategoryadd"/>
<% 
	Object a=session.getAttribute("userid");
	ProductCategoryDAO productCategoryDAO=new ProductCategoryDAO();
if (productCategoryDAO.insert(productCategoryadd,a)==true){
	response.sendRedirect(request.getContextPath()+"/admin/productCategory/productCategoryList.jsp");
}else{
	request.getRequestDispatcher(request.getContextPath()+"/admin/productCategory/productCategoryList.jsp").forward(request,response);
}	
%>
