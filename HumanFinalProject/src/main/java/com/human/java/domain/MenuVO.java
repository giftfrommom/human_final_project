package com.human.java.domain;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class MenuVO {

	//menu테이블
	int menu_id;
	String menu_name;
	int menu_price;
	int menu_quantity;
	String order_time;
}
