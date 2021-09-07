package clickhd.academy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import clickhd.academy.vo.RegisCourseVO;
import clickhd.academy.service.RegisCourseService;

@Controller
public class RegisCourseController {
	@Autowired
	private RegisCourseService service;

	// 수강 학생 등록 화면 요청
	@RequestMapping("/new.rc")
	public String regis_course() {
		return "regis_course/new";
	}

	// 수강 학생 등록 처리 요청
	@RequestMapping("/insert.rc")
	public String insert(RegisCourseVO vo) {
		// 화면에서 입력한 정보를 DB에 저장한 후
		service.regis_course_insert(vo);

		// 목록 화면으로 연결
		return "redirect:list_course.rc";
	}

	// 수강 학생 등록 처리 요청
	@RequestMapping("/insert_stu.rc")
	public String insert_detail(RegisCourseVO vo) {
		// 화면에서 입력한 정보를 DB에 저장한 후
		service.regis_course_insert(vo);

		// 목록 화면으로 연결
		return "redirect:detail.st?id=" + vo.getStudent_id();
	}

	// 수강 강좌 삭제 처리 요청
	@RequestMapping("/delete.rc")
	public String delete(RegisCourseVO vo) {
		// 선택한 고객 정보를 DB에서 삭제한 후
		service.regis_course_delete(vo);

		// 목록 화면으로 연결
		return "redirect:detail.st";
	}

	// 수강 강좌 삭제 처리 요청
	@RequestMapping("/delete_stu.rc")
	public String delete_detail(RegisCourseVO vo) {
		// 선택한 고객 정보를 DB에서 삭제한 후
		service.regis_course_delete(vo);

		// 학생 상세 화면으로 연결
		return "redirect:detail.st?id=" + vo.getStudent_id();
	}
}
