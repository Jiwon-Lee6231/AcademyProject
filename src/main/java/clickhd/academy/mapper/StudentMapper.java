package clickhd.academy.mapper;

import java.util.List;

import clickhd.academy.config.annotation.Mapper;
import clickhd.academy.vo.StudentVO;

@Mapper
public interface StudentMapper {
	
	public void student_insert(StudentVO vo);

	public List<StudentVO> student_list();
	
	public List<StudentVO> course_student_list(int id);

	public StudentVO student_detail(int id);

	public void student_update(StudentVO vo);

	public void student_delete(int id);

}
