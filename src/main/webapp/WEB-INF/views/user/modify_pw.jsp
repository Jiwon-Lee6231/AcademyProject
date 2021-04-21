<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>비밀번호 변경</h3>
	<form action='update.pw' method='post'>
		<table class="w-pct60">
			<tr>
				<th>현재 비밀번호</th>
				<td>
					<input type="password" title="비밀번호" name="cur_pw" class="chk" />
					<div class="valid">비밀번호를 입력하세요. (영문 대/소문자, 숫자를 모두 포함)</div>
				</td>
			</tr>
			<tr>
				<th>새로운 비밀번호</th>
				<td>
					<input type="password" title="비밀번호" name="pw" class="chk" />
					<div class="valid">비밀번호를 입력하세요. (영문 대/소문자, 숫자를 모두 포함)</div>
				</td>
			</tr>
			<tr>
				<th>새로운 비밀번호 확인</th>
				<td>
					<input type="password" title="비밀번호 확인" name="pw_ck" class="chk" />
					<div class="valid">비밀번호를 다시 입력하세요.</div>
				</td>
			</tr>
		</table>
		
		<div class="btnSet">
			<button type="button" id="btnModify">비밀번호 변경</button>
			<button type="button" onclick="profile?userid=${vo.userid }">취소</button>
		</div>
	</form>
</body>
</html>