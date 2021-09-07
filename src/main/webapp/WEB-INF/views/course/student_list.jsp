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
	<h3>수강생 조회</h3>

	<input type="hidden" name="course_id" value="${course_id }" />
	<table class='w-pct60'>
		<tr>
			<th class='w-px200'>이름</th>
			<th>생년월일</th>
			<th>전화번호</th>
		</tr>
		
		<core:forEach items="${list }" var="vo">
			<tr>
				<td>${vo.name }</td>
				<td>${vo.birth }</td>
				<td>${vo.phone }</td>
			</tr>
		</core:forEach>
	</table>

	<div class="btnSet">
		<a class="btn-fill" href="list.co">목록</a>
		<a class="btn-fill" href="detail.co?id=${course_id } ">강좌 상세로 이동</a>
	</div>
</body>
</html>