package student;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDAO implements StudentService {
	@Autowired private SqlSession sql;
	
	@Override
	public void student_insert(StudentVO vo) {
		sql.insert("student.mapper.insert", vo);
	}

	@Override
	public List<StudentVO> student_list() {
		return sql.selectList("student.mapper.list");
	}

	@Override
	public StudentVO student_detail(int id) {
		return sql.selectOne("student.mapper.detail", id);
	}

	@Override
	public void student_update(StudentVO vo) {
		sql.update("student.mapper.update", vo);
	}

	@Override
	public void student_delete(int id) {
		sql.delete("student.mapper.delete", id);
	}

}
