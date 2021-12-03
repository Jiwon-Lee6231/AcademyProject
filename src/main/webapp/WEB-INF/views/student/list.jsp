<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list JSP</title>
<script type="text/javascript" src="js/common.js"></script>
</head>
<body>
	<h3>학생 목록</h3>
	<div id ="loaddiv">
	
	<table class='w-pct60'>
		<tr>
			<th><input type="checkbox" name="selectall" onclick='selectAll(this)' /></th>
			<th class='w-px60'>번호</th>
			<th class='w-px200'>이름</th>
			<th>전화번호</th>
			<th>생년월일</th>
			<th>입학등록일</th>
		</tr>
		<core:forEach items="${list }" var="vo">
			<tr>
				<td><input name="selectone" type="checkbox" value="${vo.id }" /></td>
				<td>${vo.no }</td>
				<td><a href='detail.st?id=${vo.id }'>${vo.name }</a></td>
				<td>${vo.phone }</td>
				<td>${vo.birth }</td>
				<td>${vo.regisdate }</td>
			</tr>
		</core:forEach>
	</table>
	</div>

	<div class="btnSet">
		<a class="btn-fill" href="new.st">등록</a>
		<a class="btn-fill" onclick="deleteValue('delete_list.st');">선택삭제</a>
	</div>
</body>
</html>