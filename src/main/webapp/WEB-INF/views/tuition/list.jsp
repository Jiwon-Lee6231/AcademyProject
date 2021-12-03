<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/common.js"></script>
</head>
<body>
	<h3>수강료 목록</h3>
	<div id ="loaddiv">
	
	<table class='w-pct60'>
		<tr>
			<th><input type="checkbox" name="selectall" onclick='selectAll(this)' /></th>
			<th class='w-px60'>번호</th>
			<th>이름</th>
			<th>수강년월</th>
			<th>수강료</th>
			<th>진행 상태</th>
			<th>예금주</th>
			<th>입금 날짜</th>
		</tr>
		<core:forEach items="${list }" var="vo">
			<tr>
				<td><input name="selectone" type="checkbox" value="${vo.id }" /></td>
				<td>${vo.no }</td>
				<td><a href='detail.tu?id=${vo.id}'>${vo.name }</a></td>
				<td>${vo.yearmonth }</td>
				<td>${vo.amount }</td>
				<td>${vo.status }</td>
				<td>${vo.depositor }</td>
				<td>${vo.depositdate }</td>
			</tr>
		</core:forEach>
	</table>
	</div>

	<div class="btnSet">
		<a class="btn-fill" href="new.tu">등록</a>
		<a class="btn-fill" onclick="deleteValue('delete_list.tu');">선택삭제</a>
	</div>
</body>
</html>