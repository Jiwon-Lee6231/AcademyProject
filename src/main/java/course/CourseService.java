package course;

import java.util.List;

public interface CourseService {
	
	// 강좌 새 등록
	void course_insert(CourseVO vo);

	// 목록 조회
	List<CourseVO> course_list();

	// 상세(1건) 조회
	CourseVO course_detail(int id);

	// 강좌 변경 저장
	void course_update(CourseVO vo);

	// 강좌 삭제
	void course_delete(int id);
}
