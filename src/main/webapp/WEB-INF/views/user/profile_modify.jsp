<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>개인 정보 수정</h3>
	
	<form action="update.us" method="post">
		<input type="hidden" name="userid" value="${vo.userid }" /> 
		<table class="w-pct60">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="${vo.name }" /></td>
			</tr>
			<tr>
				<th class="w-px160">성별</th>
				<td>
					<label><input type="radio" name="gender" value="남자" ${vo.gender eq '남자' ? "checked" : '' }/>남자</label>
					<label><input type="radio" name="gender" value="여자" ${vo.gender eq '여자' ? "checked" : '' }/>여자</label>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="birth" value="${vo.birth }" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="${vo.email }" /></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" value="${vo.phone }"/></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="post" value="${vo.post }"/></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addr" value="${vo.addr }"/></td>
			</tr>
		</table>
		
		<div class='btnSet'>
			<button type="submit">수정</button>
			<button type="button" onclick="detail.us?userid=${vo.userid }">취소</button>
		</div>
	</form>
</body>
</html>