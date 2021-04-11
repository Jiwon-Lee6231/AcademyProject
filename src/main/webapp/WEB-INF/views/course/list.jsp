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
	<h3>강좌 목록</h3>
	
	<!-- CSS 파일을 변경 후에 바로 Refresh가 안된다면 common.css 파일로 들어가서 바로 Refresh 해주면 적용 된다. -->
	<table class='w-pct60'>
		<tr>
			<th class='w-px60'>번호</th>
			<th colspan="3">강좌  내용</th>
			<th></th>
		</tr>
		<!-- for(꺼낸 배열 변수를 담을 새로운 변수 (String x) : 배열 변수(list)) -->
		<!-- items : 배열 변수 -->
		<!-- var : 꺼낸 배열 변수를 담을 새로운 변수 -->
		<core:forEach items="${list }" var="vo">
			<tr>
				<td rowspan="2">${vo.no }</td>
				<td colspan="3"><a href='detail.co?id=${vo.id}'>${vo.title }</a></td>
				<td rowspan="2"><a class="btn-fill">수강생 조회</a></td>
			</tr>
			<tr>
				<td>${vo.lecturer }</td>
				<td>${vo.startdate }</td>
				<td>${vo.regiscnt } / ${vo.fixednum }</td>
			</tr>
		</core:forEach>
	</table>

	<div class="btnSet">
		<a class="btn-fill" href="new.co">등록</a>
	</div>
</body>
</html>