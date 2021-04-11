package student;

import java.util.List;

public interface StudentService {

	// 학생 정보 삽입 저장
	void student_insert(StudentVO vo);

	// 목록 조회
	List<StudentVO> student_list();

	// 상세(1건) 조회
	StudentVO student_detail(int id);

	// 학생 정보 변경 저장
	void student_update(StudentVO vo);

	// 학생 정보 삭제
	void student_delete(int id);
}
