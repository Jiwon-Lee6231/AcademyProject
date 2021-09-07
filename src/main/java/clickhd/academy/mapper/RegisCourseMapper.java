package clickhd.academy.mapper;

import clickhd.academy.config.annotation.Mapper;
import clickhd.academy.vo.RegisCourseVO;

@Mapper
public interface RegisCourseMapper {
	
	public void regis_course_insert(RegisCourseVO vo);

	public void regis_course_delete(RegisCourseVO vo);
}
