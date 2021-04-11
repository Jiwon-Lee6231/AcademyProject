package com.clickhd.academy;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberServiceImpl;
import member.MemberVO;

@Controller
public class MemberController {
	@Autowired private MemberServiceImpl service;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/login")
	public String login() {
		logger.debug("login onclick..");
		return "member/login";
	}
	
	//로그인 요청
	@RequestMapping("/login.ok", method=RequestMethod.GET)
	public String login_ok(String id, String pw, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("pw", pw);
		MemberVO vo = service.member_login(map);

		//일치하는 회원 정보가 있다면 회원 정보를 세션에 담는다
		session.setAttribute("login_info", vo);
		
		return vo == null ? "false" : "true";
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
	public boolean id_check(String id) {
		return service.member_id_check(id);
	}
	
	//회원가입 처리 요청
	//RequestMapping에 한글이 깨지지않게 utf-8 설정
	@ResponseBody @RequestMapping(value= "/join.ok", produces= "text/html; charset= utf-8")
	public String join_ok(MemberVO vo, HttpServletRequest request, HttpSession session) {
		String msg = "<script type='text/javascript'>";
		//화면에서 입력한 정보를 DB에 저장한 후 홈 화면으로 연결
		if(service.member_insert(vo)) {
			msg += "alert('회원가입을 축하드립니다!'); location='" + request.getContextPath() + "'";
		} else {
			msg += "alert('회원가입에 실패했습니다!'); history.go(-1)";
		}
		msg += "</script>";
		return msg;
	}
}
