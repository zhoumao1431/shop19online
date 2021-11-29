<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../priv.jsp" %>
<%@ page import="java.util.regex.*,java.sql.*,edu.jmi.shop.dao.*" %>

<% 

    String sId=request.getParameter("id");
    String sName = request.getParameter("name");
    String sDescription = request.getParameter("description");
    if (sName==null   || sName.matches("^.{1,100}$")==false){
    	request.getRequestDispatcher("productCategoryedit.jsp").forward(request,response);
    	return;
    } 
    if (sDescription==null   || sDescription.matches("^.{2,100}$")==false){
    	request.getRequestDispatcher("productCategoryedit.jsp").forward(request,response);
    	return;
    }
%>
<jsp:useBean id="productCategory" class="edu.jmi.shop.bean.ProductCategory"/>
<jsp:setProperty property="*" name="productCategory"/>

<%	//3.插入数据库
		ProductCategoryDAO productCategoryDAO=new ProductCategoryDAO();
	if (productCategoryDAO.Update(productCategory,sId)==true){
		response.sendRedirect(request.getContextPath()+"/admin/productCategory/productCategoryList.jsp");
	}else{
	request.getRequestDispatcher(request.getContextPath()+"/admin/productCategory/productCategoryedit.jsp").forward(request,response);
	}	

	
	
%>
