<%@ page pageEncoding="UTF-8"%>

<%
    Object userid=session.getAttribute("userid");
   
%>
<!-- Top Bar -->
<div id="topBar">
	<div class="container">
		<!-- rightttt -->
		<ul class="top-links list-inline pull-right">
			<li class="text-welcome hidden-xs">${userid==null?"":"欢迎 "}<strong>${nickname==null?username:nickname}</strong></li>
			<li><%if (userid!=null){ %>
					<a class="dropdown-toggle no-text-underline"
						data-toggle="dropdown" href="#"><i class="fa fa-user hidden-xs"></i>
							会员中心</a>
			    <%} %>
				<ul class="dropdown-menu pull-right">
					<li><a tabindex="-1" href="${pageContext.request.contextPath}/pc/account/order/list"><i class="fa fa-history"></i>订单历史</a></li>
					<li class="divider"></li>
					<li><a tabindex="-1" href="${pageContext.request.contextPath}/pc/account/wishlist/page/1"><i class="fa fa-bookmark"></i>收藏夹</a></li>
					<li><a tabindex="-1" href="${pageContext.request.contextPath}/pc/account/contact/list"><i class="fa fa-edit"></i>常用联系人</a></li>
					<li><a tabindex="-1" href="${pageContext.request.contextPath}/pc/account/user_setting"><i class="fa fa-cog"></i>个人设置</a></li>
					<li class="divider"></li>  
					<li><a tabindex="-1" href="${pageContext.request.contextPath}/pc/logout"><i class="glyphicon glyphicon-off"></i>退出</a></li>
				</ul></li>
			<%if (userid==null){ %>
				<li class="hidden-xs"><a class='sysBuilding' href="${pageContext.request.contextPath}/index/register.jsp">注册</a></li>
				<li class="hidden-xs"><a class='sysBuilding'
					href="${pageContext.request.contextPath}/index/login.jsp">登录</a></li>
			<%} %>
		</ul>
	</div>
</div>
<!-- /Top Bar -->

<div id="header" class="sticky clearfix">
	<!-- TOP NAV -->
	<header id="topNav">
		<div class="container">

			<!-- Mobile Menu Button -->
			<button class="btn btn-mobile" data-toggle="collapse"
				data-target=".nav-main-collapse">
				<i class="fa fa-bars"></i>
			</button>

			<!-- BUTTONS -->
			<ul class="pull-right nav nav-pills nav-second-main">

				<!-- QUICK SHOP CART -->
				<li class="quick-cart"><a href="javascript:void(0)"> <span
						id="cartItems" class="badge badge-aqua btn-xs badge-corner"></span>
						<c:if test="${userid!=null}">
							<i class="fa fa-shopping-cart"></i>
						</c:if>
				</a>
					<div class="quick-cart-box">
						<h4>购物车</h4>
						<div id="divCart" class="quick-cart-wrapper">
							<a id="cartnoitems" class="text-center" href="javascript:void(0)"
								style="display: none">
								<h6>0 ITEMS ON YOUR CART</h6>
							</a>
						</div>
						<!-- quick cart footer -->
						<div class="quick-cart-footer clearfix">
							<a href="${pageContext.request.contextPath}/pc/cart/item"
								class="btn btn-primary btn-xs pull-right">VIEW CART</a> <span
								id="sumprice" class="pull-left"></span>
						</div>
						<!-- /quick cart footer -->
					</div></li>
				<!-- /QUICK SHOP CART -->
			</ul>
			<div class='row'>
				<div class='col-lg-3 col-sm-3'>
					<a class="logo pull-left" href="${pageContext.request.contextPath}/index/index.jsp"> <img
						src="${pageContext.request.contextPath}/resources/pc/assets/images/logo.jpg" />
					</a>
				</div>
				<div class='col-lg-6 col-sm-6' style='padding-top: 30px'>

					<div class="search-box" style="display: block;">
						<form id='searchForm'
							onkeydown="if(event.keyCode==13)return false;"
							action="${pageContext.request.contextPath}/pc/search/page/1" method="get">
							<div class="input-group">
								<input type="text" id='keyword' placeholder="请输入查询关键字"
									class="form-control"> <input type='hidden'
									name='keyword' value="${keyword}" id='encodeKeyword'> <span
									class="input-group-btn">
									<button id="searchButton" class="btn btn-primary" type="button">搜索</button>
								</span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
<%-- 	<script src="${pageContext.request.contextPath}/resources/pc/assets/js/jquery.js"></script> --%>
	<script src="${pageContext.request.contextPath}/resources/pc/assets/js/common.js"></script>


</div>