package com.clickhd.academy;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tuition.TuitionServiceImpl;
import tuition.TuitionVO;

@Controller
public class TuitionController {
	@Autowired
	private TuitionServiceImpl service;

	// 수강료 목록 화면
	@RequestMapping("/list.tu")
	public String list(HttpSession session, Model model) {
		session.setAttribute("category", "tu");
		
		List<TuitionVO> list = service.tuition_list();
		model.addAttribute("list", list);
		
		return "tuition/list";
	}

	// 수강료 상세 내용 화면 요청
	@RequestMapping("/detail.tu")
	public String detail(int id, Model model) {
		TuitionVO vo = service.tuition_detail(id);

		model.addAttribute("vo", vo);
		
		return "tuition/detail";
	}

	// 수강료 등록 화면 요청
	@RequestMapping("/new.tu")
	public String tuition() {
		return "tuition/new";
	}

	// 수강료 등록 처리 요청
	@RequestMapping("/insert.tu")
	public String insert(TuitionVO vo) {
		service.tuition_insert(vo);

		return "redirect:list.tu";
	}

	// 수강료 내용 수정 화면 요청
	@RequestMapping("/modify.tu")
	public String modify(int id, Model model) {
		model.addAttribute("vo", service.tuition_detail(id));
		
		return "tuition/modify";
	}

	// 수강료 내용 수정 저장 처리 요청
	@RequestMapping("/update.tu")
	public String update(TuitionVO vo) {
		service.tuition_update(vo);

		return "redirect:detail.tu?id=" + vo.getId();
	}

	// 수강료 삭제 처리 요청
	@RequestMapping("/delete.tu")
	public String delete(int id) {
		service.tuition_delete(id);

		return "redirect:list.tu";
	}
}
