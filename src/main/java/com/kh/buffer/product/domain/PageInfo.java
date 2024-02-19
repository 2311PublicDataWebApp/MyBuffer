package com.kh.buffer.product.domain;

public class PageInfo {
	private int currentPage;
	private int totalCount;
	private int naviTotalCount;
	private int recordPerPage;
	private int naviPerPage;
	private int startNavi;
	private int endNavi;

	public PageInfo() {
		this.recordPerPage = 5;
		this.naviPerPage = 5;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getNaviTotalCount() {
		return naviTotalCount;
	}

	public void setNaviTotalCount(int naviTotalCount) {
		this.naviTotalCount = naviTotalCount;
	}

	public int getRecordPerPage() {
		return recordPerPage;
	}

	public void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}

	public int getNaviPerPage() {
		return naviPerPage;
	}

	public void setNaviPerPage(int naviPerPage) {
		this.naviPerPage = naviPerPage;
	}

	public int getStartNavi() {
		return startNavi;
	}

	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}

	public int getEndNavi() {
		return endNavi;
	}

	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}

	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", totalCount=" + totalCount + ", naviTotalCount="
				+ naviTotalCount + ", recordPerPage=" + recordPerPage + ", naviPerPage=" + naviPerPage + ", startNavi="
				+ startNavi + ", endNavi=" + endNavi + "]";
	}

}
