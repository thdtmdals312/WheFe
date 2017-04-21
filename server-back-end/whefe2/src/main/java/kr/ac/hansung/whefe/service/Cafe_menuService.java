package kr.ac.hansung.whefe.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.whefe.dao.Cafe_menuDao;
import kr.ac.hansung.whefe.model.Cafe_menu;

@Service
public class Cafe_menuService {
	
	@Autowired
	private Cafe_menuDao cafe_menuDao;
	
	public List<Cafe_menu> getCafe_menu(String category_name) {
		return cafe_menuDao.getCafe_menu(category_name);
	}
	
	public boolean addMenu(String[] param) {
		return cafe_menuDao.addMenu(param);
	}
	
	public boolean addMenu(ArrayList<String> pkArray, ArrayList<String> menu_nameArray, ArrayList<String> menu_sizeArray, ArrayList<String> hot_ice_noneArray, ArrayList<String> menu_priceArray) {
		return cafe_menuDao.addMenu(pkArray, menu_nameArray, menu_sizeArray, hot_ice_noneArray, menu_priceArray);
	}
}
