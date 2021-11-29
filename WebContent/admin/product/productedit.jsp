<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,edu.jmi.shop.dao.*,java.util.*,edu.jmi.shop.bean.*"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<%@include file="../priv.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>商城后台</title>
<jsp:include page="../../commonCss.jsp" />
<jsp:include page="../../commonJs.jsp" />
<script>
	function validate() {

		var name = document.form_productInfo.name.value;
		if (name == null || name.length == 0) {
			document.getElementById("name-error").innerHTML = '请输入商品名!';
			document.getElementById("name-error").style.display = 'block';
			return false;
		}
		return true;
	}
</script>
</head>
<%
		//1、根据传入的ID号获取商品记录
		String sId = request.getParameter("id");
		ProductDAO productDAO=new ProductDAO();
		List<Product> list=productDAO.selectById(sId);
			for(Product rp:list){
				pageContext.setAttribute("rp",rp);
		
%>
<body class="blank">
	<jsp:include page="../main/top.jsp" />
	<jsp:include page="../main/left.jsp" />

	<div id="wrapper">
		<div class="small-header transition animated fadeIn">
			<div class="content animate-panel">
				<div class="hpanel">
					<div class="panel-body">
						<div class="hpanel">
							<ul class="nav nav-tabs">
								<li class="active"><a id="liProduct" data-toggle="tab"
									href="#tab-1">商品信息</a></li>

							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">
									<form name="form_productInfo" action="${pageContext.request.contextPath}/admin/product/producteditpost.jsp"
										method="POST" onsubmit="return validate();">
										<input type="hidden" name="id" value="<%=sId%>" />
										<div class="row" style="padding: 20px">
											<div class="row">
												<div class="form-group col-lg-6">
													<label>商品名称</label> <input name="name" class="form-control"
														type="text" placeholder="商品名称"
														value="${rp.name}" /> <label
														id="name-error" class="error" for="name"
														style="display: none;"></label>
												</div>
												<div class="form-group col-lg-6">
													<label>所属分类</label> <select class="form-control"
														name="categoryId">
														<%
														ProductCategoryDAO productCategoryDAO=new ProductCategoryDAO();
														List<ProductCategory> list1=productCategoryDAO.selectAll();
														for(ProductCategory p:list1){
															pageContext.setAttribute("p",p);
																
														%>
														<option value="${p.id}"
														<c:if test="${rp.categoryId==p.id}">
															selected</c:if>>${rp.name}</option>
														<%}%>
													</select>
												</div>
											</div>
											<div class="row">

												<div class="form-group col-lg-6">
													<label>市场价格</label> <input name="price"
														class="form-control" type="text" placeholder="市场价格"
														value="${rp.price/100}" />
												</div>
												<div class="form-group col-lg-6">
													<label>店内价格</label> <input name="shopPrice"
														class="form-control" type="text" placeholder="店内价格"
														value="${rp.shopPrice/100}">
												</div>
											</div>
											<div class="row">

												<div class="form-group col-lg-6">
													<label>商品库存</label> <input name="quantity"
														class="form-control" type="text" placeholder="商品库存"
														value="${rp.quantity}" />
												</div>
												<div class="form-group col-lg-6">
													<label>状态</label>
													 <select name="productStatus"
														class="form-control">
														<option value="0"
															<c:if test="${rp.productStatus==0}">
															selected</c:if>>上架</option>
														<option value="1"
															<c:if test="${rp.productStatus==0}">
															selected</c:if>>下架</option>
													</select>
												</div>

											</div>

											<div class="row">
												<div class="form-group col-lg-6">
													<label>是否热销</label>
													<div>
														<label> <input type="radio" value="0"
															class="i-checks" name="hot"
															<c:if test="${rp.hot==0}">
															checked</c:if> />&nbsp;&nbsp;非热门商品
														</label>&nbsp;&nbsp; <label> <input type="radio" value="1"
															class="i-checks" name="hot"
															<c:if test="${rp.hot==1}">
															checked</c:if> />&nbsp;&nbsp;热门商品
														</label>
													</div>
												</div>
												<div class="form-group col-lg-6">
													<label>商品概要说明</label> <input name="generalExplain"
														class="form-control" type="text" placeholder="商品概要说明"
														value="${rp.generalExplain}" />
												</div>
											</div>
										</div>
										<div class="row" style="padding: 20px">
											<div class="text-left m-t-xs">
												<button id="saveProductInfo" class="btn btn-success"
													type="submit">
													<strong>保存</strong>
												</button>
												<button id="back" class="btn btn-success" type="button"
													onclick="window.location='${pageContext.request.contextPath}/admin/product/productlist.jsp'">
													<strong>返回</strong>
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%}%>
</html>