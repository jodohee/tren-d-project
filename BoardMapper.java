package egov.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egov.service.AnswerVO;
import egov.service.BoardVO;
import egov.service.FaqVO;
import egov.service.NoticeVO;
import egov.service.ReviewVO;
import egov.service.searchVO;

@Mapper("boardMapper")
public interface BoardMapper {
//notice
	List<?> noticeSelectList(NoticeVO vo);

	int noticeSelectTotal(NoticeVO vo);
//faq
	List<?> faqSelectList(FaqVO vo);

	int faqSelectTotal(FaqVO vo);
//answer
	int answerInsert(AnswerVO vo);

	List<?> answerSelectList(searchVO svo);

	int answerSelectTotal(searchVO svo);

	AnswerVO answerSelectModify(AnswerVO vo);

	int answerUpdate(AnswerVO vo);

	int answerDelete(AnswerVO vo);
//review
	int reviewSelectTotal();

	List<?> reviewSelect(searchVO svo);

	int reviewInsert(ReviewVO vo);

	ReviewVO reviewSelectDetail(ReviewVO vo);
	
	int reviewUpdate(ReviewVO vo);

	int reviewDelete(ReviewVO vo);

	int reviewUpdateFilename(ReviewVO vo);

	ReviewVO reviewSelectDetailrevnum(int revnum);

	double revSelectAvg();
	
	
	
	
	
}
