package com.example.demo.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.investDto;
@Mapper
public interface InvestDao {
@Insert("insert into invest(id,part,invest1,invest2,invest3,invest4,invest5,invest6,invest7,invest8,invest9	) values(1,'빅데이터',#{invest1 ,jdbcType=VARCHAR},#{invest2,jdbcType=VARCHAR},#{invest3,jdbcType=VARCHAR},#{invest4,jdbcType=VARCHAR},#{invest5,jdbcType=VARCHAR},#{invest6,jdbcType=VARCHAR},#{invest7,jdbcType=VARCHAR},#{invest8,jdbcType=VARCHAR},#{invest9,jdbcType=VARCHAR})")
	public void insertInvest(investDto test);
}
