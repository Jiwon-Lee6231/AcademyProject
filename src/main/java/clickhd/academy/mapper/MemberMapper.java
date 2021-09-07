package clickhd.academy.mapper;

import java.util.List;

import clickhd.academy.config.annotation.Mapper;
import clickhd.academy.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	// 회원 리스트 전체 검색
	public List<MemberVO> member_list();

	// 회원 상세 정보 검색
	public MemberVO member_detail(String userid);
	
	// 회원 정보 수정
	public void member_update(MemberVO vo);
	
	// 회원 권한 수정(admin 부여)
	public void update_userauth_admin(String userid);
	
	// 회원 정보 삭제
	public void member_delete(String userid);

	// 회원 권한 삭제
	public void delete_userauth(String userid);

}
