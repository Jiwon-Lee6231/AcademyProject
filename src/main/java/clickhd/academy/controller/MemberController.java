package clickhd.academy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import clickhd.academy.service.MemberService;
import clickhd.academy.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
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
