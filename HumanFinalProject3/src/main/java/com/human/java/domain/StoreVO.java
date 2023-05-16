package com.human.java.domain;

import lombok.Data;

@Data
public class StoreVO {
	//store�뀒�씠釉�
	int store_id;
	String store_type;
	String store_name;
	String store_picture;
	
	//menu�뀒�씠釉�
	int menu_id;
	String menu_name;
	int menu_price;
	
	//review�뀒�씠釉�
	int review_id;
	String review_content;
	int review_rating_taste;
	int review_rating_amount;
	int review_rating_state;
	int review_like;
	
	
}
