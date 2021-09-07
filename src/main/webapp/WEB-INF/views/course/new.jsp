<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>신규 강좌</h3>
	<form action="insert.co" method="post">
		<table class='w-pct60'>
			<tr>
				<th class='w-px160'>강좌명</th>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<th>분류</th>
				<td><input type="text" name="classify" /></td>
			</tr>
			<tr>
				<th>담당강사</th>
				<td><input type="text" name="lecturer" /></td>
			</tr>
			<tr>
				<th>개강일</th>
				<td><input type="text" name="startdate" /></td>
			</tr>
			<tr>
				<th>종강예정일</th>
				<td><input type="text" name="enddate" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="content" /></td>
			</tr>
			<tr>
				<th>강의실</th>
				<td><input type="text" name="room" /></td>
			</tr>
			<tr>
				<th>정원</th>
				<td><input type="text" name="fixednum" /></td>
			</tr>
		</table>
	
		<div class="btnSet">
			<button type="submit">등록</button>
			<button type="button" onclick="location.href='list.co'">취소</button>
		</div>
	</form>
</body>
</html>