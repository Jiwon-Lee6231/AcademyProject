package com.clickhd.academy;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import student.StudentServiceImpl;
import student.StudentVO;

@Controller
public class StudentController {
	@Autowired private StudentServiceImpl service;
	
	//학생 관리 목록 화면
	@RequestMapping("/list.st")
	public String list(HttpSession session, Model model) {
		session.setAttribute("category", "st");
		
		List<StudentVO> list = service.student_list();
		model.addAttribute("list", list);
		
		return "student/list";
	}
		
	// 학생 상세 화면 요청
	@RequestMapping("/detail.st")
	public String detail(int id, Model model) {
		StudentVO vo = service.student_detail(id);
		
		model.addAttribute("vo", vo);
		
		return "student/detail";
	}
	
	// 학생 등록 화면 요청
	@RequestMapping("/new.st")
	public String student() {
		return "student/new";
	}
	
	// 학생 등록 처리 요청
	@RequestMapping("/insert.st")
	public String insert(StudentVO vo) {
		service.student_insert(vo);
		
		return "redirect:list.st";
	}
	
	// 학생 정보 수정 화면 요청
	@RequestMapping("/modify.st")
	public String modify(int id, Model model) {
		model.addAttribute("vo", service.student_detail(id));
		
		return "student/modify";
	}
	
	// 학생 정보 수정 저장 처리 요청
	@RequestMapping("/update.st")
	public String update(StudentVO vo) {
		service.student_update(vo);
		
		return "redirect:detail.st?id=" + vo.getId();
	}
	
	//고객 정보 삭제 처리 요청
	@RequestMapping("/delete.st")
	public String delete(int id) {
		service.student_delete(id);
		
		return "redirect:list.st";
	}
}
