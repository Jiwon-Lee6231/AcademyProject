package member;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import student.StudentVO;

@Repository
public class MemberDAO implements MemberService {
	@Autowired private SqlSession sql; //이미 만들어둔 SqlSession을 이용하기 위해 Autowired를 사용한다
	
	@Override
	public boolean member_insert(MemberVO vo) {
		return sql.insert("member.mapper.join", vo) == 0 ? false : true;
	}

	@Override
	public MemberVO member_login(HashMap<String, String> map) {
		return sql.selectOne("member.mapper.login", map);
	}

	@Override
	public boolean member_id_check(String userid) {
		return (Integer) sql.selectOne("member.mapper.id_check", userid) == 0 ? true : false;
	}
	
	@Override
	public List<MemberVO> member_list() {
		return sql.selectList("member.mapper.list");
	}

	@Override
	public MemberVO member_detail(String userid) {
		return sql.selectOne("member.mapper.detail", userid);
	}

	@Override
	public void member_update(MemberVO vo) {
		sql.update("member.mapper.update", vo);
	}

	@Override
	public void member_delete(String userid) {
		sql.delete("member.mapper.delete", userid);
	}

}
