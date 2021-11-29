<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../priv.jsp" %>
<%@ page import="java.util.regex.*,java.sql.*,edu.jmi.shop.dao.*" %>

<%

    //1.提取表单数据
    String sId=request.getParameter("id");
	String sName = request.getParameter("name");
	String sCategory = request.getParameter("categoryId");
	String sPrice = request.getParameter("price");
	String sShopPrice = request.getParameter("shopPrice");
	String sQuantity = request.getParameter("quantity");
	String sProductStatus = request.getParameter("productStatus");
	String sHot = request.getParameter("hot");
	String sGeneralExplain = request.getParameter("generalExplain");

	//2.表单数据验证
	if (sName==null   || sName.matches("^.{1,100}$")==false){
		request.getRequestDispatcher("productedit.jsp").forward(request,response);
		//getRequestDispatcher这一步之前的工作是对提交的request做处理，这一步（这句话）是表示：处理完了，分发到下一个JSP页面或者下一个Action继续处理。
		return;
	}
	if (sCategory==null   || sCategory.matches("^\\d{1,7}$")==false){
		request.getRequestDispatcher("productedit.jsp").forward(request,response);
		return;
	}
	if (sPrice==null   || sPrice.matches("^\\d{1,7}(\\.\\d{1,2})?$")==false){
		request.getRequestDispatcher("productedit.jsp").forward(request,response);
		return;
	}
	if (sShopPrice==null   || sShopPrice.matches("^\\d{1,7}(\\.\\d{1,2})?$")==false){
		request.getRequestDispatcher("productedit.jsp").forward(request,response);
		return;
	}
	if (sQuantity==null   || sQuantity.matches("^\\d{1,7}$")==false){
		request.getRequestDispatcher("productedit.jsp").forward(request,response);
		return;
	}
	if (sProductStatus==null   || sProductStatus.matches("^[01]$")==false){
		request.getRequestDispatcher("productedit.jsp").forward(request,response);
		return;
	}
	if (sHot==null   || sHot.matches("^[01]$")==false){
		request.getRequestDispatcher("productedit.jsp").forward(request,response);
		return;
	}
	int price=(int)Double.parseDouble(sPrice)*100;
	int shopPrice=(int)Double.parseDouble(sShopPrice)*100;
%>	
<jsp:useBean id="product" class="edu.jmi.shop.bean.Product"/>
<jsp:setProperty property="*" name="product"/>

<%	
		ProductDAO productDAO=new ProductDAO();
	if (productDAO.Update(product,sId)==true){
		response.sendRedirect(request.getContextPath()+"/admin/product/productlist.jsp");
	}else{
	request.getRequestDispatcher(request.getContextPath()+"/admin/product/productedit.jsp").forward(request,response);
	}	

	
	
%>
