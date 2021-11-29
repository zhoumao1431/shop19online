<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.*,edu.jmi.shop.bean.*,edu.jmi.shop.dao.*"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="utf-8" />
<title>购物平台</title>

<jsp:include page="include/common.jsp"></jsp:include>

</head>
<body class="smoothscroll enable-animation">
	<!-- wrapper -->
	<div id="wrapper">
		<jsp:include page="include/head.jsp"></jsp:include>
		<section>
			<div class="container">
				<div id='page'></div>
				<div class='row'>
					<div
						class='col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3'>
						<%
							ProductCategoryDAO productCategoryDao = new ProductCategoryDAO();
							List<ProductCategory> categoryList = productCategoryDao.selectAll();
							for(ProductCategory productCategory:categoryList){
								 ProductDAO productDao=new ProductDAO();
								List<Product> productList = productDao.selectByCategoryId(productCategory.getId(), 4);
								if (productList.size()>0){
						%>
						<%=productCategory.getName()%>
						<div class="divider divider-border divider-center">
							<!-- divider -->
							<i class="fa fa-users"></i>
						</div>
						<ul class="shop-item-list row list-inline nomargin">
							<%  
									for(Product product:productList) {
							 %>
							<!-- 产品-->
							<li class="col-lg-3 col-sm-3">
								<div class="shop-item">
									<div class="thumbnail">
										<!-- product image(s) -->
										<a class="shop-item-image"
											href="<%=request.getContextPath() %>/index/product.jsp?id=<%=product.getId()%>">
											<img class="img-responsive"
											src="<%=request.getContextPath() %><%=product.getDefaultImg()%>" />
										</a>
										<!-- /product image(s) -->
										
										<!-- product more info -->
										<div class="shop-item-info"></div>
										<!-- /product more info -->
									</div>
									<div class="shop-item-summary text-center">
										<h2><%=product.getName() %></h2>
										<!-- price -->
										<div class="shop-item-price">
											<span class="line-through">￥<%=product.getPrice()%></span>￥<%=product.getShopPrice()%>
										</div>
										<!-- /price -->
									</div>
									<!-- /buttons -->
								</div>
							</li>
							<!-- /产品 -->
							<%} %>
						</ul>
						<%}} %>
						<hr />
						<!-- Pagination Default -->
						<div name="bootpagFooter" class="text-center"></div>
						<!-- /Pagination Default -->
					</div>

					<div
						class="col-lg-3 col-md-3 col-sm-3 col-lg-pull-9 col-md-pull-9 col-sm-pull-9">

						<!-- CATEGORIES -->
						<div class="side-nav margin-bottom-60">
							<div class="side-nav-head">
								<button class="fa fa-bars"></button>
								<h4>分类</h4>
							</div>
							<ul
								class="list-group list-group-bordered list-group-noicon uppercase">
								<%
							       for(ProductCategory productCategory:categoryList){
						        %>

								<li class="list-group-item"><a
									href="<%=request.getContextPath() %>/index/category.jsp?id=<%=productCategory.getId()%>"><span
										class="size-11 text-muted pull-right"></span><%=productCategory.getName()%></a></li>

                              <%} %>
							</ul>
						</div>

						<!-- /CATEGORIES -->

					</div>
				</div>
			</div>
		</section>
		<!-- / -->
		<jsp:include page="include/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>