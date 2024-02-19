package com.kh.buffer.notice.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class NoticeVO {
	private int noticeNo;
	private String noticeName;
	private String noticeWriter;
	private String noticeContent;
	private Date NoticeDate;
	private Timestamp UpdateDate;
	private String noticeFileName;
	private String noticeFileRename;
	private String noticeFilepath;
	private long noticeFileSize;
	
	public NoticeVO () {}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeName() {
		return noticeName;
	}

	public void setNoticeName(String noticeName) {
		this.noticeName = noticeName;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return NoticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		NoticeDate = noticeDate;
	}

	public Timestamp getUpdateDate() {
		return UpdateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		UpdateDate = updateDate;
	}

	public String getNoticeFileName() {
		return noticeFileName;
	}

	public void setNoticeFileName(String noticeFileName) {
		this.noticeFileName = noticeFileName;
	}

	public String getNoticeFileRename() {
		return noticeFileRename;
	}

	public void setNoticeFileRename(String noticeFileRename) {
		this.noticeFileRename = noticeFileRename;
	}

	public String getNoticeFilepath() {
		return noticeFilepath;
	}

	public void setNoticeFilepath(String noticeFilepath) {
		this.noticeFilepath = noticeFilepath;
	}

	public long getNoticeFileSize() {
		return noticeFileSize;
	}

	public void setNoticeFileSize(long noticeFileSize) {
		this.noticeFileSize = noticeFileSize;
	}

	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noticeName=" + noticeName + ", noticeWriter=" + noticeWriter
				+ ", noticeContent=" + noticeContent + ", NoticeDate=" + NoticeDate + ", UpdateDate=" + UpdateDate
				+ ", noticeFileName=" + noticeFileName + ", noticeFileRename=" + noticeFileRename + ", noticeFilepath="
				+ noticeFilepath + ", noticeFileSize=" + noticeFileSize + "]";
	}
	
	
}
