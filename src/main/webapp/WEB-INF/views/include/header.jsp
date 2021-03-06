<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>


<link rel="stylesheet" type="text/css"
	href="css/common.css?v=<%=new java.util.Date().getTime()%>">

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- 어느 페이지에 가도 인클루드 되어있는 헤더에 jQuery 선언문을 넣는다. -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>

<style>
.text-small {
	font-size: 85%;
}

.dropdown-toggle {
	outline: 0;
}
</style>

<!-- 인증 사용자 정보 -->
<s:authentication property="principal" var="user" />

<div class="container">
	<header
		class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
		<a href="<core:url value='/' />"
			class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
			<img src="images/logo.png" />
		</a>

		<!-- 로그인이 되어있지 않은 경우 -->
		<s:authorize access="isAnonymous()">
			<div class="col-md-3 text-end">
				<button type="button" class="btn btn-outline-primary me-2"
					onclick="location.href='login'">Login</button>
				<button type="button" class="btn btn-primary"
					onclick="location.href='join'">Sign-up</button>
			</div>
		</s:authorize>

		<!-- 로그인한 경우 -->
		<s:authorize access="isAuthenticated()">
			<ul
				class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="<core:url value='/' />"
					class="nav-link px-2 link-secondary">Home</a></li>
				<li><a href='list.st'
					${category eq 'st' ? "class='active'" : '' }
					class="nav-link px-2 link-dark">Student</a></li>
				<li><a href='list.co'
					${category eq 'co' ? "class='active'" : '' }
					class="nav-link px-2 link-dark">Course</a></li>
				<li><a href='list.tu'
					${category eq 'tu' ? "class='active'" : '' }
					class="nav-link px-2 link-dark">Tuition</a></li>

				<!-- 관리자 판단(관리자가 강사 관리에서 관리자 권한 부여 가능) -->
				<s:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href='list.me'
						${category eq 'me' ? "class='active'" : '' }
						class="nav-link px-2 link-dark">Member</a></li>
				</s:authorize>
			</ul>


			<div class="dropdown text-end">
				<a href="#"
					class="d-block link-dark text-decoration-none dropdown-toggle"
					id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
					<img src="images/user.png" width="32" height="32"
					class="rounded-circle">
				</a>
				<ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
					<li><a class="dropdown-item"
						href="profile?userid=${user.username }">Profile</a></li>
					<li><a class="dropdown-item"
						href="list_course.us?userid=${user.username }">Course</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="#"
						onclick="document.getElementById('logoutAskOne').submit();">Sign
							out</a></li>
				</ul>
			</div>
		</s:authorize>
	</header>
</div>

<s:authorize access="isAuthenticated()">
<!-- 로그아웃 token 정보 (현재기기 로그아웃) -->
		<form id="logoutAskOne" action="logoutAsk" method="post">
			<input name="${_csrf.parameterName}" type="hidden"
				value="${_csrf.token}" />
		</form>
</s:authorize>