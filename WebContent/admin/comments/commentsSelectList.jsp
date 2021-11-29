<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,edu.jmi.shop.dao.*,java.util.*,edu.jmi.shop.bean.*"%>
<%@page session="true"%>
<%@include file="../priv.jsp"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			window.location="${pageContext.request.contextPath}/admin/product/productdel.jsp?id="+id;
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
									<div class="row" style="padding: 20px">
										<div class="text-left m-t-xs">
												<p align="right">												
													<button id="update" class="text-left m-t-xs"
												onclick="window.location='${pageContext.request.contextPath}/admin/comments/comments.jsp?'">
												<i class="fa fa-pencil"></i>返回
											</button>
												</p>
										</div>
									</div>
							<table id="productInfoList" style="width: 100%;"
								class="table table-striped table-bordered table-hover dataTable no-footer"
								role="grid" aria-describedby="productInfoList_info">
								<thead>
									<tr role="row">
									<th style="width:15px;"><input type="checkbox" name="vehicle"  /></th>
										<th style="width: 25px;">用户名</th>
										<th style="width: 20px;">商品名</th>
										<th style="width: 35px;">内容</th>
										<th style="width: 10px;">评论星级</th>
										<th style="width: 16px;">创建时间</th>
										<th style="width: 16px;">审核状态</th>
										<th style="width: 20px;">操作</th>
									</tr>
								</thead>
								<tbody>
									<%				
										String sname=request.getParameter("name");
									System.out.println(sname);
									    CommentsDAO commentsDAO=new CommentsDAO();
										List<Comments> list=commentsDAO.selectbyName(sname);
											for(Comments p:list){
												pageContext.setAttribute("p",p);
									     %>
									<tr>
									<td><input type="checkbox" name="vehicle" /></td>
										<td>${p.userId}</td>
										<td>${p.productName}</td>
										<td>${p.content}</td>
										<td><c:if test="${p.stars==0}"> </c:if>
										<c:if test="${p.stars==1}">*</c:if>
										<c:if test="${p.stars==2}">**</c:if>
										<c:if test="${p.stars==3}">***</c:if>
										<c:if test="${p.stars==4}">****</c:if>
										<c:if test="${p.stars==5}">*****</c:if>
										</td>
										<td>${p.createTime}</td>
										<td><c:if test="${p.audit==0}">未审核</c:if>
										<c:if test="${p.audit==1}">已审核</c:if>
										
										
										</td>
										<td>
										<form id="form2" method="post">
											<button id="pass" class="btn btn-default btn-sm"
												onclick="edit1action(${p.id})">
												<i class="fa fa-pencil"></i>通过
											</button>&nbsp;&nbsp;
											<button id="return" class="btn btn-default btn-sm"
											onclick="edit2action(${p.id})">
												<i class="fa fa-pencil"></i>驳回
											</button>
											<button id="delete" class="btn btn-default btn-sm"
												onclick="delproduct(${p.id})">
												<i class="fa fa-pencil"></i>删除
											</button>
											</form>
										</td>
									</tr>
									<%
										}	
									%>
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