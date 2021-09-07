package clickhd.academy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import clickhd.academy.vo.MemberVO;
import clickhd.academy.mapper.MemberMapper;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;
	
	// 회원 리스트 전체 검색
	public List<MemberVO> member_list() {
		return mapper.member_list();
	}
	
	// 회원 상세 정보 검색
	public MemberVO member_detail(String userid) {
		return mapper.member_detail(userid);
	}

	// 회원 정보 수정
	public void member_update(MemberVO vo) {
		mapper.member_update(vo);
	}

	// 회원 정보 삭제
	public void member_delete(String userid) {
		mapper.member_delete(userid);
	}
}
