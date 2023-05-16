package com.human.java.domain;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BestplaceVO {
	
	int bestplace_id;
	int store_id;
	double bestplace_addressx;
	double bestplace_addressy;
	double center_addressx;
	double center_addressy;
	String bestplace_title;
	
}
