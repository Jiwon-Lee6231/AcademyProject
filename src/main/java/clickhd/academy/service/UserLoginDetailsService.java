package clickhd.academy.service;

import org.springframework.stereotype.Service;

import clickhd.academy.mapper.UserMapper;
import clickhd.academy.vo.UserDetailsVO;
import clickhd.academy.vo.UserVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class UserLoginDetailsService implements UserDetailsService {

	@Autowired
	private UserMapper mapper;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public UserDetails loadUserByUsername(String inputUserId) {

		// 최종 리턴 객체
		UserDetailsVO user_details = new UserDetailsVO();
		
		UserVO user_info = mapper.select_user(inputUserId);
		logger.info(user_info.getPw());

		// 사용자 정보 없으면 null 처리
		if (user_info == null)
			return null;

			// 사용자 정보 있을 경우 로직 전개 (userDetails에 데이터 넣기)
		else {
			user_details.setUsername(user_info.getUserid());
			user_details.setPassword(user_info.getPw());

			// 사용자 권한 select해서 받아온 List<String> 객체 주입
			user_details.setAuthorities(mapper.select_userauth(inputUserId));
		}

		return user_details;
	}

}
