package member;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import student.StudentVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired private MemberDAO dao;
	
	@Override
	public boolean member_insert(MemberVO vo) {
		return dao.member_insert(vo);
	}

	@Override
	public MemberVO member_login(HashMap<String, String> map) {
		return dao.member_login(map);
	}

	@Override
	public boolean member_id_check(String userid) {
		return dao.member_id_check(userid);
	}
	
	@Override
	public List<MemberVO> member_list() {
		return dao.member_list();
	}

	@Override
	public MemberVO member_detail(String userid) {
		return dao.member_detail(userid);
	}

	@Override
	public void member_update(MemberVO vo) {
		dao.member_update(vo);
	}

	@Override
	public void member_delete(String userid) {
		dao.member_delete(userid);
	}

}
