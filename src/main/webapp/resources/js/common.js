// 테이블 전체 체크
function selectAll(selectAll) {
	var list = $("input[name='selectone']");

	for (var i = 0; i < list.length; i++) {
		list[i].checked = selectAll.checked;
	}
}

// 테이블 선택 삭제
function deleteValue(url) {
	var value_arr = [];
	var list = $("input[name='selectone']");
	
	for (var i = 0 ; i < list.length; i++) {
		if (list[i].checked) {	// 선택되어 있으면 배열 저장
			value_arr.push(list[i].value);
		}
	}
	
	if (value_arr.length == 0) {
		alert("선택된 데이터가 없습니다.");
	} else {
		var chk = confirm("정말 삭제하시겠습니까?");
		
		if (chk == true) {
			$.ajax({
				type: 'get',
				url: url,
				data: {
					ids : value_arr
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(data) {
					alert("삭제 성공");
					$('#loaddiv').load(location.href + " #loaddiv");
				},
				error: function(req, text) {
					alert(text + ': ' + req.status);
				}
			});
		}
	}
}