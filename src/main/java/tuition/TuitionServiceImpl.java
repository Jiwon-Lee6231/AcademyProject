package tuition;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TuitionServiceImpl implements TuitionService {
	@Autowired private TuitionDAO dao;
	
	@Override
	public void tuition_insert(TuitionVO vo) {
		dao.tuition_insert(vo);
	}

	@Override
	public List<TuitionVO> tuition_list() {
		return dao.tuition_list();
	}

	@Override
	public TuitionVO tuition_detail(int id) {
		return dao.tuition_detail(id);
	}

	@Override
	public void tuition_update(TuitionVO vo) {
		dao.tuition_update(vo);
	}

	@Override
	public void tuition_delete(int id) {
		dao.tuition_delete(id);
	}
	
}
