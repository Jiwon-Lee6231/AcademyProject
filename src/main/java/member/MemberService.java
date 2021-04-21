package member;

import java.util.HashMap;
import java.util.List;

public interface MemberService {
	// 회원가입시 회원 정보 저장
	boolean member_insert(MemberVO vo);

	// 로그인 처리
	MemberVO member_login(HashMap<String, String> map);

	// 아이디 중복 확인
	boolean member_id_check(String userid);
	
	// 회원 정보 수정
	void profile_update(MemberVO vo);
	
	// 비밀번호 변경
	void password_update(MemberVO vo);
	
	// 목록 조회
	List<MemberVO> member_list();
	
	// 멤버 조회
	MemberVO member_detail(String userid);

	// 강사 정보 변경 저장(관리자 모드)
	void member_update(MemberVO vo);

	// 탈퇴
	void member_delete(String userid);
}
