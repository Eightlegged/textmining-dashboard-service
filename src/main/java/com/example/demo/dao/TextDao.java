package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.demo.dto.keywordDTO;
import com.example.demo.dto.pieDto;
@Mapper
public interface TextDao {

	public List<String> a(String text);
	@Select("select KEYWORD,KEYWORDNUM from TEXTMINING  where PART=#{param} ORDER BY KEYWORDNUM DESC ")
	public List<keywordDTO> pieshow(@Param("param")String text);
	@Insert("insert into Textmining(keyword,keywordnum,id,part) values(#{keyword},#{keywordnum},1,'빅데이터')")
	public void insertText(@Param("keyword")String keyword, @Param("keywordnum")int keywordnum);
	@Select("select KEYWORD,KEYWORDNUM from TEXTMINING where PART=#{param} ORDER BY KEYWORDNUM DESC")
	public List<keywordDTO> allpieshow(@Param("param")String text);
	@Select("select TEXT from INSERTTEXT where Part=#{param}")
	public String textshow(@Param("param")String text);
	
}
