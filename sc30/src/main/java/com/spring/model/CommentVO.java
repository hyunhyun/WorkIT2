package com.spring.model;

import java.sql.Timestamp;

public class CommentVO {
	private int commentID;
	private int memoID;
	private String writer;
	private String content;
	private Timestamp date;

	public int getCommentID() {
		return commentID;
	}

	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}

	public int getMemoID() {
		return memoID;
	}

	public void setMemoID(int memoID) {
		this.memoID = memoID;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

}
