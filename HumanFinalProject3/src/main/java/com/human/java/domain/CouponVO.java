package com.human.java.domain;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CouponVO {
	
	int COUPON_ID;
	int CUSTOMER_ID;
	int COUPON_DISCOUNT;
	int COUPON_MINIMUM;
	
}
