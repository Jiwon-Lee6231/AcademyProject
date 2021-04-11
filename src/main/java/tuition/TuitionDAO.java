package tuition;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TuitionDAO implements TuitionService {
	@Autowired private SqlSession sql;

	@Override
	public void tuition_insert(TuitionVO vo) {
		sql.insert("tuition.mapper.insert", vo);
	}

	@Override
	public List<TuitionVO> tuition_list() {
		return sql.selectList("tuition.mapper.list");
	}

	@Override
	public TuitionVO tuition_detail(int id) {
		return sql.selectOne("tuition.mapper.detail", id);
	}

	@Override
	public void tuition_update(TuitionVO vo) {
		sql.update("tuition.mapper.update", vo);
	}

	@Override
	public void tuition_delete(int id) {
		sql.delete("tuition.mapper.delete", id);
	}

}
