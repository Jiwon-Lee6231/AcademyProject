package course;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CourseDAO implements CourseService {
	@Autowired private SqlSession sql;
	
	@Override
	public void course_insert(CourseVO vo) {
		sql.insert("course.mapper.insert", vo);
	}

	@Override
	public List<CourseVO> course_list() {
		return sql.selectList("course.mapper.list");
	}

	@Override
	public CourseVO course_detail(int id) {
		return sql.selectOne("course.mapper.detail", id);
	}

	@Override
	public void course_update(CourseVO vo) {
		sql.update("course.mapper.update", vo);
	}

	@Override
	public void course_delete(int id) {
		sql.delete("course.mapper.delete", id);
	}

}
