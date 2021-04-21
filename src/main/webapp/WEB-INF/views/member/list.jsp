<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list JSP</title>
</head>
<body>
	<h3>강사 목록</h3>
	
	<!-- CSS 파일을 변경 후에 바로 Refresh가 안된다면 common.css 파일로 들어가서 바로 Refresh 해주면 적용 된다. -->
	<table class='w-pct60'>
		<tr>
			<th class='w-px60'>번호</th>
			<th class='w-px200'>이름</th>
			<th>전화번호</th>
			<th>생년월일</th>
			<th>입사일</th>
		</tr>
		<!-- for(꺼낸 배열 변수를 담을 새로운 변수 (String x) : 배열 변수(list)) -->
		<!-- items : 배열 변수 -->
		<!-- var : 꺼낸 배열 변수를 담을 새로운 변수 -->
		<core:forEach items="${list }" var="vo">
			<tr>
				<td>${vo.no }</td>
				<td><a href='detail.me?userid=${vo.userid}'>${vo.name }</a></td>
				<td>${vo.phone }</td>
				<td>${vo.birth }</td>
				<td>${vo.regisdate }</td>
			</tr>
		</core:forEach>
	</table>
</body>
</html>