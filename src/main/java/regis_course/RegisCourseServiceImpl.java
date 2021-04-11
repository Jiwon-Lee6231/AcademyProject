package regis_course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisCourseServiceImpl implements RegisCourseService {
	
	@Autowired private RegisCourseDAO dao;
	
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
