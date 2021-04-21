<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>[ ${vo.name } ] 강사 정보</h3>
	<table class='w-pct60'>
		<tr>
			<th>아이디</th>
			<td>${vo.regisdate }</td>
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
			<th>입사일</th>
			<td>${vo.regisdate }</td>
		</tr>
		<tr>
			<th>비고</th>
			<td>${vo.status }</td>
		</tr>
		<tr>
			<th>관리자 권한</th>
			<td>${vo.admini }</td>
		</tr>
	</table>
	
	<div class='btnSet'>
		<a class='btn-fill' href="list.me">목록</a>
		<a class='btn-fill' href="modify.me?userid=${vo.userid }">수정</a>
		<a class='btn-fill' onclick="if( confirm('정말 삭제하시겠습니까?') ){ href='delete.me?userid=${vo.userid }' }">삭제</a>
	</div>
</body>
</html>