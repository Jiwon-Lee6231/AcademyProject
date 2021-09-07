<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify JSP</title>
</head>
<body>
	<h3>[ ${vo.name } ] 학생 정보 수정</h3>
	<form action="update.st" method="post">
		<input type="hidden" name="id" value="${vo.id }" /> 
		<s:csrfInput/>
		<!-- 수정할 고객을 특정하기 위해 id가 필요한데 수정 내용에는 id가 없으므로 hidden 속성으로 추가 -->
		<table class="w-pct60">
			<tr>
				<th class="w-px160">성별</th>
				<td>
					<label><input type="radio" name="gender" value="남자" ${vo.gender eq '남자' ? "checked" : '' }/>남자</label>
					<label><input type="radio" name="gender" value="여자" ${vo.gender eq '여자' ? "checked" : '' }/>여자</label>
				</td>
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
			<button type="button" onclick="detail.st?id=${vo.id }">취소</button>
		</div>
	</form>
</body>
</html>