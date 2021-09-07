package clickhd.academy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import clickhd.academy.vo.CourseVO;
import clickhd.academy.vo.StudentVO;
import clickhd.academy.service.CourseService;
import clickhd.academy.service.StudentService;

@Controller
public class StudentController {
	@Autowired
	private StudentService service;
	@Autowired
	private CourseService co_service;
	
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
		StudentVO stu_vo = service.student_detail(id);
		List<CourseVO> stu_course = co_service.student_course_list(id);
		List<CourseVO> avail_list = co_service.avail_list(id);
				
		model.addAttribute("vo", stu_vo);
		model.addAttribute("stu_course", stu_course);
		model.addAttribute("course_list", avail_list);
		
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
	
	// 강좌에서 학생 조회 요청
	@RequestMapping("/student_list.co")
	public String course_student_list(int id, Model model) {		
		List<StudentVO> list = service.course_student_list(id);
		
		model.addAttribute("list", list);
		model.addAttribute("course_id", id);
		
		return "course/student_list";
	}
	
	
}
