<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>수강료 등록</h3>
	<form action="insert.tu" method="post">
		<table class='w-pct60'>
			<tr>
				<th class='w-px160'>*수강생 이름</th>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<th>예금주</th>
				<td><input type="text" name="depositor" /></td>
			</tr>
			<tr>
				<th>*금액</th>
				<td><input type="text" name="amount" /></td>
			</tr>
			<tr>
				<th>수강년월</th>
				<td><input type="text" name="yearmonth" /></td>
			</tr>
			<tr>
				<th>입금일자</th>
				<td><input type="text" name="depositdate" /></td>
			</tr>
			<tr>
				<th>상태</th>
				<td><input type="text" name="status" /></td>
			</tr>
			<tr>
				<th>비고</th>
				<td><input type="text" name="memo" /></td>
			</tr>
		</table>
		
		<div class="btnSet">
			<button type="submit">등록</button>
			<button type="button" onclick="list.tu">취소</button>
		</div>
	</form>
</body>
</html>