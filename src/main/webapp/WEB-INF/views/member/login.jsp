<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login JSP</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="bootstrap/js/bootstrap.bundle.min.js"></script>

<style>

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

</style>
</head>
<body class="text-center">
	<main class="form-signin">
		<form action='login.do' method='post'>
			<h1 class="h3 mb-3 fw-normal">Please sign in</h1>

			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="ID" name="userid"> <label for="floatingInput">ID</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="Password" name="pw"> <label
					for="floatingPassword">Password</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="button" onclick="go_login()">Sign in</button>
		</form>
	</main>
	
	<script type="text/javascript">
		function go_login() {
			if( $('[name=userid]').val() == '') {
				alert('아이디를 입력하세요!');
				$('[name=userid]').focus();
				return;
			} else if( $('[name=pw]').val() == '') {
				alert('비밀번호를 입력하세요!');
				$('[name=pw]').focus();
				return;
			}
			
			$('form').submit();
		}
	</script>
</body>
</html>