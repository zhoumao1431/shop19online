<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,edu.jmi.shop.bean.*,edu.jmi.shop.dao.*,java.util.*"%>
<%@page session="true"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript">
   function delproduct(id){
		swal({
			title : "确定删除吗?",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#62cb31",
			confirmButtonText : "删除",
			cancelButtonText : '取消',
		}, function() {
			window.location="${pageContext.request.contextPath}/admin/product/productdel.jsp?id="+id;
		});
   }

   function selectaction(){
		document.form.action="${pageContext.request.contextPath}/admin/product/productSelectList.jsp";
 	  }
 	function addaction(){
 		document.form.action="${pageContext.request.contextPath}/admin/product/productaddpost.jsp";
  	 }
 	function deleteaction(){
 		document.form.action="${pageContext.request.contextPath}/admin/product/productdel2.jsp";
 		}	
</script>
</head>
<body class="blank">
	<jsp:include page="../main/top.jsp" />
	<jsp:include page="../main/left.jsp" />

	<div id="wrapper">
		<div class="content">
			<div class="small-header transition">
				<div class="hpanel">
					<div class="panel-body">
						<div class="hpanel">
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">	
									<form name="form" method="POST" >
										<div class="row" style="padding: 20px">
											<div class="row">
												<div class="form-group col-lg-6">
													<label>商品名称</label> 
													<input name="name" class="form-control"
														type="text" placeholder="商品名称" />
														 <label id="name-error"
														class="error" for="name" style="display: none;"></label>
												</div>
												<div class="form-group col-lg-6">
													<label>所属分类</label> 
													<select class="form-control" name="categoryId">
														<%
														ProductCategoryDAO productCategoryDAO=new ProductCategoryDAO();
														List<ProductCategory> list1=productCategoryDAO.selectAll();
																for (ProductCategory p1:list1) {
																	pageContext.setAttribute("p1",p1);
														%><option value="${p1.id}">${p1.name}</option>
														<%} %>
													</select>
												</div>
											</div>
											<div class="row">

												<div class="form-group col-lg-6">
													<label>市场价格</label> <input name="price"
														class="form-control" type="text" placeholder="市场价格" />
												</div>
												<div class="form-group col-lg-6">
													<label>店内价格</label> <input name="shopPrice"
														class="form-control" type="text" placeholder="店内价格" />
												</div>
											</div>
											<div class="row">

												<div class="form-group col-lg-6">
													<label>商品库存</label> <input name="quantity"
														class="form-control" type="text" placeholder="商品库存" />
												</div>
												<div class="form-group col-lg-6">
													<label>状态</label>
													 <select name="productStatus"
														class="form-control">
														<option value="0" selected>上架</option>
														<option value="1">下架</option>
													</select>
												</div>

											</div>

											<div class="row">
												<div class="form-group col-lg-6">
													<label>是否热销</label>
													<div>
														<label>
														 <input type="radio" value="0"
															class="i-checks" name="hot" checked />&nbsp;&nbsp;非热门商品
														</label>&nbsp;&nbsp; <label> <input type="radio" value="1"
															class="i-checks" name="hot" />&nbsp;&nbsp;热门商品
														</label>
													</div>
												</div>
												<div class="form-group col-lg-6">
													<label>商品概要说明</label> <input name="generalExplain"
														class="form-control" type="text" placeholder="商品概要说明" />
												</div>
											</div>
										</div>
										<div class="row" style="padding: 20px">
											<div class="text-left m-t-xs">
												<p align="right">					
												<button id="addProductInfo" class="btn btn-success"
													 onclick="addaction()">
													<strong>添加商品</strong>
												</button>
													<button id="selectProductInfo" class="btn btn-success"
													 onclick="selectaction()">
													<strong>查询</strong>
												</button>
												<button id="delProductInfo" class="btn btn-success"
													 onclick="deleteaction()">
													<strong>删除</strong>
												</button>
												<button id="resetProductInfo" class="btn btn-success"
													type="reset">
													<strong>重置</strong>
												</button>
												</p>
											</div>
										</div>
									</form>
																	
								</div>
							</div>
						</div>
					</div>
							<br><br>

			<div id="tab-1" class="tab-pane active">
					<div class="tab-content">
					<div class="hpanel">
						<div class="panel-body">
							<table id="productInfoList" style="width: 100%;"
								class="table table-striped table-bordered table-hover dataTable no-footer"
								role="grid" aria-describedby="productInfoList_info">
								<thead>
									<tr role="row">
										<th style="width: 25px;">商品名</th>
										<th style="width: 35px;">商品分类</th>
										<th style="width: 35px;">店内价格</th>
										<th style="width: 35px;">市场价格</th>
										<th style="width: 16px;">数量</th>
										<th style="width: 36px;">热门商品</th>
										<th style="width: 16px;">状态</th>
										<th style="width: 36px;">更新时间</th>
										<th style="width: 27px;">更新者</th>
										<th style="width: 64px;">操作</th>
									</tr>
								</thead>
								<tbody>
									<%				
										String s=request.getParameter("pageIndex");
									    int pageIndex=1;
									    final int recCountInPage=10;
									    int recordCount=0;
									    int pageCount=0;
									    int start=0;
									    int end=0;
									  
										ProductDAO productDAO=new ProductDAO();
										List<Product> list=productDAO.selectBypage(s,pageIndex,recCountInPage,recordCount,pageCount,start,end);
											for(Product p:list){
												pageContext.setAttribute("p",p);
									     %>
									<tr>
										<td>${p.name}</td>
										<td>${p.categoryId}</td>
										<td>${p.shopPrice/100}</td>
										<td>${p.price/100}</td>
										<td>${p.quantity}</td>
										<td>
											<c:if test="${p.hot==0}"> 否 </c:if>
											 <c:if test="${p.hot!=0}">是 </c:if> 
							          </td>
										<td>
										<c:if test="${p.productStatus==0}">已上架</c:if>
										<c:if test="${p.productStatus!=0}">已下架</c:if>
										
										</td>
										<td>${p.updateTime}</td>
										<td>${p.updateUserName}</td>
										<td>
											<button id="update" class="btn btn-default btn-sm"
												onclick="window.location='${pageContext.request.contextPath}/admin/product/productedit.jsp?id=${p.id}'">
												<i class="fa fa-pencil"></i>编辑
											</button>&nbsp;&nbsp;
											<button id="delete" class="btn btn-default btn-sm"
												onclick="delproduct(${p.id})">
												<i class="fa fa-pencil"></i>删除
											</button>
										</td>
									</tr>
									<%
										}	
									%>
								</tbody>
							</table>


					       <div>
					        <!-- 6.显示分页信息 -->
							<div class="col-sm-6"><div class="dataTables_info" id="productInfoList_info" role="status" aria-live="polite"> 
							            显示第${p.start}至${p.end}项结果，共${p.recordCount}项
							       </div>
							  </div>
							<div class="col-sm-6"><div class="dataTables_paginate paging_simple_numbers" id="productInfoList_paginate">
							<ul class="pagination">
							<c:if test="${p.pageIndex==1}">
							  <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="#"> 首页 </a></li>
							   <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="#"> 上页 </a></li>
							 </c:if>
							<c:if test="${p.pageIndex!=1}">
							   <li class="paginate_button " aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="productlist.jsp?pageIndex=1"> 首页 </a></li>
							   <li class="paginate_button " aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="productlist.jsp?pageIndex=${p.pageIndex-1}"> 上页 </a></li>
							</c:if>
							<c:if test="${p.pageIndex==p.pageCount}">
							    <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_next"><a href="#"> 下页 </a></li>
							     <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="#"> 末页 </a></li>
							</c:if>
							<c:if test="${p.pageIndex!=p.pageCount}">
							  	 <li class="paginate_button next" aria-controls="productInfoList" tabindex="0" id="productInfoList_next"><a href="productlist.jsp?pageIndex=${p.pageIndex+1}"> 下页 </a></li>
							     <li class="paginate_button previous" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="productlist.jsp?pageIndex=${p.pageCount}"> 末页 </a></li>
							</c:if>
							  </ul>
							  </div>
							</div>				
						</div>
	    			</div>
				</div>
			</div>	  
		</div>
      </div>
   </div>
 </div>
</div>
</body>
</html>