package com.clickhd.academy;

import java.util.HashMap;

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
	@Autowired private MemberServiceImpl service;
	
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	
	//로그인 요청
	@RequestMapping("/login.do")
	public String login_ok(String userid, String pw, HttpSession session, Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("userid", userid);
		map.put("pw", pw);
		MemberVO vo = service.member_login(map);
		
		if(vo == null) {
			model.addAttribute("msg", "로그인 실패");
			return "redirect:login";
		} else {
			session.setAttribute("login_info", vo);
			return "redirect:/";
		}
	}
	
	//로그아웃 요청
	@ResponseBody @RequestMapping("/logout")
	public void logout(HttpSession session) {
		session.removeAttribute("login_info");
	}
	
	//회원가입 화면 요청
	@RequestMapping("/join")
	public String join(HttpSession session) {
		session.setAttribute("category", "join");
		
		return "member/join";
	}
	

	//아이디 중복확인 요청
	@ResponseBody @RequestMapping("/id_check")
	public boolean id_check(String userid) {
		return service.member_id_check(userid);
	}
	
	//회원가입 처리 요청
	@RequestMapping("/join.do")
	public String join_ok(MemberVO vo, HttpServletRequest request, Model model) {
		boolean result = service.member_insert(vo);
		
		//화면에서 입력한 정보를 DB에 저장한 후 홈 화면으로 연결
		if(result == false) {
			model.addAttribute("msg", "회원가입 실패");
			return "redirect:join";
		} else {
			return "redirect:/";
		}
	}
}
