<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../priv.jsp" %>
<%@ page import="java.util.regex.*,java.sql.*,edu.jmi.shop.dao.*" %>
<jsp:useBean id="id" class="edu.jmi.shop.bean.Comments"/>
<jsp:setProperty property="*" name="id"/>
<%

	String sid=request.getParameter("id");
System.out.println(sid);
	CommentsDAO commentsDAO=new CommentsDAO();
	if (commentsDAO.Update2(sid)==true){
		response.sendRedirect(request.getContextPath()+"/admin/comments/comments.jsp");
	}else{
	request.getRequestDispatcher(request.getContextPath()+"/admin/comments/comments.jsp").forward(request,response);
	}	

	
	
%>
