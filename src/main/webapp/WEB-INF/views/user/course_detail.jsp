<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>[ ${vo.title } ]</h3>
	<table class='w-pct60'>
		<tr>
			<th class='w-px160'>분류</th>
			<td>${vo.classify }</td>
		</tr>
		<tr>
			<th>담당강사</th>
			<td>${vo.lecturer }</td>
		</tr>
		<tr>
			<th>개강일</th>
			<td>${vo.startdate }</td>
		</tr>
		<tr>
			<th>종강예정일</th>
			<td>${vo.enddate }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${vo.content }</td>
		</tr>
		<tr>
			<th>강의실</th>
			<td>${vo.room }</td>
		</tr>
		<tr>
			<th>정원</th>
			<td>${vo.fixednum }</td>
		</tr>
		<tr>
			<th>수강 인원</th>
			<td>${vo.regiscnt }</td>
		</tr>
	</table>
	
	<div class='btnSet'>
		<a class='btn-fill' href="list_course.us">목록</a>
		<a class='btn-fill' href="modify_course.us?id=${vo.id }">수정</a>
	</div>
</body>
</html>