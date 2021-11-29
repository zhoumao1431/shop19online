<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="header">
    <div class="color-line">
    </div>
    <div id="logo" class="light-version" style="padding:0px;">
        <span>
          	 <img src="${pageContext.request.contextPath}/resources/admin/images/logo.jpg" height="56px" width="180px"></img>
        </span>
    </div>
    <nav role="navigation">
        <div class="header-link hide-menu"><i class="fa fa-bars"></i></div>
        <div class="navbar-right">
        
            <ul class="nav navbar-nav no-borders">
              
                <li class="dropdown">
                    <a href="${pageContext.request.contextPath}/admin/login/logout.jsp">
                        <i class="pe-7s-upload pe-rotate-90"></i>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</div>