package test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.service.face.ManageService;

@Controller
public class ManageController {
	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	@Autowired ManageService manageService;
	
	@RequestMapping(value="/manage/custom", method=RequestMethod.GET)
	public void custom() {
		logger.info("good");
		
		
	}
	@RequestMapping(value="/manage/customAdd", method=RequestMethod.POST)
	public String add() {
		
		return "redirect:/manage/custom";
	}
	
	
}//class end
