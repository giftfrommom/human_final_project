package com.human.java.domain;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ConditionVO {
	
	
	String combo1_options;
	String combo2_options;
	String gender;
	String startDate;
	String endDate;
	String categoryName;
	String search;
	
}
