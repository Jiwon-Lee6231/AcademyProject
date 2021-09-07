package clickhd.academy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import clickhd.academy.mapper.StudentMapper;
import clickhd.academy.vo.StudentVO;

@Service
public class StudentService {
	@Autowired 
	private StudentMapper mapper;

	public void student_insert(StudentVO vo) {
		mapper.student_insert(vo);
	}

	public List<StudentVO> student_list() {
		return mapper.student_list();
	}
	
	// 목록 조회
	public List<StudentVO> course_student_list(int id) {
		return mapper.course_student_list(id);
	}

	public StudentVO student_detail(int id) {
		return mapper.student_detail(id);
	}
	
	public void student_update(StudentVO vo) {
		mapper.student_update(vo);
	}

	public void student_delete(int id) {
		mapper.student_delete(id);
	}
}
