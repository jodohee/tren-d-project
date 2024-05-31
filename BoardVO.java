package egov.service;

public class BoardVO {

//notice	
	String noticenum;
	String noticetitle;
	String noticecont;
	String noticedate;
	String noticename;
	String noticestate;
	
	/** 검색조건 */
	String searchCondition = "";

	/** 검색Keyword */
	String searchKeyword = "";

	/** 검색사용여부 */
	String searchUseYn = "";

	/** 현재페이지 */
	int pageIndex = 1;
	

	/** 페이지갯수 */
	int pageUnit = 5;

	/** 페이지사이즈 */
	int pageSize = 5;

	/** firstIndex */
	int firstIndex = 1;

	/** lastIndex */
	int lastIndex = 5;
	
	/** recordCountPerPage */
	private int recordCountPerPage = 5;

	int PageStartNo;
	
	int PageLastNo;
	
	int TotalPageCnt;
	
	
	
	
	
	String open_no;
	String faq_page_no;
	
//faq	
	String faqnum;
	String faqcode;
	String faqtitle;
	String faqcont;
	String faqans;
//answer	
	String qnanum;
	String userid;
	String prounq;
	String qnatitle;
	String qnacont;
	String qnadate;
	String qnacode;
	int anspageIndex;
	
//review	
	String nickname;
	String revcont;
	String revdate;
	String revgrade;
	String revfilename;
	int revnum;
	int repageIndex;
	
	
	
	
	public int getPageStartNo() {
		return PageStartNo;
	}
	public void setPageStartNo(int pageStartNo) {
		PageStartNo = pageStartNo;
	}
	public int getPageLastNo() {
		return PageLastNo;
	}
	public void setPageLastNo(int pageLastNo) {
		PageLastNo = pageLastNo;
	}
	public int getTotalPageCnt() {
		return TotalPageCnt;
	}
	public void setTotalPageCnt(int totalPageCnt) {
		TotalPageCnt = totalPageCnt;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public int getRevnum() {
		return revnum;
	}
	public void setRevnum(int revnum) {
		this.revnum = revnum;
	}
	public int getRepageIndex() {
		return repageIndex;
	}
	public void setRepageIndex(int repageIndex) {
		this.repageIndex = repageIndex;
	}
	public int getAnspageIndex() {
		return anspageIndex;
	}
	public void setAnspageIndex(int anspageIndex) {
		this.anspageIndex = anspageIndex;
	}
	public String getFaqnum() {
		return faqnum;
	}
	public void setFaqnum(String faqnum) {
		this.faqnum = faqnum;
	}
	public String getFaqcode() {
		return faqcode;
	}
	public void setFaqcode(String faqcode) {
		this.faqcode = faqcode;
	}
	public String getFaqtitle() {
		return faqtitle;
	}
	public void setFaqtitle(String faqtitle) {
		this.faqtitle = faqtitle;
	}
	public String getFaqcont() {
		return faqcont;
	}
	public void setFaqcont(String faqcont) {
		this.faqcont = faqcont;
	}
	public String getFaqans() {
		return faqans;
	}
	public void setFaqans(String faqans) {
		this.faqans = faqans;
	}
	public String getQnanum() {
		return qnanum;
	}
	public void setQnanum(String qnanum) {
		this.qnanum = qnanum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getProunq() {
		return prounq;
	}
	public void setProunq(String prounq) {
		this.prounq = prounq;
	}
	public String getQnatitle() {
		return qnatitle;
	}
	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}
	public String getQnacont() {
		return qnacont;
	}
	public void setQnacont(String qnacont) {
		this.qnacont = qnacont;
	}
	public String getQnadate() {
		return qnadate;
	}
	public void setQnadate(String qnadate) {
		this.qnadate = qnadate;
	}
	public String getQnacode() {
		return qnacode;
	}
	public void setQnacode(String qnacode) {
		this.qnacode = qnacode;
	}
	public String getFaq_page_no() {
		return faq_page_no;
	}
	public void setFaq_page_no(String faq_page_no) {
		this.faq_page_no = faq_page_no;
	}
	public String getOpen_no() {
		return open_no;
	}
	public void setOpen_no(String open_no) {
		this.open_no = open_no;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchUseYn() {
		return searchUseYn;
	}
	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	public String getNoticenum() {
		return noticenum;
	}
	public void setNoticenum(String noticenum) {
		this.noticenum = noticenum;
	}
	public String getNoticetitle() {
		return noticetitle;
	}
	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}
	public String getNoticecont() {
		return noticecont;
	}
	public void setNoticecont(String noticecont) {
		this.noticecont = noticecont;
	}
	public String getNoticedate() {
		return noticedate;
	}
	public void setNoticedate(String noticedate) {
		this.noticedate = noticedate;
	}
	public String getNoticename() {
		return noticename;
	}
	public void setNoticename(String noticename) {
		this.noticename = noticename;
	}
	public String getNoticestate() {
		return noticestate;
	}
	public void setNoticestate(String noticestate) {
		this.noticestate = noticestate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRevcont() {
		return revcont;
	}
	public void setRevcont(String revcont) {
		this.revcont = revcont;
	}
	public String getRevdate() {
		return revdate;
	}
	public void setRevdate(String revdate) {
		this.revdate = revdate;
	}

	public String getRevfilename() {
		return revfilename;
	}
	public void setRevfilename(String revfilename) {
		this.revfilename = revfilename;
	}
	public String getRevgrade() {
		return revgrade;
	}
	public void setRevgrade(String revgrade) {
		this.revgrade = revgrade;
	}
	
	
	
	
	
}
