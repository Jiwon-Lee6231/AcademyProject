package member;

import java.util.HashMap;
import java.util.List;

import student.StudentVO;

public interface MemberService {
	// 회원가입시 회원 정보 저장
	boolean member_insert(MemberVO vo);

	// 로그인 처리
	MemberVO member_login(HashMap<String, String> map);

	// 아이디 중복 확인
	boolean member_id_check(String userid);
	
	// 목록 조회
	List<MemberVO> member_list();
	
	// 상세(1건) 조회
	MemberVO member_detail(String userid);

	// 마이페이지에서 회원 정보 변경 저장
	void member_update(MemberVO vo);

	// 회원 정보 탈퇴
	void member_delete(String userid);
}
