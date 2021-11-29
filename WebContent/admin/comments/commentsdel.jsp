<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../priv.jsp" %>
<%@ page import="java.util.regex.*,java.sql.*,edu.jmi.shop.dao.CommentsDAO" %>   
<jsp:useBean id="id" class="edu.jmi.shop.bean.Comments"/>
<jsp:setProperty property="*" name="id"/>
<% 
	String sid=request.getParameter("id");
	CommentsDAO commentsDAO =new CommentsDAO();
    if (commentsDAO.delete(sid)==true){
    	response.sendRedirect(request.getContextPath()+"/admin/comments/comments.jsp");
    }else{
    	request.getRequestDispatcher(request.getContextPath()+"/admin/comments/comments.jsp").forward(request,response);
    }
%>

