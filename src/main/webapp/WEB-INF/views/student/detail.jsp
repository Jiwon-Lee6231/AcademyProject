<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>[ ${vo.name } ] 학생 정보</h3>
	<table class='w-pct60'>
		<tr>
			<th class='w-px160'>이름</th>
			<td>${vo.name }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${vo.birth }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${vo.gender }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${vo.email }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${vo.phone }</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>${vo.post }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${vo.addr }</td>
		</tr>
		<tr>
			<th>입학등록일</th>
			<td>${vo.regisdate }</td>
		</tr>
	</table>
	
	<div class='btnSet'>
		<a class='btn-fill' href="list.st">목록</a>
		<a class='btn-fill' href="modify.st?id=${vo.id }">수정</a>
		<a class='btn-fill' onclick="if( confirm('정말 삭제하시겠습니까?') ){ href='delete.st?id=${vo.id }' }">삭제</a>
	</div>
</body>
</html>