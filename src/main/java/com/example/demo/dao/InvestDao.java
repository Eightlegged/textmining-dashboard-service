package com.example.demo.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.dto.MeetingservDto;
import com.example.demo.dto.scoreDto;

@Mapper
public interface InvestDao {
@Insert("insert into survey(meeting_id,part,invest1,invest2,invest3,invest4,invest5) values(#{param},'예시',#{param1 ,jdbcType=VARCHAR},#{param2,jdbcType=VARCHAR},#{param3,jdbcType=VARCHAR},#{param4,jdbcType=VARCHAR},#{param5,jdbcType=VARCHAR})")
	public void insertInvest(@Param("param")String meeting_id,@Param("param1")String input1,@Param("param2")String input2,@Param("param3")String input3,@Param("param4")String input4,@Param("param5")String input5);

@Insert("insert into survey_infor(user_id,meeting_id) values(#{param1},#{param2})")
public void insertsurvey_info(@Param("param1")String user_id, @Param("param2")String meeting_id);
@Select("select user_info.user_id from USER_MT_CONNECT Inner JOIN user_info ON USER_MT_CONNECT.user_id=user_info.user_id where user_mt_connect.meeting_id=#{param}")
public List<String> useridlist(@Param("param")String meeting_id);
@Insert("insert into survey_result(meeting_id,USER_ID,score1,score2,score3,score4,score5) values(#{param1},#{param2},#{param3},#{param4},#{param5},#{param6},#{param7})")
public void insertsurvey_result(@Param("param1")String meeting_id,@Param("param2")String user_id,@Param("param3")String score1,@Param("param4")String score2,@Param("param5")String score3,@Param("param6")String score4,@Param("param7")String score5);
@Select("select m.meeting_id, m.mt_name,m.mt_date,m.mt_part from meeting_serv m Inner join survey_infor s On m.meeting_id=s.meeting_id where s.user_id=#{param} and s.survey_success='N'")
public List<MeetingservDto> meetingresult(@Param("param")String user_id);
@Select("select invest1 from survey where meeting_id=#{param}")
public String allsurvey(@Param("param")String meeting_id);
@Select("select invest2 from survey where meeting_id=#{param}")
public String allsurvey2(@Param("param")String meeting_id);
@Select("select invest3 from survey where meeting_id=#{param}")
public String allsurvey3(@Param("param")String meeting_id);
@Select("select invest4 from survey where meeting_id=#{param}")
public String allsurvey4(@Param("param")String meeting_id);
@Select("select invest5 from survey where meeting_id=#{param}")
public String allsurvey5(@Param("param")String meeting_id);
@Select("select score1,score2,score3,score4,score5 from survey_result where meeting_id=#{param}")
public List<scoreDto> showsurvey_result(@Param("param")String meeting_id);
@Update("update survey_infor set survey_success ='Y' where user_id=#{param} and meeting_id=#{param1}")
public void updatesurvey(@Param("param")String user_id,@Param("param1")String meeting_id);
///////////////////////
//////////////////////

@Select("select avg(score1) from survey_result where meeting_id=#{param} ")
public int surveycount(@Param("param")String meeting_id);

@Select("select avg(score2) from survey_result where meeting_id=#{param} ")
public int surveycount2(@Param("param")String meeting_id);

@Select("select avg(score3) from survey_result where meeting_id=#{param} ")
public int surveycount3(@Param("param")String meeting_id);

@Select("select avg(score4) from survey_result where meeting_id=#{param} ")
public int surveycount4(@Param("param")String meeting_id);

@Select("select avg(score5) from survey_result where meeting_id=#{param} ")
public int surveycount5(@Param("param")String meeting_id);
}
