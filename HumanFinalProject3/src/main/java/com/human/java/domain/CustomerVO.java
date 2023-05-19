package com.human.java.domain;

import lombok.Data;

@Data
public class CustomerVO {
	
	int CUSTOMER_ID;
	String CUSTOMER_NAME;
	String CUSTOMER_PREFERMENU;
	String CUSTOMER_PREFERSTORE;
	String CUSTOMER_BIRTHDAY;
	String CUSTOMER_GENDER;
	String CUSTOMER_LOGINID;
	String CUSTOMER_PASSWORD;
	String CUSTOMER_EMAIL;
	int customer_money;
	String CUSTOMER_NICKNAME;
	int CUSTOMER_ADDRESSX;
	int CUSTOMER_ADDRESSY;
	
	//일상
	String CUSTOMER_ADDRESS1;
	String CUSTOMER_ADDRESS2;
	String CUSTOMER_ADDRESS3;
	String CUSTOMER_ADDRESS4;
	
	int customer_id_j;
	String customer_name_j;
	String customer_prefermenu_j;
	String customer_preferstore_j;
	String customer_birthday_j;
	String customer_gender_j;
	
}
