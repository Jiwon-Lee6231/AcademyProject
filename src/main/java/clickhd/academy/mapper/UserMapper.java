package clickhd.academy.mapper;

import java.util.List;

import clickhd.academy.config.annotation.Mapper;
import clickhd.academy.vo.UserVO;

@Mapper
public interface UserMapper {
	
	// 회원가입 시 개인 정보 저장
	public boolean insert_user_info(UserVO vo);

	// 회원가입 시 기본 권한 부여 및 추가 부여 시
	public boolean insert_userauth_default(String userid);
	
	// 개인 정보 검색(1명) - 로그인, 정보 불러오기
	public UserVO select_user(String userid);
	
	// 기본 권한 검색(1명)
	public List<String> select_userauth(String userid);
	
	// 개인 정보 전체 검색
	public List<UserVO> select_user_list();
	
	// 개인 존재 여부 확인
	public Integer select_user_count(String userid);
	
	// 개인 정보 수정
	public void update_user(UserVO vo);
	
	// 비밀번호 수정
	public boolean update_password(UserVO vo);
	
	// 개인 정보 삭세(탈퇴)
	public void delete_user(String userid);
	
	// 개인 권한 삭제(탈퇴)
	public void delete_userauth(String userid);
	
}
