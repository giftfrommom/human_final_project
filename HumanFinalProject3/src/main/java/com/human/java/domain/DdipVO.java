package com.human.java.domain;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class DdipVO {
	
	int ddip_id;
	int customer_id;
	int ddip_currentcnt;
	int ddip_totalcnt;
	String ddip_message;
	String ddip_pickupplace;
	String ddip_store_type;	
	String ddip_deadline;
	String ddip_pickuptime;
	
	// STORE
	int store_id;
	String store_name;
	
	// ORDER_TBL
	int order_tbl_id;
	String order_time;

	// ORDER_TBL_DETAIL
	int order_tbl_datail_id;
	int order_menu_id;
	String order_menu_name;
	int order_menu_price;
	int order_menu_quantity;
	
	// file
	private String ddip_picture_name; // ddip_picture_name
	private String ddip_picture_enname; // ddip_picture_enname
	private long b_fsize;
	String fileExtension;
	
	//////////////////////////////
	MultipartFile ddip_picture; // Form 태그에 있는 type="file"인 대상의 name=""과 동일해야합니다.
	
	public MultipartFile getDdip_picture() {
		return ddip_picture;
	}

	public void setDdip_picture(MultipartFile ddip_picture) {
		
		this.ddip_picture = ddip_picture;
		System.out.println("**파일 첨부 변수 생성**");
		// 현재 이 시점은 Controller의 파라미터가 생성되는 시점 / Controller가 실행되기 전
		// 현재 시점에서 파일에 대한 정보를 담을 변수에 값을 채워주는 작업 코딩
		if(!ddip_picture.isEmpty()) {
			// 파일 이름 추출, 사이즈 추출, 확장자 추출
			this.ddip_picture_name = ddip_picture.getOriginalFilename();
			this.b_fsize = ddip_picture.getSize();
			
			// 실제파일 생성 >> 혹시 사용자가 같은 이름을 가진 파일을 첨부한다면 이전 파일에게 덮어집니다. > 이전 파일 훼손
//			File f = new File("C:\\Users\\human\\Desktop\\sts\\cWebBoard\\src\\main\\webapp\\resources\\upload\\"+b_fname);
			
			// 가짜이름(파일이름)을 생성하여 문제 보완
			// 1. 가짜이름에 사용할 파일의 확장자명을 추출 (진짜 이름에서 추출)
			this.fileExtension = ddip_picture_name.substring(ddip_picture_name.lastIndexOf("."));
			
			// 2. 사용자의 파일을 저장할때 이름이 겹치지 않도록 암호화하는 특별한 코드(암호화)
			// 형식 : 랜덤문자열32자리.확장자명
			this.ddip_picture_enname = UUID.randomUUID().toString().replaceAll("-","");
			
			// b_fname_en : 랜덤문자열32자리 이므로 중복없이 저장이 가능합니다.
			// 랜덤문자(b_fname_en) 와 실제파일명(b_fname)은 서로 매칭해야하기 때문에 DB에서 둘 다 저장해야합니다.		
			File f = new File("C:\\Users\\ejs11\\git\\human_final_project2\\HumanFinalProject3\\src\\main\\webapp\\resources\\upload\\"+ddip_picture_enname+fileExtension);
			
			
			try {
				// 첨부파일로 받은 데이터를 File클래스로 만든 데이터에게 변환
				ddip_picture.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		// 비어 있으면 패스
		
	}
	
}
