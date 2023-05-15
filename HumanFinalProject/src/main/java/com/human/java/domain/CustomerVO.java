package com.human.java.domain;

import lombok.Data;

@Data
public class CustomerVO {
	
	int CUSTOMER_ID;
	String CUSTOMER_NAME;
	String CUSTOMER_LOGINID;
	String CUSTOMER_PASSWORD;
	String CUSTOMER_EMAIL;
	int CUSTOMER_MONEY;
	String CUSTOMER_PREFERMENU;
	String CUSTOMER_PREFERSTORE;
	String CUSTOMER_BIRTHDAY;
	String CUSTOMER_NICKNAME;
	int CUSTOMER_ADDRESSX;
	int CUSTOMER_ADDRESSY;
	
	//일상
	String CUSTOMER_ADDRESS1;
	String CUSTOMER_ADDRESS2;
	String CUSTOMER_ADDRESS3;
	String CUSTOMER_ADDRESS4;
	
}
