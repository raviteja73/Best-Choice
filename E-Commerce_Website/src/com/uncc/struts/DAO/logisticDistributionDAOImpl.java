package com.uncc.struts.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import com.mysql.jdbc.Blob;
import com.mysql.jdbc.PreparedStatement;
import com.uncc.struts.common.util.DBConnection;
import com.uncc.struts.common.util.DataAccess;

public class logisticDistributionDAOImpl implements logisticDistributionDAO{
	
	String Query;
	
	public ArrayList loginCheck(String username, String password) throws Exception
	{
		
       System.out.println("username"+username);
       System.out.println("password"+password);
		
		ArrayList dataList=new ArrayList();
		
		Query=
				"SELECT * "
					
						+ "FROM   login "
						+ "WHERE  userId = '"+username+"' "
						+ "       AND password ='"+password+"'";
		
		

		dataList=DataAccess.pickData(Query);
		System.out.println("dataList"+dataList);
		
		return dataList;
		
		
		
		
	}
	
	public  ArrayList getOrdersList() throws Exception
	{
		
    ArrayList dataList=new ArrayList();
		
		Query=
				""
						+ "select orders.order_id , orders.user_id , order_details.product_id, products.product_name, "
						+ "order_details.quantity from "
						+ "orders  join order_details on "
						+ "orders.order_id=order_details.order_id "
						+ "join products on products.product_id=order_details.product_id "
						+ "order by orders.order_id";

		dataList=DataAccess.pickData(Query);
		System.out.println("dataList"+dataList);
		
		return dataList;
		
		
		
		
		
		
		
	}
	
	
	
	public Blob getProductImage(String productId) throws Exception
	{
		byte[] barr = null;
		Blob b=null;
		
		Query= "SELECT image from products where product_id= '"+productId+"' ";
		
		Connection lcon=null;
		 
		  Statement lstmt=null;
		   
		  ResultSet lrs=null;
		  
		  lcon = DBConnection.getDBConnection();
	      
		  PreparedStatement ps=(PreparedStatement) lcon.prepareStatement(Query);
		
		  lrs=ps.executeQuery();
		   
		  if(lrs.next())
		  {
			   b=(Blob) lrs.getBlob(1);
			  
			   
		  }
		
		
		return b;
		
		
	}
	
	public boolean placeOrder(Map cartItems, String userId,String shipingName, String shipingAddress, String shipingCity, String shipingState, String shipingZipCode, String shipingContactNumber) throws Exception

	{
		
		
		boolean flag=false;
		Connection lcon=null;
		 
		  Statement lstmt=null;
		   
		  ResultSet lrs=null;
		  int rowsInserted=0;
		  
		  int auto_id=0;
		  
		  int count=0;
		  
		  int count2=0;
		  
		  try{
		  lcon = DBConnection.getDBConnection();
		  
		  lstmt = lcon.createStatement(); 
		  
		 // stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
		  
		  Query="INSERT INTO ORDERS (USER_ID,shiping_address,shiping_city,shiping_state,shiping_name,shiping_zipcode,shiping_contact)"
		  		
				  + " VALUES ('"+userId+"','"+shipingAddress+"','"+shipingCity+"','"+shipingState+"','"+shipingName+"','"+shipingZipCode+"','"+shipingContactNumber+"')";
		  
		  
		  System.out.println("Query>>>>>"+Query);
		  
		 rowsInserted= lstmt.executeUpdate(Query , Statement.RETURN_GENERATED_KEYS);
		 
		 
		 if(rowsInserted>0) {
		      ResultSet rs = lstmt.getGeneratedKeys();
		      rs.next();
		      auto_id = rs.getInt(1);
		
		 
		 for(int i=0; i<cartItems.size();i++)
		 {
			 
			 Query="INSERT INTO ORDER_DETAILS (ORDER_ID,PRODUCT_ID,QUANTITY) VALUES ('"+auto_id+"','"+cartItems.keySet().toArray()[i]+"','"+cartItems.values().toArray()[i]+"')";
			  
			 System.out.println("Query>>>>>"+Query);
			 count=DataAccess.insertData(Query);
			 if(count>0)
			 {
				 Query="update products set quantity=quantity-'"+cartItems.values().toArray()[i]+"' where product_id='"+cartItems.keySet().toArray()[i]+"'"; 
				 
				count2= lstmt.executeUpdate(Query);
				 
			 }
			 
		 }
		 
		  }
		 if( count2>0)
		 {
			
			 flag=true;
		 }
		 
		  }
		  
		  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  
		  finally
		  {
			  try {
				lcon.close();
			
				lstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  }
		
		
		
		
		return flag;
		
		
		
	}
	
	public ArrayList getUserName(String userID) throws Exception
	{
		ArrayList dataList=new ArrayList();
		
		Query=
				"SELECT * "
					
						+ "FROM    userdetails "
						+ "WHERE  userId = '"+userID+"' ";
						
		
		

		dataList=DataAccess.pickData(Query);
		System.out.println("dataList"+dataList);
		
		return dataList;
		
		
	}
	
	
	public boolean createNewUser(ArrayList list) throws Exception
	{
		
		int count1=0;
		int count2=0;
		String firstName=(String)list.get(0);
		String lastName=(String)list.get(1);
		String userId=(String)list.get(2);
		String password=(String)list.get(3);
		String contactNumber=(String)list.get(4);
		ArrayList dataList=new ArrayList();
		
		String Query1;
		String Query2;
		String Query3;
		
		boolean flag=false;
			
		Query3=
				
				"SELECT * "
					
						+ "FROM   login "
						+ "WHERE  userId = '"+userId+"' ";
						
		

		dataList=DataAccess.pickData(Query3);
				System.out.println("dataList"+dataList);
		if(!(dataList.size()>0))
		{
			System.out.println("dataList"+dataList.size());
		
		Query1=
				 ""
							+ "INSERT INTO login "
							+ "VALUES     ('"+userId+"', "
							+ "            '"+password+"', "
							
							+ "           'U')";
		

		 Query2 = ""
				+ "INSERT INTO userdetails "
				+ "VALUES     ('"+userId+"', "
				+ "            '"+firstName+"', "
				+ "            '"+lastName+"', "
				
				+ "           '"+contactNumber+"')";
		
		 count1=DataAccess.insertData(Query1);
		
		if(count1>0)
		{
			count2=DataAccess.insertData(Query2);
			
		}
		if(count2>0)
		{
			flag=true;
		}
		}
		return flag;
		
		
		
	}
	
	public ArrayList getProductIdList() throws Exception
	{
		 
		ArrayList dataList=new ArrayList();
		
		Query = ""
				+ "select products.product_id, category.name "
				+ "from products,category "
				+ "where products.category_id=category.category_id";
				
		 dataList=DataAccess.pickData(Query);
			System.out.println("dataList"+dataList);
			
			return dataList;
		
	}
	
	public ArrayList getProductDetails(ArrayList product_id) throws Exception
	{
		
		ArrayList dataList=new ArrayList();
		StringBuffer productIds = new StringBuffer();
		for(int i=0;i<product_id.size();i++)
		{
			
			if(i!=0){
				productIds.append(",");	
			}
			productIds.append(product_id.get(i));
			
		}
		
		 Query=
					
					"SELECT product_id,product_name,description,category_id,price "
						
							+ "FROM   products "
							+ "WHERE  product_id in( "+productIds+" ) ";
							
	         dataList=DataAccess.pickData(Query);
				System.out.println("dataList"+dataList);
		
		return dataList;
		
		
	}
	
	public ArrayList getProductDetails(String productId) throws Exception
	{
		ArrayList dataList=new ArrayList();
		
         Query=
				
				"SELECT product_id,product_name,description,category_id,quantity,price "
					
						+ "FROM   products "
						+ "WHERE  product_id = '"+productId+"' ";
						
         dataList=DataAccess.pickData(Query);
			System.out.println("dataList"+dataList);
			
			return dataList;
		
	}

}
