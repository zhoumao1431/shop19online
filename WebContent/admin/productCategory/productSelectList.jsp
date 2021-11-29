<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,edu.jmi.shop.dao.*,java.util.*,edu.jmi.shop.bean.*"%>
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
</script>
</head>
<body class="blank">
	<jsp:include page="../main/top.jsp" />
	<jsp:include page="../main/left.jsp" />

	<div id="wrapper">
		<div class="small-header transition animated fadeIn">
			<div class="content animate-panel">
				<div class="hpanel">
					<div id="tab-1" class="tab-pane active">
						<div class="tab-content">
							<div class="hpanel">
								<div class="panel-body">
							
								<table id="productInfoList" style="width: 100%;"
									class="table table-striped table-bordered table-hover dataTable no-footer"
									role="grid" aria-describedby="productInfoList_info">
								<thead>
									<tr role="row">

										<th style="width:15px;"><input type="checkbox" name="vehicle" /></th>
										<th style="width: 40px;">商品类别名</th>
										<th style="width: 45px;">描述</th>
										<th style="width: 50px;">更新时间</th>
										<th style="width: 27px;">更新者</th>
										<th style="width: 64px;">操作</th>
									</tr>
								</thead>
								<tbody>
									<%
									String sName= request.getParameter("name");
									ProductCategoryDAO productCategoryDAO=new ProductCategoryDAO();
									List<ProductCategory> list=productCategoryDAO.selectbyName(sName);
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
											<button id="update" class="btn btn-default btn-sm"
												onclick="window.location='${pageContext.request.contextPath}/admin/productCategory/productCategoryList.jsp'">
												<i class="fa fa-pencil"></i>返回
											</button>
										</td>
									</tr>
											<%} %>
								</tbody>
							</table>
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