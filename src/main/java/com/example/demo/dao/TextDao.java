package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.dto.MeetingservDto;
import com.example.demo.dto.chartDto;
import com.example.demo.dto.keywordDTO;
import com.example.demo.dto.pieDto;
import com.example.demo.dto.userDto;
@Mapper
public interface TextDao {

	public List<String> a(String text);
	@Select("select KEYWORD,KEYWORDNUM from TEXTMINING  where meeting_id=#{param} ORDER BY KEYWORDNUM DESC ")
	public List<keywordDTO> pieshow(@Param("param")String text);
	@Insert("insert into Textmining(keyword,keywordnum,meeting_id,mt_part) values(#{keyword},#{keywordnum},#{param},#{param1})")
	public void insertText(@Param("param1")String part,@Param("param")String id,@Param("keyword")String keyword, @Param("keywordnum")int keywordnum);
	@Select("select KEYWORD,KEYWORDNUM from TEXTMINING where meeting_id=#{param} ORDER BY KEYWORDNUM DESC")
	public List<keywordDTO> allpieshow(@Param("param")String text);
	@Select("select TEXT from INSERTTEXT where Part=#{param}")
	public String textshow(@Param("param")String text);
	@Select("select meeting_id, mt_name,mt_date,mt_part from meeting_serv")
	public List<MeetingservDto> ALLmeeting_serv();
	@Select("select count(mt_part) from meeting_serv where MT_DATE >=TO_DATE(#{param},'YY/MM') and MT_DATE <TO_DATE(#{param1},'YY/MM') group by mt_part")
	public List<Integer> meetingmonth(@Param("param")String start, @Param("param1")String end);
	@Select("select mt_part from meeting_serv where MT_DATE >=TO_DATE(#{param},'YY/MM') and MT_DATE <TO_DATE(#{param1},'YY/MM') group by mt_part")
	public List<String> meetingmonth1(@Param("param")String start, @Param("param1")String end);
	@Select("select KEYWORD from TEXTMINING where meeting_id=#{param}")
	public List<String> showkeyword(@Param("param") String part);
	@Select("select keyword from textmining Inner JOIN meeting_serv ON meeting_serv.meeting_id = textmining.meeting_id where meeting_serv.MT_DATE >=TO_DATE(#{param},'YY/MM') and meeting_serv.MT_DATE <TO_DATE(#{param1},'YY/MM') and textmining.mt_part=#{param2} group by keyword,keywordnum ORDER BY sum(keywordnum) DESC")
	public List<String> monthpieshow(@Param("param")String start, @Param("param1")String end,@Param("param2")String part);
	@Select("select sum(keywordnum) from textmining Inner JOIN meeting_serv ON meeting_serv.meeting_id = textmining.meeting_id where meeting_serv.MT_DATE >=TO_DATE(#{param},'YY/MM') and meeting_serv.MT_DATE <TO_DATE(#{param1},'YY/MM') and textmining.mt_part=#{param2} group by keyword,keywordnum ORDER BY sum(keywordnum) DESC")
	public List<Integer> monthpieshow1(@Param("param")String start, @Param("param1")String end,@Param("param2")String part);
	@Select("select keyword from textmining Inner JOIN meeting_serv ON meeting_serv.meeting_id = textmining.meeting_id where meeting_serv.MT_DATE >=TO_DATE(#{param},'YY/MM') and meeting_serv.MT_DATE <TO_DATE(#{param1},'YY/MM')  group by keyword,keywordnum ORDER BY sum(keywordnum) DESC")
	public List<String> monthallshow(@Param("param")String start, @Param("param1")String end);
	@Select("select sum(keywordnum) from textmining Inner JOIN meeting_serv ON meeting_serv.meeting_id = textmining.meeting_id where meeting_serv.MT_DATE >=TO_DATE(#{param},'YY/MM') and meeting_serv.MT_DATE <TO_DATE(#{param1},'YY/MM')  group by keyword,keywordnum ORDER BY sum(keywordnum) DESC")
	public List<Integer> monthallshow1(@Param("param")String start, @Param("param1")String end);
	@Select("select keyword from textmining Inner JOIN meeting_serv ON meeting_serv.meeting_id = textmining.meeting_id where meeting_serv.MT_DATE >=TO_DATE('17/01','YY/MM') and meeting_serv.MT_DATE <=TO_DATE('17/12','YY/MM')  group by keyword,keywordnum ORDER BY sum(keywordnum) DESC")
	public List<String> yearallshow();
	@Select("select sum(keywordnum) from textmining Inner JOIN meeting_serv ON meeting_serv.meeting_id = textmining.meeting_id where meeting_serv.MT_DATE >=TO_DATE('17/01','YY/MM') and meeting_serv.MT_DATE <=TO_DATE('17/12','YY/MM')  group by keyword,keywordnum ORDER BY sum(keywordnum) DESC")
	public List<Integer> yearallshow1();
	@Select("select Text from INSERTTEXT where part=#{param}")
	public String text_speech1(@Param("param")String part);
	@Select("select Text from Inserttext where part!=#{param}")
	public List<String> text_speeches(@Param("param")String part);
	@Select("select user_info.user_name, user_info.user_position,user_info.user_email from USER_MT_CONNECT Inner JOIN user_info ON USER_MT_CONNECT.user_id=user_info.user_id where user_mt_connect.meeting_id=#{param}")
	public List<userDto> meetinguserlist(@Param("param")String part);
	@Select("select part from Inserttext where part!=#{param}")
	public List<String> text_num(@Param("param")String part);
	@Select("select meeting_id, mt_name,mt_date,mt_part from meeting_serv where meeting_id=#{param}")
	public MeetingservDto Assomeeting_serv(@Param("param")String part);
	@Insert("insert into inserttext(part, text) values(#{param},#{param1})")
	public void inserttextSTT(@Param("param")String meeting_id, @Param("param1")String text);
	
	
}
