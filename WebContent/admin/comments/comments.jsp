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
			window.location="${pageContext.request.contextPath}/admin/comments/commentsdel.jsp?id="+id;
		});
   }
   
   function edit1action(id){
		swal({
			title : "确定修改吗?",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#62cb31",
			confirmButtonText : "修改",
			cancelButtonText : '取消',
		}, function() {
			window.location="${pageContext.request.contextPath}/admin/comments/commentsedit1.jsp?id="+id;
		});
  }
   
   function edit2action(id){
		swal({
			title : "确定修改吗?",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#62cb31",
			confirmButtonText : "修改",
			cancelButtonText : '取消',
		}, function() {
			window.location="${pageContext.request.contextPath}/admin/comments/commentsedit2.jsp?id="+id;
		});
 }
</script>
<script type="text/javascript">
   function selectaction(){
		document.form.action="${pageContext.request.contextPath}/admin/comments/commentsSelectList.jsp";
 	  }
 	function passaction(){
 		document.form.action="${pageContext.request.contextPath}/admin/comments/commentspass.jsp";
  	 }
 	function resetaction(){
 		document.form.action="${pageContext.request.contextPath}/admin/comments/commentsreset.jsp";
  	 }
 	function deleteaction(){
 		document.form.action="${pageContext.request.contextPath}/admin/comments/commentsdel.jsp";
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
													<label>开始时间</label> 
													<input name="starttime" class="form-control"
														type="date"  />
														
												</div>
												<div class="form-group col-lg-6">
													<label>结束时间</label> <input name="endtime"
														class="form-control" type="date"  />
												</div>
											</div>
											<div class="row">

												<div class="form-group col-lg-6">
													<label>商品名</label> <input name="name"
														class="form-control" type="text" />
												</div>
		
											</div>
											</div>
										<div class="row" style="padding: 20px">
											<div class="text-left m-t-xs">
												<p align="right">												
													<button id="selectProductInfo" class="btn btn-success"
													 onclick="selectaction()">
													<strong>查询</strong>
												</button>
												<button id="pass" class="btn btn-success"
													 onclick="passaction()">
													<strong>全部通过</strong>
												</button>
												<button id="reset" class="btn btn-success"
													 onclick="resetaction()">
													<strong>全部驳回</strong>
												</button>
												<button id="delProductInfo" class="btn btn-success"
													 onclick="deleteaction()">
													<strong>全部删除</strong>
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
									<th style="width:15px;"><input type="checkbox" name="vehicle"  /></th>
										<th style="width: 25px;">用户名</th>
										<th style="width: 35px;">商品名</th>
										<th style="width: 35px;">内容</th>
										<th style="width: 35px;">评论星级</th>
										<th style="width: 16px;">创建时间</th>
										<th style="width: 16px;">审核状态</th>
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
									  
									    CommentsDAO commentsDAO=new CommentsDAO();
										List<Comments> list=commentsDAO.selectBypage(s,pageIndex,recCountInPage,recordCount,pageCount,start,end);
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
							   <li class="paginate_button " aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="comments.jsp?pageIndex=1"> 首页 </a></li>
							   <li class="paginate_button " aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="comments.jsp?pageIndex=${p.pageIndex-1}"> 上页 </a></li>
							</c:if>
							<c:if test="${p.pageIndex==p.pageCount}">
							    <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_next"><a href="#"> 下页 </a></li>
							     <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="#"> 末页 </a></li>
							</c:if>
							<c:if test="${p.pageIndex!=p.pageCount}">
							  	 <li class="paginate_button next" aria-controls="productInfoList" tabindex="0" id="productInfoList_next"><a href="comments.jsp?pageIndex=${p.pageIndex+1}"> 下页 </a></li>
							     <li class="paginate_button previous" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="comments.jsp?pageIndex=${p.pageCount}"> 末页 </a></li>
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