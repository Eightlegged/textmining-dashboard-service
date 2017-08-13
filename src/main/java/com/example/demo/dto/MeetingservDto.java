package com.example.demo.dto;

public class MeetingservDto {

	private String meeting_id;
	private String mt_name,mt_part,mt_date;
	
	public String getMt_date() {
		return mt_date;
	}
	public void setMt_date(String mt_date) {
		this.mt_date = mt_date;
	}
	public String getMeeting_id() {
		return meeting_id;
	}
	public void setMeeting_id(String meeting_id) {
		this.meeting_id = meeting_id;
	}
	public String getMt_name() {
		return mt_name;
	}
	public void setMt_name(String mt_name) {
		this.mt_name = mt_name;
	}
	public String getMt_part() {
		return mt_part;
	}
	public void setMt_part(String mt_part) {
		this.mt_part = mt_part;
	}
	
}
