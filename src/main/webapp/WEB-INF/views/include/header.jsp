<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="css/common.css?v=<%=new java.util.Date().getTime() %>">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- 어느 페이지에 가도 인클루드 되어있는 헤더에 jQuery 선언문을 넣는다. -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  -->
<script src="jquery/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>

<style>
.text-small {
  font-size: 85%;
}

.dropdown-toggle {
  outline: 0;
}
</style>

<div class="container">
  <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
    <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
      <img src="images/logo.png" />
    </a>

    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
      <li><a href="<core:url value='/' />" class="nav-link px-2 link-secondary">Home</a></li>
      <li><a href='list.st' ${category eq 'st' ? "class='active'" : '' } class="nav-link px-2 link-dark">Student</a></li>
      <li><a href='list.co' ${category eq 'co' ? "class='active'" : '' } class="nav-link px-2 link-dark">Course</a></li>
      <li><a href='list.tu' ${category eq 'tu' ? "class='active'" : '' } class="nav-link px-2 link-dark">Tuition</a></li>
      <!-- 
      	<li><a href='list.bo' ${category eq 'bo' ? "class='active'" : '' } class="nav-link px-2 link-dark">Task board</a></li>
       -->
      <!-- 관리자 판단(관리자가 강사 관리에서 관리자 권한 부여 가능) -->
	  <core:if test="${login_info.admin } eq 'Y' ">
		<li><a href='list.me' ${category eq 'me' ? "class='active'" : '' }  class="nav-link px-2 link-dark">Member</a></li>
	  </core:if>
    </ul>

	<!-- 로그인한 경우 -->
	<core:if test="${!empty login_info }">
		<div class="dropdown text-end">
        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
          <img src="images/user.png" width="32" height="32" class="rounded-circle">
        </a>
        <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
          <li><a class="dropdown-item" href="#">Profile</a></li>
          <li><a class="dropdown-item" href="#">Course</a></li>
          <li><a class="dropdown-item" href="#">Profile</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="#">Sign out</a></li>
        </ul>
      </div>
	</core:if>
	
	<!-- 로그인하지 않은 경우 -->
	<core:if test="${empty login_info }">
	    <div class="col-md-3 text-end">
	      <button type="button" class="btn btn-outline-primary me-2" onclick="/login">Login</button>
	      <button type="button" class="btn btn-primary" onclick="/join">Sign-up</button>
	    </div>
    </core:if>
  </header>
</div>


<script>
function go_logout() {
	$.ajax({
		type: "post",
		url: "logout",
		success: function() {
			location.reload();
		},
		error: function(req, text) {
			 alert(text + ': ' + req.status);
	 	}
	});
}
</script>