package com.uncc.struts.DAO;

import java.util.ArrayList;
import java.util.Map;

import com.mysql.jdbc.Blob;

public interface logisticDistributionDAO {
	
	public ArrayList loginCheck(String username, String password) throws Exception;
	
	public boolean createNewUser(ArrayList list) throws Exception;

	public ArrayList getUserName(String userID) throws Exception;

	public ArrayList getProductIdList() throws Exception;

	public ArrayList getProductDetails(String productId) throws Exception;

	public Blob getProductImage(String productId) throws Exception;

	public ArrayList getProductDetails(ArrayList product_id) throws Exception;

	public boolean placeOrder(Map cartItems,String userId, String shipingName, String shipingAddress, String shipingCity, String shipingState, String shipingZipCode, String shipingContactNumber) throws Exception;

	public ArrayList getOrdersList() throws Exception;

}
