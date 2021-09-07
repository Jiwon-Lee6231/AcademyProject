<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>나의 강좌</h3>
	
	<table class='w-pct60'>
		<tr>
			<th class='w-px60'>번호</th>
			<th colspan="3">강좌  내용</th>
			<th></th>
		</tr>
		
		<core:forEach items="${list }" var="vo">
			<tr>
				<td rowspan="2">${vo.no }</td>
				<td colspan="3"><a href='detail_course.us?id=${vo.id}'>${vo.title }</a></td>
				<td rowspan="2"><a class="btn-fill">수강생 조회</a></td>
			</tr>
			<tr>
				<td>${vo.startdate }</td>
				<td>${vo.enddate }</td>
				<td>${vo.regiscnt } / ${vo.fixednum }</td>
			</tr>
		</core:forEach>
	</table>
</body>
</html>