package egov.service;

import java.util.List;

public interface BoardService {
//notice
	List<?> noticeSelectList(NoticeVO vo)throws Exception;

	int noticeSelectTotal(NoticeVO vo)throws Exception;
//faq
	List<?> faqSelectList(FaqVO vo)throws Exception;

	int faqSelectTotal(FaqVO vo)throws Exception;
//answer
	int answerInsert(AnswerVO vo)throws Exception;

	List<?> answerSelectList(searchVO svo)throws Exception;

	int answerSelectTotal(searchVO svo)throws Exception;

	AnswerVO answerSelectModify(AnswerVO vo)throws Exception;
	
	int answerUpdate(AnswerVO vo)throws Exception;

	int answerDelete(AnswerVO vo)throws Exception;
	
//review
	int reviewSelectTotal()throws Exception;
	
	List<?> reviewSelect(searchVO svo)throws Exception;
	
	int reviewInsert(ReviewVO vo)throws Exception;
	
	ReviewVO reviewSelectDetail(ReviewVO vo)throws Exception;
	
	int reviewUpdate(ReviewVO vo)throws Exception;
	
	int reviewDelete(ReviewVO vo)throws Exception;

	int reviewUpdateFilename(ReviewVO vo)throws Exception;

	ReviewVO reviewSelectDetailrevnum(int revnum);

	double revSelectAvg()throws Exception;
	
	
	
	
	
	
}
