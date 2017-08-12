package com.example.demo.dto;

public class pieDto {

	private String label;
	private int value;
	
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "{label=" + label + ", value=" + value + "}";
	}
	
	
	
}
