package course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseServiceImpl implements CourseService {
	@Autowired
	private CourseDAO dao;
	
	@Override
	public void course_insert(CourseVO vo) {
		dao.course_insert(vo);
	}

	@Override
	public List<CourseVO> course_list() {
		return dao.course_list();
	}

	@Override
	public CourseVO course_detail(int id) {
		return dao.course_detail(id);
	}

	@Override
	public void course_update(CourseVO vo) {
		dao.course_update(vo);
	}

	@Override
	public void course_delete(int id) {
		dao.course_delete(id);
	}
	

}
