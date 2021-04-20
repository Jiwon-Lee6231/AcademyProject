<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>alert</title>
</head>
<body>
	<script type="text/javascript">
		if ('${msg}' != '') {
			alert('${msg}');	
		}
		
		location.href='<core:out value="${pageContext.request.contextPath}"/>${url}';
	</script>
</body>
</html>