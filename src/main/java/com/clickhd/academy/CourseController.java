package com.clickhd.academy;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import course.CourseServiceImpl;
import course.CourseVO;

@Controller
public class CourseController {
	@Autowired private CourseServiceImpl service;
	
	// 목록 화면
	@RequestMapping("/list.co")
	public String list(HttpSession session, Model model) {
		session.setAttribute("category", "co");	
		
		List<CourseVO> list = service.course_list();
		model.addAttribute("list", list);
		
		return "course/list";
	}
		
	// 강좌 상세 화면 요청
	@RequestMapping("/detail.co")
	public String detail(int id, Model model) {
		CourseVO vo = service.course_detail(id);
		
		model.addAttribute("vo", vo);
		
		return "course/detail";
	}
	
	// 강좌 등록 화면 요청
	@RequestMapping("/new.co")
	public String course() {
		return "course/new";
	}
	
	// 강좌 등록 처리 요청
	@RequestMapping("/insert.co")
	public String insert(CourseVO vo) {
		service.course_insert(vo);
		
		return "redirect:list.co";
	}
	
	// 강좌 수정 화면 요청
	@RequestMapping("/modify.co")
	public String modify(int id, Model model) {
		model.addAttribute("vo", service.course_detail(id));
		
		return "course/modify";
	}
	
	// 강좌 수정 저장 처리 요청
	@RequestMapping("/update.co")
	public String update(CourseVO vo) {
		service.course_update(vo);
		
		return "redirect:detail.co?id=" + vo.getId();
	}
	
	// 강좌 삭제 처리 요청
	@RequestMapping("/delete.co")
	public String delete(int id) {
		service.course_delete(id);
		
		return "redirect:list.co";
	}
}
