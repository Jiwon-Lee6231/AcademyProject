package clickhd.academy.mapper;

import java.util.List;

import clickhd.academy.config.annotation.Mapper;
import clickhd.academy.vo.CourseVO;

@Mapper
public interface CourseMapper {

	public void course_insert(CourseVO vo);

	public List<CourseVO> course_list();
	
	public List<CourseVO> avail_list(int id);
	
	public List<CourseVO> student_course_list(int id);
	
	public List<CourseVO> user_course_list(String userid);

	public CourseVO course_detail(int id);

	public void course_update(CourseVO vo);

	public void course_delete(int id);

}
