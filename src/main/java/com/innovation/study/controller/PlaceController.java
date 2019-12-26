package com.innovation.study.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innovation.study.domain.DataVO;
import com.innovation.study.service.DataService;
import com.innovation.study.util.DataUtil;

@Controller
@RequestMapping("/pl")
public class PlaceController {
	
	@Autowired
	private DataService dataService;
	
	@RequestMapping(value="/sights.do", method=RequestMethod.GET)
	public String sights(@RequestParam(value="a", defaultValue="대전", required=false) String area,
			             @RequestParam(value="c", defaultValue="1", required=false) String category,
                         Model model, @ModelAttribute("view") String view) {
		model.addAttribute("menu", "menu-03");
		model.addAttribute("submenu", "1");
		model.addAttribute("area", area);
		model.addAttribute("category", category);
		return "pl/sights";
	}
	
	@RequestMapping(value="/sights_view.do", method=RequestMethod.GET)
	public String sights_view(Model model, @ModelAttribute("view") int view) throws SQLException {
		DataVO data = dataService.getDataById(view);
		dataService.modifyDataHit(view);
		model.addAttribute("menu", "menu-03");
		model.addAttribute("submenu", "1");
		model.addAttribute("data", data);
		return "pl/sights_view";
	}
	
	@RequestMapping(value="/video.do", method=RequestMethod.GET)
	public String video(@RequestParam(value="a", defaultValue="대전", required=false) String area, 
			            @RequestParam(value="c", defaultValue="1", required=false) String category, 
			            Model model, @ModelAttribute("view") String view) {
		model.addAttribute("menu", "menu-03");
		model.addAttribute("submenu", "2");
		model.addAttribute("area", area);
		model.addAttribute("category", category);
		
		return "pl/video";
	}
	
	@ResponseBody
	@RequestMapping(value="/getDataListByCate.do", method=RequestMethod.POST) 
	public List<Map<String, Object>> getDataListByCate(String dataArea, int dataCate) throws SQLException {
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		if(dataCate == 0) {
			for(int i=1; i<=5; i++) {
				List<DataVO> dataList = dataService.getDataListBySearch(dataArea, i);
				dataMap = new HashMap<String, Object>();
				dataMap.put("cateName", DataUtil.getCateName(i));
				dataMap.put("dataList", dataList);
				mapList.add(dataMap);
			}
		} else {
			List<DataVO> dataList = dataService.getDataListBySearch(dataArea, dataCate);
			dataMap.put("cateName", DataUtil.getCateName(dataCate));
			dataMap.put("dataList", dataList);
			mapList.add(dataMap);
		}
		return mapList;
	}
	
	@ResponseBody
	@RequestMapping(value="modifyDataHit.do", method=RequestMethod.POST)
	public Map<String, Object> modifyDataHit(int dataNo) throws SQLException {
		Map<String, Object> data = new HashMap<String, Object>();
		dataService.modifyDataHit(dataNo);
		DataVO dataVO = dataService.getDataById(dataNo);
		data.put("obj", dataVO);
		return data;
	}
	
}
