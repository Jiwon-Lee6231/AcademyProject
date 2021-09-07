package clickhd.academy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import clickhd.academy.service.UserService;
import clickhd.academy.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/login")
	public String login(HttpServletRequest request) {

		// 요청 시점의 사용자 URI 정보를 Session의 Attribute에 담아서 전달(잘 지워줘야 함)
		// 로그인이 틀려서 다시 하면 요청 시점의 URI가 로그인 페이지가 되므로 조건문 설정
		String uri = request.getHeader("Referer");

		if (!uri.contains("/login")) {
			request.getSession().setAttribute("prevPage", request.getHeader("Referer"));
		}

		return "user/login";
	}

	// 로그인 요청
	@RequestMapping(value = "/login.do", produces = "text/html; charset=UTF-8")
	public String login_ok(String userid, String pw, HttpSession session, Model model) {
		// HashMap은 컴파일 시 오류 잡기 힘듦
		/*HashMap<String, String> map = new HashMap<String, String>();

		map.put("userid", userid);
		map.put("pw", pw);
		UserVO vo = service.user_login(map);

		if (vo == null) {
			model.addAttribute("msg", "로그인 실패하였습니다.");
			model.addAttribute("url", "login");
		} else {
			session.setAttribute("login_info", vo);

			model.addAttribute("msg", "");
			model.addAttribute("url", "/");
		}
		*/
		return "include/redirect";
	}

	// 로그아웃 요청
	@ResponseBody
	@RequestMapping("/logout")
	public void logout(HttpSession session) {
		session.removeAttribute("login_info");
	}

	// 회원가입 화면 요청
	@RequestMapping("/join")
	public String join(HttpSession session) {
		session.setAttribute("category", "join");

		return "user/join";
	}

	// 아이디 중복확인 요청
	@ResponseBody
	@RequestMapping("/id_check")
	public boolean id_check(String userid) {
		logger.info(userid);
		return service.user_id_check(userid);
	}

	// 회원가입 처리 요청
	@RequestMapping("/join.do")
	public String join_ok(UserVO vo, HttpServletRequest request, Model model) {
		logger.info("들어옴 확인");
		boolean result = service.user_join(vo);

		logger.info("result 확인");
		// 화면에서 입력한 정보를 DB에 저장한 후 홈 화면으로 연결
		if (result == false) {
			logger.info("실패");
			model.addAttribute("msg", "회원가입을" + " 실패하였습니다.");
			model.addAttribute("url", "join");
		} else {
			logger.info("성공");
			model.addAttribute("msg", "");
			model.addAttribute("url", "/");
		}

		return "include/redirect";
	}

	// 계정 프로필 화면 요청
	@RequestMapping("/profile")
	public String detail_account(String userid, Model model) {
		UserVO vo = service.profile_detail(userid);

		model.addAttribute("vo", vo);

		return "user/profile";
	}

	// 회원 정보 수정 화면 요청
	@RequestMapping("/modify.us")
	public String modify_account(String userid, Model model) {
		model.addAttribute("vo", service.profile_detail(userid));

		return "user/profile_modify";
	}

	// 회원 정보 수정 저장 처리 요청
	@RequestMapping("/update.us")
	public String update_account(UserVO vo) {
		service.profile_update(vo);

		return "redirect:profile.us?userid=" + vo.getUserid();
	}

	// 비밀번호 변경 화면 요청
	@RequestMapping("/modify.pw")
	public String modify_password(String userid, Model model) {
		model.addAttribute("vo", service.profile_detail(userid));

		return "user/pw_modify";
	}

	// 비밀번호 변경 저장 처리 요청
	@RequestMapping("/update.pw")
	public String update_password(UserVO vo) {
		service.password_update(vo);

		return "redirect:profile.us?userid=" + vo.getUserid();
	}
}
