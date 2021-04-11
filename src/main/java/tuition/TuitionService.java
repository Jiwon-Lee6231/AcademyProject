package tuition;

import java.util.List;

public interface TuitionService {
	// 수강료 내역 추가
	void tuition_insert(TuitionVO vo);

	// 목록 조회
	List<TuitionVO> tuition_list();

	// 상세(1건) 조회
	TuitionVO tuition_detail(int id);

	// 수강료 내용 저장
	void tuition_update(TuitionVO vo);

	// 수강료 내용 삭제
	void tuition_delete(int id);
}
