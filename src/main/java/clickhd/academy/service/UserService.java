package clickhd.academy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import clickhd.academy.mapper.UserMapper;
import clickhd.academy.vo.UserVO;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Service
public class UserService {
	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	public boolean user_join(UserVO vo) {
		// 존재하는 ID 여부 확인
		Integer id_check = mapper.select_user_count(vo.getUserid());

		if (id_check > 0) {
			return false;
		} else {
			
			logger.info("아이디 확인");
			// userInfo의 내용 중 패스워드를 암호화시켜서 바꿔줌
			vo.setPw(pwEncoder.encode(vo.getPw()));

			logger.info(vo.getPw());
			// 회원정보 DB 입력
			mapper.insert_user_info(vo);
			
			logger.info("완료?");
			return true;
		}
	}

	/* public UserVO user_login(HashMap<String, String> map) {
		return mapper.user_login(map);
	}*/

	public boolean user_id_check(String userid) {
		return (mapper.select_user_count(userid) > 0) ? false : true;
	}

	public UserVO profile_detail(String userid) {
		return mapper.select_user(userid);
	}

	public void profile_update(UserVO vo) {
		mapper.update_user(vo);
	}

	public void password_update(UserVO vo) {
		mapper.update_password(vo);
	}
}
