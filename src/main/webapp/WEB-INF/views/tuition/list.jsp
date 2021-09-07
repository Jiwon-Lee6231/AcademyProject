<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>수강료 목록</h3>

	<!-- CSS 파일을 변경 후에 바로 Refresh가 안된다면 common.css 파일로 들어가서 바로 Refresh 해주면 적용 된다. -->
	<table class='w-pct60'>
		<tr>
			<th><input id="allCheck" type="checkbox" name="allCheck" /></th>
			<th class='w-px60'>번호</th>
			<th>이름</th>
			<th>수강년월</th>
			<th>수강료</th>
			<th>진행 상태</th>
			<th>예금주</th>
			<th>입금 날짜</th>
		</tr>
		<!-- for(꺼낸 배열 변수를 담을 새로운 변수 (String x) : 배열 변수(list)) -->
		<!-- items : 배열 변수 -->
		<!-- var : 꺼낸 배열 변수를 담을 새로운 변수 -->
		<core:forEach items="${list }" var="vo">
			<tr>
				<td><input name="RowCheck" type="checkbox" value="${vo.no }" /></td>
				<td>${vo.no }</td>
				<td><a href='detail.tu?id=${vo.id}'>${vo.name }</a></td>
				<td>${vo.yearmonth }</td>
				<td>${vo.amount }</td>
				<td>${vo.status }</td>
				<td>${vo.depositor }</td>
				<td>${vo.depositdate }</td>
			</tr>
		</core:forEach>
	</table>

	<div class="btnSet">
		<a class="btn-fill" href="new.tu">등록</a> <input type="button"
			onclick="deleteValue();" value="선택삭제" />
	</div>

	<script type="text/javascript">
		$(function() {
			var chk_obj = document.getElementsByName("RowCheck");
			var row_cnt = chk_obk.length;
			
			$("input[name='allCheck']").click(function() {
				var chk_list_arr = $("input[name='RowCheck']");
				
				for (var i=0; i<chk_list_arr; i++) {
					chk_list_arr[i].checked = this.checked;	
				}
			});
			
			$("input[name='RowCheck']").click(function(){
				if ($("input[name='RowCheck']:checked").length == row_cnt) {
					$("input[name='allCheck']")[0].checked = true;
				} else {
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		
		function deleteValue() {
			var value_arr = new Array();
			var list = $("input[name='RowCheck']");
			
			for (var i =0 ; i < list.length; i++) {
				if (list[i].checked) {	// 선택되어 있으면 배열 저장
					value_arr.push(list[i].value);
				}
			}
			
			if (value_arr.length == 0) {
				alert("선택된 데이터가 없습니다.");
			} else {
				var chk = confirm("정말 삭제하시겠습니까?");
				
				$.ajax({
					type: 'post',
					url: 'delete_list.tu',
					data: {
						list : value_arr
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success: function(data) {
						alert("삭제 성공");
						location.replace("list");
					},
					error: function(req, text) {
						alert(text + ': ' + req.status);
					}
				});
			}
		}
	</script>
</body>
</html>