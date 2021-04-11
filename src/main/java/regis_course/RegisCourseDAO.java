package regis_course;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegisCourseDAO implements RegisCourseService {
	@Autowired private SqlSession sql;
	
	@Override
	public void regis_course_insert(RegisCourseVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<RegisCourseVO> regis_course_list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RegisCourseVO regis_course_detail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void regis_course_update(RegisCourseVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void regis_course_delete(int id) {
		// TODO Auto-generated method stub
		
	}
	
}
