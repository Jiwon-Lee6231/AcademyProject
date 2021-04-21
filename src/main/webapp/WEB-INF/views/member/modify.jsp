<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>[ ${vo.name } ] 강사 정보 수정</h3>
	<form action="update.me" method="post">
		<table class="w-pct60">
			<tr>
				<th>아이디</th>
				<td>${vo.userid }</td>
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
				<th class="w-px160">관리자 권한</th>
				<td><label><input type="radio" name="admini" value="Y"
						${vo.admini eq 'Y' ? "checked" : '' } />Y</label> <label><input
						type="radio" name="admini" value="N"
						${vo.admini eq 'N' ? "checked" : '' } />N</label></td>
			</tr>
			<tr>
				<th>비고</th>
				<td><input type="text" name="status" value="${vo.status }" /></td>
			</tr>
		</table>

		<div class='btnSet'>
			<button type="submit">수정</button>
			<button type="button" onclick="detail.me?userid=${vo.userid }">취소</button>
		</div>
	</form>
</body>
</html>