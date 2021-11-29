<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../priv.jsp" %>
<%@ page import="java.util.regex.*,java.sql.*,edu.jmi.shop.dao.ProductDAO" %>


<%
    //1.提取表单数据

	String sName= request.getParameter("name");
	String sCategory = request.getParameter("categoryId");
	String sPrice = request.getParameter("price");
	String sShopPrice = request.getParameter("shopPrice");
	String sQuantity = request.getParameter("quantity");
	String sProductStatus = request.getParameter("productStatus");
	String sHot = request.getParameter("hot");
	String sGeneralExplain = request.getParameter("generalExplain");
	//2.表单数据验证
	if (sName==null   || sName.matches("^.{1,100}$")==false){
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	if (sCategory==null   || sCategory.matches("^\\d{1,7}$")==false){
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	if (sPrice==null   || sPrice.matches("^\\d{1,7}(\\.\\d{1,2})?$")==false){
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	if (sShopPrice==null   || sShopPrice.matches("^\\d{1,7}(\\.\\d{1,2})?$")==false){
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	if (sQuantity==null   || sQuantity.matches("^\\d{1,7}$")==false){
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	if (sProductStatus==null   || sProductStatus.matches("^[01]$")==false){
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	if (sHot==null   || sHot.matches("^[01]$")==false){
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	int price=(int)Double.parseDouble(sPrice)*100;
	int shopPrice=(int)Double.parseDouble(sShopPrice)*100;	
	
%>
<jsp:useBean id="product" class="edu.jmi.shop.bean.Product"/>
<jsp:setProperty property="*" name="product"/>
<%	Object a=session.getAttribute("userid");
	product.setUpdateTime(new Date(System.currentTimeMillis()));
	ProductDAO productDAO=new ProductDAO();
if (productDAO.insert(product,a)==true){
	response.sendRedirect(request.getContextPath()+"/admin/product/productlist.jsp");
}else{
	request.getRequestDispatcher(request.getContextPath()+"/admin/product/productadd.jsp").forward(request,response);
}	
%>
