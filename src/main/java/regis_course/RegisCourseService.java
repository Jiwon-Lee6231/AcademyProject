package regis_course;

import java.util.List;

import regis_course.RegisCourseVO;

public interface RegisCourseService {
	
	// 수강할 강좌 추가
	void regis_course_insert(RegisCourseVO vo);

	// 수강하는 강좌 목록 조회
	List<RegisCourseVO> regis_course_list();

	// 상세(1건) 조회
	RegisCourseVO regis_course_detail(int id);

	// 수강하는 강좌 수정
	void regis_course_update(RegisCourseVO vo);

	// 수강 취소
	void regis_course_delete(int id);
}
