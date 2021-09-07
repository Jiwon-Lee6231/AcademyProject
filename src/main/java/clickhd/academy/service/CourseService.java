package clickhd.academy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import clickhd.academy.mapper.CourseMapper;
import clickhd.academy.vo.CourseVO;

@Service
public class CourseService {
	
	@Autowired
	private CourseMapper mapper;
	
	public void course_insert(CourseVO vo) {
		mapper.course_insert(vo);
	}
	
	public List<CourseVO> course_list() {
		return mapper.course_list();
	}

	public List<CourseVO> avail_list(int id) {
		return mapper.avail_list(id);
	}
	
	public List<CourseVO> student_course_list(int id) {
		return mapper.student_course_list(id);
	}
	
	public List<CourseVO> user_course_list(String userid) {
		return mapper.user_course_list(userid);
	}

	public CourseVO course_detail(int id) {
		return mapper.course_detail(id);
	}

	public void course_update(CourseVO vo) {
		mapper.course_update(vo);
	}

	public void course_delete(int id) {
		mapper.course_delete(id);
	}
	

}
