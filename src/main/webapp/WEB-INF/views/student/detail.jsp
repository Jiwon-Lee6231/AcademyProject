<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<title>Insert title here</title>
</head>
<body>
	<h3>[ ${vo.name } ] 학생 정보</h3>
	<input type="hidden" name="stu_id" value="${vo.id }" >
	<table class='w-pct60'>
		<tr>
			<th class='w-px160'>이름</th>
			<td>${vo.name }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${vo.birth }</td>
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
			<th>비고</th>
			<td>${vo.status }</td>
		</tr>
		<tr>
			<th>입학등록일</th>
			<td>${vo.regisdate }</td>
		</tr>
	</table>

	<div class='btnSet'>
		<a class='btn-fill' href="list.st">목록</a> <a class='btn-fill'
			href="modify.st?id=${vo.id }">수정</a> <a class='btn-fill'
			onclick="if( confirm('정말 삭제하시겠습니까?') ){ href='delete.st?id=${vo.id }' }">삭제</a>
	</div>

	<br>
	<br>

	<h3>수강 강좌</h3>
	<div id='loaddiv'>
	<core:if test="${!empty course_list }">
		<select name="select_co">
			<core:forEach var="course" items="${course_list }" varStatus="i">
				<option value="${course.id }">${course.title }</option>
			</core:forEach>
		</select>
		<!-- <a class='btn-fill'
			href="insert.rc?student_id=${vo.id }&course_id=${document.getElementById('select_co').value }">추가</a>  -->
		<button type="button" onclick="insert_rc()">추가</button>
	</core:if>

	<core:if test="${empty course_list }">
		<select>
			<option>없음</option>
		</select>

		<a href="#" class='btn btn-secondary disabled' aria-disabled="true">추가</a>
	</core:if>

	<br>
	<br>
	<table class='w-pct60'>
		<tr>
			<th>강좌명</th>
			<th>개강일</th>
			<th>종강예정일</th>
			<th>수강상태</th>
		</tr>
		<core:if test="${!empty stu_course }">
			<core:forEach items="${stu_course }" var="stu_course">
				<tr>
					<td>${stu_course.title }</td>
					<td>${stu_course.startdate }</td>
					<td>${stu_course.enddate }</td>
					<td>
					<!--
						<core:choose>
						 	<core:when test="${stu_course.status eq '수강예정'}"> </core:when>
							수강예정<br>
							 <a class='btn-fill' href="delete_stu.rc?student_id=${vo.id }&course_id=${stu_course.id }">수강취소</a> 
							<a class='btn-fill' href="delete_rc(${stu_course.id })"></a>
						</core:choose>
					-->
					</td>
				</tr>
			</core:forEach>
		</core:if>

		<core:if test="${empty stu_course }">
			<tr>
				<td colspan="3">없음</td>
			</tr>
		</core:if>
	</table>
	</div>
</body>

<script type="text/javascript">

	function refresh_page() {
		location.reload();	
	}
	
	function insert_rc() {
		var $id = $('[name=stu_id]');
		
		$.ajax({
			type: 'post',
			url: 'insert_stu.rc',
			data: {
				student_id: $id.val(),
				course_id: $('select[name=select_co]').val()
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(data) {
				alert("추가 완료!");
			},
			error: function(req, text) {
				alert(text + ': ' + req.status);
			}
			
		});
		
		refresh_page();
		
	}
	
	function delete_rc(cid) {
		var $sid = $('[name=stu_id]');
		
		var chk = confirm("정말 삭제하시겠습니까?");
		
		if (chk == true) {
			$.ajax({
				type: 'get',
				url: 'delete_stu.rc',
				data: {
					student_id: $sid.val(),
					course_id: $cid.val()
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(data) {
					alert("삭제 완료!");
					$('#loaddiv').load(location.href + " #loaddiv");
				},
				error: function(req, text) {
					alert(text + ': ' + req.status);
				}
				
			});
		}
	}
</script>
</html>