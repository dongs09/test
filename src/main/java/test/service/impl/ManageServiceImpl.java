package test.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.dao.face.ManageDao;
import test.dto.Account;
import test.dto.Custom;
import test.service.face.ManageService;
@Service
public class ManageServiceImpl implements ManageService {
	
	private static final Logger logger = LoggerFactory.getLogger(ManageServiceImpl.class);
	@Autowired ManageDao manageDao;
	
	@Override
	public void addCustom(Account account, Custom custom) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("account", account);
		
		manageDao.insertCustiom(account, custom);
		
	}

}
