<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify JSP</title>
</head>
<body>
	<h3>[ ${vo.title } ]</h3>
	<form action="update.co" method="post">
		<input type="hidden" name="id" value="${vo.id }" /> 
		<!-- 수정할 고객을 특정하기 위해 id가 필요한데 수정 내용에는 id가 없으므로 hidden 속성으로 추가 -->
		<table class="w-pct60">
			<tr>
				<th class="w-px160">강좌명</th>
				<td><input type="text" name="title" value="${vo.title }" /></td>
			</tr>
			<tr>
				<th>분류</th>
				<td><input type="text" name="classify" value="${vo.classify }" /></td>
			</tr>
			<tr>
				<th>담당강사</th>
				<td><input type="text" name="lecturer" value="${vo.lecturer }"/></td>
			</tr>
			<tr>
				<th>개강일</th>
				<td><input type="text" name="startdate" value="${vo.startdate }"/></td>
			</tr>
			<tr>
				<th>종강예정일</th>
				<td><input type="text" name="enddate" value="${vo.enddate }"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="content" value="${vo.content }"/></td>
			</tr>
			<tr>
				<th>강의실</th>
				<td><input type="text" name="room" value="${vo.room }"/></td>
			</tr>
			<tr>
				<th>정원</th>
				<td><input type="text" name="fixednum" value="${vo.fixednum }"/></td>
			</tr>
		</table>
	
		<div class='btnSet'>
			<button type="submit">수정</button>
			<button type="button" onclick="detail.co?id=${vo.id }">취소</button>
		</div>
	</form>
</body>
</html>