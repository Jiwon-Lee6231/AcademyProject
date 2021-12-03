<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> 수강료 내용 수정</h3>
	<form action="update.tu" method="post">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
		<input type="hidden" name="id" value="${vo.id }" /> 
		<!-- 수정할 고객을 특정하기 위해 id가 필요한데 수정 내용에는 id가 없으므로 hidden 속성으로 추가 -->
		<table class="w-pct60">
			<tr>
				<th class="w-px160">수강생 이름</th>
				<td><input type="text" name="name" value="${vo.name }" /></td>
			</tr>
			<tr>
				<th>예금주</th>
				<td><input type="text" name="depositor" value="${vo.depositor }" /></td>
			</tr>
			<tr>
				<th>금액</th>
				<td><input type="text" name="amount" value="${vo.amount }"/></td>
			</tr>
			<tr>
				<th>수강년월</th>
				<td><input type="text" name="yearmonth" value="${vo.yearmonth }"/></td>
			</tr>
			<tr>
				<th>입금일자</th>
				<td><input type="text" name="depositdate" value="${vo.depositdate }"/></td>
			</tr>
			<tr>
				<th>상태</th>
				<td><input type="text" name="status" value="${vo.status }"/></td>
			</tr>
			<tr>
				<th>비고</th>
				<td><input type="text" name="memo" value="${vo.memo }"/></td>
			</tr>
		</table>
		
		<div class='btnSet'>
			<button type="submit">수정</button>
			<button type="button" onclick="detail.tu?id=${vo.id }">취소</button>
		</div>
	</form>
</body>
</html>