package com.human.java.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.human.java.domain.BestplaceVO;
import com.human.java.domain.CustomerVO;
import com.human.java.domain.DdipVO;
import com.human.java.domain.MenuVO;
import com.human.java.domain.StoreVO;
import com.human.java.service.DdipService;
import com.human.java.service.StoreService;

@Controller
@RequestMapping("/store/")
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private DdipService ddipService;
	
	@RequestMapping("{url}.do")
	public String userViewPage(@PathVariable String url) {		
		return "/ddip/" + url;
	}
	
	@RequestMapping("get_session_id")
	@ResponseBody
	public Map<String, Object> getSessionId(HttpSession session) {
	 
		Object customer_id =session.getAttribute("customer_id");
		System.out.println(customer_id);
		
		if(customer_id !=null) {
			
			Map<String, Object> sessionMap = new HashMap<>();
			sessionMap.put("customer_id", customer_id);
			    
			return sessionMap;
			
		} else {
			
			Map<String, Object> sessionMap = new HashMap<>();
			sessionMap.put("customer_id", null);
			
			return sessionMap;
		}
	
	}
	
	
	@RequestMapping("03_StoreList.do")
	public String getStoreList(Model model, HttpSession session) {
			
		List<StoreVO> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		
		return "/ddip/03_StoreList";
	}
	
	@RequestMapping("03_Tabmove")
	@ResponseBody
	public Map<String, List<StoreVO>> test(String inputData) {

		List<StoreVO> storeList = storeService.getStoreList(inputData);
		Map<String, List<StoreVO>> storeMap = new HashMap<String,List<StoreVO>>();
		storeMap.put("storeList1", storeList);
		
		return storeMap;		
	}
	
	@RequestMapping("04_Tabmove")
	@ResponseBody
	public Map<String, List<StoreVO>>getReviewList(int store_id){
		
		List<StoreVO> reviewList = storeService.getReviewList(store_id);
		Map<String, List<StoreVO>> reviewMap = new HashMap<String,List<StoreVO>>();
		reviewMap.put("reviewMap",reviewList);

		return reviewMap;
	}
	
	@RequestMapping("04_Store")
	public String getStore(@RequestParam("store_id") int store_id, Model model, HttpSession session) {
	 	
	 	List<StoreVO> storeInfo = storeService.getStore(store_id);
	 	model.addAttribute("storeInfo", storeInfo);
	 	
	 	return "/ddip/04_Store";
	}
	
	@RequestMapping("04_Store2")
	public String getStore2(DdipVO ddipVO ,Model model, HttpSession session) {
	 	
	 	List<StoreVO> storeInfo = storeService.getStore2(ddipVO);
	 	System.out.println("storeInfo: "+storeInfo);
	 	model.addAttribute("storeInfo", storeInfo);
	 	model.addAttribute("ddip_id", ddipVO.getDdip_id());
	 	
	 	return "/ddip/04_Store2";
	}
	
	// 메뉴 리스트 05에 전달
	@RequestMapping("/05_DdipWrite")
	public String menu(@RequestParam("menuList") String menuList_JSON, 
			@RequestParam("store_id") int store_id, Model model, HttpSession session) {
		
		
		System.out.println("customer_id:"+session.getAttribute("customer_id"));
		
		
		Gson gson = new Gson();
		Type type = new TypeToken<List<MenuVO>>(){}.getType();
		List<MenuVO> menuList = gson.fromJson(menuList_JSON, type);
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("menuList_JSON", menuList_JSON);
		model.addAttribute("store_id", store_id);
		
		return "/ddip/05_DdipWrite";
	}
	
	@RequestMapping("/05to06_DdipList")
	public String ddip( @RequestParam("menuList") String menuList_JSON, 
			@RequestParam("store_id") int store_id, 
			Model model, DdipVO ddipVO, HttpSession session) {


		Gson gson = new Gson();
		Type type = new TypeToken<List<MenuVO>>(){}.getType();
		List<MenuVO> menuList = gson.fromJson(menuList_JSON, type);
		List<DdipVO> ddipList = new ArrayList<>();
		
		for (MenuVO menuVO : menuList) {
			
			DdipVO ddipVO2 = new DdipVO();
			ddipVO2.setDdip_totalcnt(ddipVO.getDdip_totalcnt());
			ddipVO2.setDdip_message(ddipVO.getDdip_message());
			ddipVO2.setDdip_pickupplace(ddipVO.getDdip_pickupplace());
			ddipVO2.setDdip_deadline(ddipVO.getDdip_deadline());
			ddipVO2.setDdip_pickuptime(ddipVO.getDdip_pickuptime());
			ddipVO2.setDdip_picture_name(ddipVO.getDdip_picture_name());
			ddipVO2.setDdip_picture_enname(ddipVO.getDdip_picture_enname());
			ddipVO2.setB_fsize(ddipVO.getB_fsize());
			ddipVO2.setFileExtension(ddipVO.getFileExtension());
			ddipVO2.setDdip_picture(ddipVO.getDdip_picture());
			ddipVO2.setStore_id(store_id);
		    ddipVO2.setOrder_time(menuVO.getOrder_time());
		    ddipVO2.setOrder_menu_id(menuVO.getMenu_id());
			ddipVO2.setOrder_menu_name(menuVO.getMenu_name());
		    ddipVO2.setOrder_menu_price(menuVO.getMenu_price());
		    ddipVO2.setOrder_menu_quantity(menuVO.getMenu_quantity());
		    ddipVO2.setCustomer_id(((int) session.getAttribute("customer_id")));
		    ddipList.add(ddipVO2);
		    
		}
		System.out.println("ddipList1:"+ddipList);
		ddipService.setDdip(ddipList,store_id);
		
		model.addAttribute("ddipList", ddipService.getDdipList());
		
		return "redirect:/store/06_DdipList";
	}
	
	// 04_Store2
		@RequestMapping("ddipPlus")
		public String ddipPlus( @RequestParam("menuList") String menuList_JSON, 
				@RequestParam("store_id") int store_id, 
				Model model, DdipVO ddipVO, HttpSession session) {
			
			
			System.out.println("store_id : "+store_id);
			System.out.println("ddipVO : "+ddipVO);
			System.out.println("customer_id : "+((int) session.getAttribute("customer_id")));
			
			Gson gson = new Gson();
			Type type = new TypeToken<List<MenuVO>>(){}.getType();
			List<MenuVO> menuList = gson.fromJson(menuList_JSON, type);
			List<DdipVO> ddipList = new ArrayList<>();
			System.out.println("menuList : "+menuList);
			for (MenuVO menuVO : menuList) {
				
				DdipVO ddipVO2 = new DdipVO();
//				ddipVO2.setDdip_totalcnt(ddipVO.getDdip_totalcnt());
//				ddipVO2.setDdip_message(ddipVO.getDdip_message());
//				ddipVO2.setDdip_pickupplace(ddipVO.getDdip_pickupplace());
//				ddipVO2.setDdip_deadline(ddipVO.getDdip_deadline());
//				ddipVO2.setDdip_pickuptime(ddipVO.getDdip_pickuptime());
//				ddipVO2.setDdip_picture_name(ddipVO.getDdip_picture_name());
//				ddipVO2.setDdip_picture_enname(ddipVO.getDdip_picture_enname());
//				ddipVO2.setB_fsize(ddipVO.getB_fsize());
//				ddipVO2.setFileExtension(ddipVO.getFileExtension());
//				ddipVO2.setDdip_picture(ddipVO.getDdip_picture());
				
				ddipVO2.setDdip_id(ddipVO.getDdip_id());
				ddipVO2.setStore_id(store_id);
			    ddipVO2.setOrder_time(menuVO.getOrder_time());
			    ddipVO2.setOrder_menu_id(menuVO.getMenu_id());
				ddipVO2.setOrder_menu_name(menuVO.getMenu_name());
			    ddipVO2.setOrder_menu_price(menuVO.getMenu_price());
			    ddipVO2.setOrder_menu_quantity(menuVO.getMenu_quantity());
			    ddipVO2.setCustomer_id(((int) session.getAttribute("customer_id")));
			    ddipList.add(ddipVO2);
			    
			}
			System.out.println("ddipList : "+ddipList);
			ddipService.setDdip2(ddipList);
			
			model.addAttribute("ddipList", ddipService.getDdipList());
			
			return "redirect:/store/06_DdipList";
		}
	
	@RequestMapping("/06_DdipList")
	public String ddip( Model model,  HttpSession session) {
		
		model.addAttribute("ddipList", ddipService.getDdipList());
		
		return "/ddip/06_DdipList";
	}
	
	
	@RequestMapping("05_MapInfo")
	@ResponseBody
	public Map<String, List<BestplaceVO>> getBestPlace(int store_id) {
	 	
	 	List<BestplaceVO> mapInfo = storeService.getBestPlace(store_id);
	 	Map<String,List<BestplaceVO>> mapInfoMap = new HashMap<String, List<BestplaceVO>>();
	 	
	 	mapInfoMap.put("mapInfo",mapInfo);
	 	
	 	return mapInfoMap;
	}
	
	@RequestMapping("07_Ddip")
	public String getDdip(DdipVO vo, Model model) {
		
		DdipVO ddipvo = ddipService.getDdip(vo);
		System.out.println(ddipvo);
		model.addAttribute("ddipvo", ddipvo);
		return "/ddip/07_Ddip";
	}
	
	// 07_Ddip
	@RequestMapping("get_ddip")
	@ResponseBody
	public Map<String, Object> getDdipAjax(int ddip_id,HttpSession session) {
		
		DdipVO ddipvo = new DdipVO();
		ddipvo.setDdip_id(ddip_id);
		
		Map<String, Object> sessionMap = new HashMap<>();
		sessionMap.put("ddipvo", ddipService.getDdip(ddipvo));
		
		return sessionMap;
	}
	
	// 07_Ddip
	@RequestMapping("ddip_chk")
	@ResponseBody
	public int ddipChk(int ddip_id, HttpSession session){
		
			
		Object sessionChk = session.getAttribute("customer_id"); 
		 
		if(sessionChk != null) {

		DdipVO ddipVO = new DdipVO(); 
		
			ddipVO.setCustomer_id(Integer.parseInt(sessionChk.toString())); // 1104
			ddipVO.setDdip_id(ddip_id); // 1194
			int ddipChk = ddipService.ddipChk(ddipVO);
			return ddipChk;
			
		} else {
			
			return -1;
		}
   	
	}
	
}	
	
	

	 














