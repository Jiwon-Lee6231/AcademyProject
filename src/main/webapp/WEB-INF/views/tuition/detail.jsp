<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>수강료 상세 내용</h3>
	<table class='w-pct60'>
		<tr>
			<th class='w-px160'>수강생 이름</th>
			<td>${vo.name }</td>
		</tr>
		<tr>
			<th>예금주</th>
			<td>${vo.depositor }</td>
		</tr>
		<tr>
			<th>금액</th>
			<td>${vo.amount }</td>
		</tr>
		<tr>
			<th>수강년월</th>
			<td>${vo.yearmonth }</td>
		</tr>
		<tr>
			<th>입금일자</th>
			<td>${vo.depositdate }</td>
		</tr>
		<tr>
			<th>상태</th>
			<td>${vo.status }</td>
		</tr>
		<tr>
			<th>비고</th>
			<td>${vo.memo }</td>
		</tr>
	</table>
	
	<div class='btnSet'>
		<a class='btn-fill' href="list.tu">목록</a>
		<a class='btn-fill' href="modify.tu?id=${vo.id }">수정</a>
		<a class='btn-fill' onclick="if( confirm('정말 삭제하시겠습니까?') ){ href='delete.tu?id=${vo.id }' }">삭제</a>
	</div>
</body>
</html>