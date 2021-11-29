<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,edu.jmi.shop.dao.*,java.util.*,edu.jmi.shop.bean.*"%>
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
			window.location="${pageContext.request.contextPath}/admin/productCategory/productCategorydel2.jsp?id="+id;
		});
   }

   function selectaction(){
		document.form.action="${pageContext.request.contextPath}/admin/productCategory/productSelectList.jsp";
 	  }
 	function addaction(){
 		document.form.action="${pageContext.request.contextPath}/admin/productCategory/productCategoryaddpost.jsp";
  	 }
 	function deleteaction(){
 		document.form.action="${pageContext.request.contextPath}/admin/productCategory/productCategorydel.jsp";
 		}	
</script>
</head>
<body class="blank">
	<jsp:include page="../main/top.jsp" />
	<jsp:include page="../main/left.jsp" />

	<div id="wrapper">
		<div class="small-header transition animated fadeIn">
			<div class="content animate-panel">
				<div class="hpanel">
					<div class="panel-body">
						<div class="hpanel">
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">	
									<form name="form"  method="POST" >
										<div class="row" style="padding: 20px">
											<div class="row">
												<div class="form-group col-lg-6">
													<label>商品类别名称</label> 
													<input name="name" class="form-control"
														type="text" placeholder="商品类别名称" />
												</div>
												<div class="form-group col-lg-6">
													<label>描述</label> <input name="description"
														class="form-control" type="text" placeholder="描述" />
													</div>										
											</div>
										
										</div>
										<div class="row" style="padding: 20px">
											<div class="text-left m-t-xs" >
											<p align="right">					
												<button id="addProductInfo" class="btn btn-success"
													 onclick="addaction()">
													<strong>添加商品分类</strong>
												</button>
													<button id="selectProductInfo" class="btn btn-success"
													 onclick="selectaction()">
													<strong>查询</strong>
												</button>
												<button id="selectProductInfo" class="btn btn-success"
													 onclick="deleteaction()">
													<strong>删除</strong>
												</button>
												<button id="saveProductInfo" class="btn btn-success"
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
							显示
							<select >
							<option  value="1">1</option>
							<option  value="2">2</option>
							<option  value="3>">3</option>
							<option  value="4">4</option>
							<option  value="5">5</option>
							<option  value="6">6</option>
							<option  value="7">7</option>
							<option  value="8">8</option>
							<option  value="9">9</option>
							<option  value="10" selected="selected">10</option>
							</select>项结果

							<table id="productInfoList" style="width: 100%;"
								class="table table-striped table-bordered table-hover dataTable no-footer"
								role="grid" aria-describedby="productInfoList_info">
								<thead>
									<tr role="row">

										<th style="width:15px;"><input type="checkbox" name="vehicle"  /></th>
										<th style="width: 40px;">商品类别名</th>
										<th style="width: 45px;">描述</th>
										<th style="width: 50px;">更新时间</th>
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
								
			
								ProductCategoryDAO productCategoryDAO=new ProductCategoryDAO();
									List<ProductCategory> list=productCategoryDAO.selectBypage(s,pageIndex,recCountInPage,recordCount,pageCount,start,end);
										for(ProductCategory p:list){
											pageContext.setAttribute("p",p);
									     %>
									<tr>
										<td><input type="checkbox" name="vehicle" /></td>
										<td>${p.name}</td>
										<td>${p.description}</td>
										<td>${p.updateTime}</td>
										<td>${p.updateUserId}</td>
										<td>
											<button id="update" class="btn btn-default btn-sm"
												onclick="window.location='${pageContext.request.contextPath}/admin/productCategory/productCategoryedit.jsp?id=${p.id}'">
												<i class="fa fa-pencil"></i>编辑
											</button>&nbsp;&nbsp;
											<button id="delete" class="btn btn-default btn-sm"
												onclick="delproduct(${p.id})">
												<i class="fa fa-pencil"></i>删除
											</button>
										</td>
									</tr>
											<%} %>
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
							   <li class="paginate_button " aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="productCategoryList.jsp?pageIndex=1"> 首页 </a></li>
							   <li class="paginate_button " aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="productCategoryList.jsp?pageIndex=${p.pageIndex-1}"> 上页 </a></li>
							</c:if>
							<c:if test="${p.pageIndex==p.pageCount}">
							    <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_next"><a href="#"> 下页 </a></li>
							     <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="#"> 末页 </a></li>
							</c:if>
							<c:if test="${p.pageIndex!=p.pageCount}">
							  	 <li class="paginate_button next" aria-controls="productInfoList" tabindex="0" id="productInfoList_next"><a href="productCategoryList.jsp?pageIndex=${p.pageIndex+1}"> 下页 </a></li>
							     <li class="paginate_button previous" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="productCategoryList.jsp?pageIndex=${p.pageCount}"> 末页 </a></li>
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