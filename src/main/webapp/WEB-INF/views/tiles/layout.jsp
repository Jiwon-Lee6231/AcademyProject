<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 추후 (category eq 'bo' ? 'Task board' : -- 태스크 보드 추가 : 트렐로 형태 -->
<title>${category eq 'tu' ? '수강료' : (category eq 'me' ? '강사' : (category eq 'st' ? '학생 관리' : (category eq 'me' ? '강사 관리' : (category eq 'co' ? '강좌 관리' : (category eq 'join' ? '회원가입' : '') ) ) ) ) } : aca</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
<!-- cdnjs.com에서 가져온 fontawesome cdn 라이브러리 -->
<!-- 모든 화면에서 사용하기 위해 join.jsp에 있던 코드를 layout.jsp로 옮겨온다. -->
</head>
<body>
<tiles:insertAttribute name="header" />

<!-- 각 jsp 파일의 div id="content" 부분을 없애도 된다. -->
<div id="content">
	<tiles:insertAttribute name="content" />
</div>

<tiles:insertAttribute name="footer" />
</body>
</html>