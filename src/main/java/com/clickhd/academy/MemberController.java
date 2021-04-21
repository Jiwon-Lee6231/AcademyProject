package com.clickhd.academy;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberServiceImpl;
import member.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberServiceImpl service;

	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}

	// 로그인 요청
	@RequestMapping(value = "/login.do", produces = "text/html; charset=UTF-8")
	public String login_ok(String userid, String pw, HttpSession session, Model model) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("userid", userid);
		map.put("pw", pw);
		MemberVO vo = service.member_login(map);

		if (vo == null) {
			model.addAttribute("msg", "로그인 실패하였습니다.");
			model.addAttribute("url", "login");
		} else {
			session.setAttribute("login_info", vo);

			model.addAttribute("msg", "");
			model.addAttribute("url", "/");
		}

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
		return service.member_id_check(userid);
	}

	// 회원가입 처리 요청
	@RequestMapping("/join.do")
	public String join_ok(MemberVO vo, HttpServletRequest request, Model model) {
		boolean result = service.member_insert(vo);

		// 화면에서 입력한 정보를 DB에 저장한 후 홈 화면으로 연결
		if (result == false) {
			model.addAttribute("msg", "회원가입을 실패하였습니다.");
			model.addAttribute("url", "join");
		} else {
			model.addAttribute("msg", "");
			model.addAttribute("url", "/");
		}

		return "include/redirect";
	}

	// 계정 프로필 화면 요청
	@RequestMapping("/profile")
	public String detail_account(String userid, Model model) {
		MemberVO vo = service.member_detail(userid);

		model.addAttribute("vo", vo);

		return "user/profile";
	}

	// 회원 정보 수정 화면 요청
	@RequestMapping("/modify.us")
	public String modify_account(String userid, Model model) {
		model.addAttribute("vo", service.member_detail(userid));

		return "user/modify";
	}

	// 회원 정보 수정 저장 처리 요청
	@RequestMapping("/update.us")
	public String update_account(MemberVO vo) {
		service.profile_update(vo);

		return "redirect:profile.us?userid=" + vo.getUserid();
	}

	// 비밀번호 변경 화면 요청
	@RequestMapping("/modify.pw")
	public String modify_password(String userid, Model model) {
		model.addAttribute("vo", service.member_detail(userid));

		return "user/modify_pw";
	}

	// 비밀번호 변경 저장 처리 요청
	@RequestMapping("/update.pw")
	public String update_password(MemberVO vo) {
		service.password_update(vo);

		return "redirect:profile.us?userid=" + vo.getUserid();
	}

	// 강사 목록 화면(관리자 모드)
	@RequestMapping("/list.me")
	public String list(HttpSession session, Model model) {
		session.setAttribute("category", "me");

		List<MemberVO> list = service.member_list();
		model.addAttribute("list", list);

		return "member/list";
	}

	// 강사 상세 화면 요청(관리자 모드)
	@RequestMapping("/detail.me")
	public String detail(String userid, Model model) {
		MemberVO vo = service.member_detail(userid);

		model.addAttribute("vo", vo);

		return "member/detail";
	}

	// 강사 정보 수정 화면 요청(관리자 모드)
	@RequestMapping("/modify.me")
	public String modify(String userid, Model model) {
		model.addAttribute("vo", service.member_detail(userid));

		return "member/modify";
	}

	// 강사 정보 수정 저장 처리 요청(관리자 모드)
	@RequestMapping("/update.me")
	public String update(MemberVO vo) {
		service.member_update(vo);

		return "redirect:detail.me?userid=" + vo.getUserid();
	}

	// 강사 정보 삭제 처리 요청
	@RequestMapping("/delete.me")
	public String delete(String userid) {
		service.member_delete(userid);

		return "redirect:list.me";
	}
}
