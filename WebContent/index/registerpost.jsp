<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*,edu.jmi.shop.dao.UserDAO"%>

<jsp:useBean id="user" class="edu.jmi.shop.bean.User"/>
<jsp:setProperty property="*" name="user"/>
<%
    user.setRegisterTime(new Date(System.currentTimeMillis()));
    user.setRole("ROLE_GUEST");
    UserDAO userDAO=new UserDAO();
    if (userDAO.insert(user)==true){
    	response.sendRedirect(request.getContextPath()+"/index/login.jsp");
    }else{
    	response.sendRedirect(request.getContextPath()+"/index/register.jsp");
    }
%>


<%--

	Connection c = null;
	try {

		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC", "root", "lvtaizhi");
		String sql = "insert into user(user_name,pwd,register_time,role) values(?,?,?,'ROLE_GUEST')" ;
		PreparedStatement pst = c.prepareStatement(sql);
		
		pst.setString(1, user.getUserName());
		pst.setString(2, user.getPwd());
		pst.setDate(3, new Date(System.currentTimeMillis()));
		pst.execute();
		response.sendRedirect(request.getContextPath()+"/index/login.jsp");
	} catch (Exception ex) {
		ex.printStackTrace();
		response.sendRedirect(request.getContextPath()+"/index/register.jsp");
	} finally {
		try {
			c.close();
		} catch (Exception ex) {

		}
	}

--%>
<%--productaddpost:
Connection c=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC", "root",
				"213416");
		String sql = "insert into product(name,category_id,price,shop_price,quantity,product_status,hot,general_explain,update_time,update_user_id)" +
				     "values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pst = c.prepareStatement(sql);
		pst.setString(1, sName);
		pst.setString(2, sCategory);
		pst.setInt(3, price);
		pst.setInt(4,shopPrice);
		pst.setString(5, sQuantity);
		pst.setString(6, sProductStatus);
		pst.setString(7, sHot);
		pst.setString(8, sGeneralExplain);
		pst.setDate(9, new Date(System.currentTimeMillis()));
		pst.setString(10, session.getAttribute("userid").toString());
		pst.execute();
		response.sendRedirect(request.getContextPath()+"/admin/product/productlist.jsp");
	} catch (Exception ex) {
		ex.printStackTrace();
		request.getRequestDispatcher(request.getContextPath()+"/admin/product/productadd.jsp").forward(request,response);
	} finally {
		try {
			if (c!=null){
			  c.close();
			}
		} catch (Exception ex) {

		}
	}
	
	
--%>

<%--Connection c=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC", "root",
				"213416");
		String sql = "delete from product where id=?";
		String sId=request.getParameter("id");
		PreparedStatement pst = c.prepareStatement(sql);
		pst.setString(1,sId);
		pst.execute();
		response.sendRedirect(request.getContextPath()+"/admin/product/productlist.jsp");
	} catch (Exception ex) {
		ex.printStackTrace();
		request.getRequestDispatcher(request.getContextPath()+"/admin/product/productlist.jsp").forward(request,response);
	} finally {
		try {
			if (c!=null){
			  c.close();
			}
		} catch (Exception ex) {

		}
	}
 --%>
 <%--producteditpost
 	Connection c=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC", "root",
				"213416");
		String sql = "update product set name=?,category_id=?,price=?,shop_price=?,quantity=?,product_status=?,hot=?,general_explain=?,update_time=?,update_user_id=?  " +
				     "where id=?";
		PreparedStatement pst = c.prepareStatement(sql);
		pst.setString(1, sName);
		pst.setString(2, sCategory);
		pst.setInt(3, price);
		pst.setInt(4,shopPrice);
		pst.setString(5, sQuantity);
		pst.setString(6, sProductStatus);
		pst.setString(7, sHot);
		pst.setString(8, sGeneralExplain);
		pst.setDate(9, new Date(System.currentTimeMillis()));
		pst.setString(10, session.getAttribute("userid").toString());
		pst.setString(11,sId);
		pst.execute();
		response.sendRedirect(request.getContextPath()+"/admin/product/productlist.jsp");
	} catch (Exception ex) {
		ex.printStackTrace();
		request.getRequestDispatcher(request.getContextPath()+"/admin/product/productedit.jsp").forward(request,response);
	} finally {
		try {
			if (c!=null){
			  c.close();
			}
		} catch (Exception ex) {

		}
	} --%>
	
	<%--
	Connection c = null;
	try {

		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC", "root",
				"213416");
		//1、根据传入的ID号获取商品记录
		String sId = request.getParameter("id");
		String sql = "select * from product where id=?";
		PreparedStatement pst = c.prepareStatement(sql);
		pst.setString(1, sId);
		ResultSet rsProduct = pst.executeQuery();
		if (rsProduct.next() == false) {
			response.sendRedirect("productadd.jsp");
			return;
		} --%>
