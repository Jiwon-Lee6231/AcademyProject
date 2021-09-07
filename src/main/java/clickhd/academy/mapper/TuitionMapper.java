package clickhd.academy.mapper;

import java.util.List;

import clickhd.academy.config.annotation.Mapper;
import clickhd.academy.vo.TuitionVO;

@Mapper
public interface TuitionMapper {

	public void tuition_insert(TuitionVO vo);

	public List<TuitionVO> tuition_list();
	
	// 수강생의 수강료 내역
	public List<TuitionVO> student_tuition_list();

	public TuitionVO tuition_detail(int id);

	public void tuition_update(TuitionVO vo);

	public void tuition_delete(int id);

}
