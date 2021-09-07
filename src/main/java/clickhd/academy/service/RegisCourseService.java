package clickhd.academy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import clickhd.academy.mapper.RegisCourseMapper;
import clickhd.academy.vo.RegisCourseVO;

@Service
public class RegisCourseService {
	@Autowired
	private RegisCourseMapper mapper;
	
	// 수강할 강좌 내역에 등록
	public void regis_course_insert(RegisCourseVO vo) {
		mapper.regis_course_insert(vo);
	}

	// 수강 강좌 내역 삭제
	public void regis_course_delete(RegisCourseVO vo) {
		mapper.regis_course_delete(vo);
	}

} 