<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>신규 입학</h3>
	<form action="insert.st" method="post">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
		<table class='w-pct60'>
			<tr>
				<th class='w-px160'>*이름</th>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<th>*생년월일</th>
				<td><input type="text" name="birth" /></td>
			</tr>
			<tr>
				<th>*성별</th>
				<td><label><input type="radio" name="gender" value="남자"
						checked />남자</label> <label><input type="radio" name="gender"
						value="여자" />여자</label></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<th>*전화번호</th>
				<td><input type="text" name="phone" /></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="post" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addr" /></td>
			</tr>
		</table>
		
		<div class="btnSet">
			<button type="submit">등록</button>
			<button type="button" onclick="location.href='list.st'">취소</button>
		</div>
	</form>
</body>
</html>