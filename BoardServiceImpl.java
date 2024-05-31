package egov.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.AnswerVO;
import egov.service.BoardService;
import egov.service.BoardVO;
import egov.service.FaqVO;
import egov.service.NoticeVO;
import egov.service.ReviewVO;
import egov.service.searchVO;
import egov.service.impl.BoardMapper;
@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="boardMapper")
	BoardMapper boardMapper;
	
	@Override
	public List<?> noticeSelectList(NoticeVO vo) throws Exception {
		return boardMapper.noticeSelectList(vo);
	}

	@Override
	public int noticeSelectTotal(NoticeVO vo) throws Exception {
		return boardMapper.noticeSelectTotal(vo);
	}

	@Override
	public List<?> faqSelectList(FaqVO vo) throws Exception {
		return boardMapper.faqSelectList(vo);
	}

	@Override
	public int faqSelectTotal(FaqVO vo) throws Exception {
		return boardMapper.faqSelectTotal(vo);
	}

	@Override
	public int answerInsert(AnswerVO vo) throws Exception {
		return boardMapper.answerInsert(vo);
	}

	@Override
	public List<?> answerSelectList(searchVO svo) throws Exception {
		return boardMapper.answerSelectList(svo);
	}

	@Override
	public int answerSelectTotal(searchVO svo) throws Exception {
		return boardMapper.answerSelectTotal(svo);
	}

	@Override
	public AnswerVO answerSelectModify(AnswerVO vo) throws Exception {
		return boardMapper.answerSelectModify(vo);
	}

	@Override
	public int reviewSelectTotal() throws Exception {
		return boardMapper.reviewSelectTotal();
	}

	@Override
	public List<?> reviewSelect(searchVO svo) throws Exception {
		return boardMapper.reviewSelect(svo);
	}

	@Override
	public int reviewInsert(ReviewVO vo) throws Exception {
		return boardMapper.reviewInsert(vo);
	}

	@Override
	public ReviewVO reviewSelectDetail(ReviewVO vo) throws Exception {
		return boardMapper.reviewSelectDetail(vo);
	}

	@Override
	public int answerUpdate(AnswerVO vo) throws Exception {
		return boardMapper.answerUpdate(vo);
	}

	@Override
	public int answerDelete(AnswerVO vo) throws Exception {
		return boardMapper.answerDelete(vo);
	}

	@Override
	public int reviewUpdate(ReviewVO vo) throws Exception {
		return boardMapper.reviewUpdate(vo);
	}

	@Override
	public int reviewDelete(ReviewVO vo) throws Exception {
		return boardMapper.reviewDelete(vo);
	}

	@Override
	public int reviewUpdateFilename(ReviewVO vo) throws Exception {
		return boardMapper.reviewUpdateFilename(vo);
	}

	@Override
	public ReviewVO reviewSelectDetailrevnum(int revnum) {
		return boardMapper.reviewSelectDetailrevnum(revnum);
	}

	@Override
	public double revSelectAvg() throws Exception {
		return boardMapper.revSelectAvg();
	}
	
	
	
	
	
	
	
	
}
