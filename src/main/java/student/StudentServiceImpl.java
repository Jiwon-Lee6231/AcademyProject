package student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired private StudentDAO dao;
	
	@Override
	public void student_insert(StudentVO vo) {
		dao.student_insert(vo);
	}

	@Override
	public List<StudentVO> student_list() {
		return dao.student_list();
	}

	@Override
	public StudentVO student_detail(int id) {
		return dao.student_detail(id);
	}

	@Override
	public void student_update(StudentVO vo) {
		dao.student_update(vo);
	}

	@Override
	public void student_delete(int id) {
		dao.student_delete(id);
	}
}
