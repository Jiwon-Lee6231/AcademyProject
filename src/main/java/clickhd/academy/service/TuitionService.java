package clickhd.academy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import clickhd.academy.mapper.TuitionMapper;
import clickhd.academy.vo.TuitionVO;

@Service
public class TuitionService {
	@Autowired
	private TuitionMapper mapper;

	public void tuition_insert(TuitionVO vo) {
		mapper.tuition_insert(vo);
	}

	public List<TuitionVO> tuition_list() {
		return mapper.tuition_list();
	}

	public TuitionVO tuition_detail(int id) {
		return mapper.tuition_detail(id);
	}

	public void tuition_update(TuitionVO vo) {
		mapper.tuition_update(vo);
	}

	public void tuition_delete(int id) {
		mapper.tuition_delete(id);
	}
	
	public void tuition_delete_list(int[] ids) {
		
		for (int i = 0; i < ids.length; i++) {
			mapper.tuition_delete(ids[i]);
		}
		
	}
	
}
