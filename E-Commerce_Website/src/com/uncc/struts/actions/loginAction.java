package com.uncc.struts.actions;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.Iterator;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.mysql.jdbc.Blob;
import com.uncc.struts.DAO.logisticDistributionDAO;
import com.uncc.struts.DAO.logisticDistributionDAOImpl;
import com.uncc.struts.forms.actionForm;



public class loginAction extends DispatchAction {

	public ActionForward loginHome(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) 
					throws Exception 
					{

		boolean reqStatus = request.isRequestedSessionIdValid();

		if(reqStatus==true){

			HttpSession session=request.getSession(true);

			actionForm hwForm=( actionForm)form;

			logisticDistributionDAO dao=new logisticDistributionDAOImpl();

			boolean flag=false;

			ArrayList innerList=new ArrayList();

			ArrayList list=new ArrayList();

			ArrayList userDataList=new ArrayList();

			// ArrayList dataBaseNamesList=new ArrayList();

			ArrayList dataList=new ArrayList();

			String loginID=hwForm.getLoginID();

			String password=hwForm.getPassword();

			list=dao.loginCheck(loginID, password);

			System.out.println("list"+list);

			ArrayList productIdList=new ArrayList();
            
			if(session.getAttribute("loginID")!=null && session.getAttribute("password")!=null )
			{
				//flag=true;
				System.out.println("hellloooo");
				
				list=dao.loginCheck((String)session.getAttribute("loginID"),(String)session.getAttribute("password"));

				
			}

			if(list.size()>0)
			{
				if(loginID!=null && !loginID.equals("") && password!=null && !password.equals("")){
				session.setAttribute("loginID", loginID);
				
				session.setAttribute("password", password);
				}
				
				userDataList=(ArrayList) list.get(0);

				flag=true;

				String userID=(String) userDataList.get(0);
				
				String userType=(String)userDataList.get(2);
				

				dataList=dao.getUserName(userID);

				String firstName=(String)((ArrayList)dataList.get(0)).get(1);

				String lastName=(String)((ArrayList)dataList.get(0)).get(2);

				String userName=firstName+"\t"+lastName;

				session.setAttribute("userName",userName);
				
				session.setAttribute("userId",userID);

            if(userType.equals("A"))
            {
            	
            	ArrayList orders=new ArrayList();
            	
            	orders=dao.getOrdersList();
            	
            	System.out.println("orders"+orders);
            	
            	request.setAttribute("orders",orders);
            	
            	return mapping.findForward("admin");	
            	
            }


			}

			//System.out.println("userName"+userName);
			//System.out.println("password"+password);


			if(flag==false)
			{

				hwForm.setErrorMessage("Invalid Username/Password");

				return mapping.findForward("login");

			}
			else
			{
				ArrayList booksList=new ArrayList();
				ArrayList laptopsList=new ArrayList();
				ArrayList violinList=new ArrayList();

				productIdList=dao.getProductIdList();
				for(int i=0;i<productIdList.size();i++)
				{

					innerList=(ArrayList)productIdList.get(i);
					if(((String)innerList.get(1)).equals("Books"))
					{

						booksList.add((String)innerList.get(0));
					}
					if(((String)innerList.get(1)).equals("Laptops"))
					{

						laptopsList.add((String)innerList.get(0));
					}
					if(((String)innerList.get(1)).equals("Violins"))
					{

						violinList.add((String)innerList.get(0));
					}


				}
				System.out.println("productIdList"+productIdList);
				System.out.println("booksList"+booksList);
				System.out.println("laptopsList"+laptopsList);
				System.out.println("violinList"+violinList);

				request.setAttribute("booksList", booksList);
				request.setAttribute("laptopsList", laptopsList);
				request.setAttribute("violinList", violinList);

				return mapping.findForward("shoppingCartHome");

			}

		}else
		{
			return mapping.findForward("errorPage");	
		}



					}


	public ActionForward signUp(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) 
					throws Exception 
					{

		HttpSession session=request.getSession();

		String returnPage = "signUp";

		//actionForm hwForm=(actionForm)form;
		try{
			if(session != null)
			{	




			}
			else
			{
				returnPage="errorPage";
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			//hwForm.setErrorMessage(e.getMessage());
		}
		return mapping.findForward(returnPage);


					}

	/*public ActionForward buyProduct(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) 
					throws Exception{
		String returnPage = "buyNow";
		response.setContentType("image/jpeg");  
		ServletOutputStream out;  
		out = response.getOutputStream();
		File file = new File("C:\\Users\\Vaishnavi\\workspace\\SSDI\\WebContent\\images\\harrypotter.jpg");

		System.out.println("image exist ? "+file.exists());
		FileInputStream fin = new FileInputStream("C:\\Users\\Vaishnavi\\workspace\\SSDI\\WebContent\\images\\harrypotter.jpg");  

		BufferedInputStream bin = new BufferedInputStream(fin);  
		BufferedOutputStream bout = new BufferedOutputStream(out);  
		int ch =0; ;  
		while((ch=bin.read())!=-1)  
		{  
			bout.write(ch);  
		}  

		bin.close();  
		fin.close();  
		bout.close();  
		out.close();
		return mapping.findForward(returnPage);
	}*/

	public ActionForward buyProduct(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) 
					throws Exception 
					{

		HttpSession session=request.getSession();

		String returnPage = "buyNow";

		System.out.println("productDetails");
		ArrayList productDetails=new ArrayList();

		logisticDistributionDAO dao=new logisticDistributionDAOImpl();

		actionForm hwForm=(actionForm)form;
		try{
			if(session != null)
			{	

				String productId=hwForm.getProductId();

				System.out.println("productId"+productId);

				productDetails=dao.getProductDetails(productId);

				System.out.println("productDetails"+productDetails);

				request.setAttribute("productDetails",productDetails.get(0));

				/*
				Blob productImage=dao.getProductImage(productId);

				InputStream photoStream = productImage.getBinaryStream();

				response.setContentType("image/jpeg");  
				ServletOutputStream out;  
				out = response.getOutputStream();  
				//FileInputStream fin = new FileInputStream(" C:\\Users\\Vaishnavi\\workspace\\SSDI\\WebContent\\images\\harrypotter.jpg ");  

				BufferedInputStream bin = new BufferedInputStream(photoStream);  
				BufferedOutputStream bout = new BufferedOutputStream(out);  
				int ch =0; ;  
				while((ch=bin.read())!=-1)  
				{  
					bout.write(ch);  
				}  

				bin.close();  
				photoStream.close();  
				bout.close();  
				out.close();  

*/

			}
			else
			{
				returnPage="errorPage";
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			//hwForm.setErrorMessage(e.getMessage());
		}
		return mapping.findForward(returnPage);

  //return null;
					}

	
	public ActionForward displayImage(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) 
					throws Exception 
					{

		HttpSession session=request.getSession();

		//String returnPage = "buyNow";

		System.out.println("productDetails");
		ArrayList productDetails=new ArrayList();

		logisticDistributionDAO dao=new logisticDistributionDAOImpl();

		actionForm hwForm=(actionForm)form;
		try{
			if(session != null)
			{	

				String productId=hwForm.getProductId();

				System.out.println("productId"+productId);

				productDetails=dao.getProductDetails(productId);

				System.out.println("productDetails"+productDetails);

				request.setAttribute("productDetails",productDetails.get(0));

				Blob productImage=dao.getProductImage(productId);

				InputStream photoStream = productImage.getBinaryStream();

				response.setContentType("image/jpeg");  
				ServletOutputStream out;  
				out = response.getOutputStream();  
				//FileInputStream fin = new FileInputStream(" C:\\Users\\Vaishnavi\\workspace\\SSDI\\WebContent\\images\\harrypotter.jpg ");  

				BufferedInputStream bin = new BufferedInputStream(photoStream);  
				BufferedOutputStream bout = new BufferedOutputStream(out);  
				int ch =0; ;  
				while((ch=bin.read())!=-1)  
				{  
					bout.write(ch);  
				}  

				bin.close();  
				photoStream.close();  
				bout.close();  
				out.close();  



			}
			else
			{
				//returnPage="errorPage";
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			//hwForm.setErrorMessage(e.getMessage());
		}
		//return mapping.findForward(returnPage);

return null;
					}

	
	
	public ActionForward addToCart(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) 
					throws Exception 
					{

		HttpSession session=request.getSession();

		String returnPage = "purchase";
        int total=0;
		Map<String,String> cartItems = null;
		actionForm hwForm=(actionForm)form;
		
		try{
			if(session.getAttribute("userName") != null)
			{	

				String productId=hwForm.getProductId();
				String quantity=hwForm.getQuantity();


                
				System.out.println("productId add to cart"+productId);
				
				cartItems = (Map<String, String>) session.getAttribute("cartItems");
				if(cartItems == null){
					cartItems = new HashMap<String,String>();
				}
				cartItems.put(productId,quantity);
				session.setAttribute("cartItems",cartItems);
				
				
				/*if(session.getAttribute("total") != null){
					total = (Integer) session.getAttribute("total");
				}*/
				
				for(String quan : cartItems.values()){
				
					total = Integer.parseInt(quan) + total;
				}
				System.out.println("total quantity add to cart"+total);
				session.setAttribute("total",total);


			}
			else
			{
				returnPage="errorPage";
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			//hwForm.setErrorMessage(e.getMessage());
		}
		return mapping.findForward(returnPage);


					}
	public ActionForward viewCartItems(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) 
					throws Exception 
					{

		HttpSession session=request.getSession();

		String returnPage = "viewCart";
        
		ArrayList product_id=new ArrayList();
		
		//ArrayList quantity=new ArrayList();
		
		Map cartItems=new HashMap<String,String>();
		
		logisticDistributionDAO dao=new logisticDistributionDAOImpl();
		
		ArrayList list=new ArrayList();

		try{
			if(session.getAttribute("userName") != null)
			{	

				cartItems=(HashMap) session.getAttribute("cartItems");
				System.out.println("cartItems"+cartItems);
				java.util.Iterator entries = cartItems.entrySet().iterator();
				while (entries.hasNext()) {
				    Map.Entry entry = (Map.Entry) entries.next();
				    String key = (String)entry.getKey();
				    product_id.add(key);
				    System.out.println("product_id"+product_id);
				    
				    String value = (String)entry.getValue();
				    System.out.println("Key = " + key + ", Value = " + value);
				    }
				list=dao.getProductDetails(product_id);
				session.setAttribute("cartDetails", list);
			}
			else
			{
				returnPage="errorPage";
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			//hwForm.setErrorMessage(e.getMessage());
		}
		return mapping.findForward(returnPage);


					}






	public ActionForward login(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) 
					throws Exception 
					{

		HttpSession session=request.getSession();

		String returnPage = "login";

		//actionForm hwForm=(actionForm)form;
		try{
			if(session != null)
			{	




			}
			else
			{
				returnPage="errorPage";
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			//hwForm.setErrorMessage(e.getMessage());
		}
		return mapping.findForward(returnPage);


					}


	public ActionForward submitUserDetails(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) 
					throws Exception 
					{

		HttpSession session=request.getSession();

		String returnPage = "signUp";
		Boolean flag=false;
		actionForm hwForm=(actionForm)form;
		ArrayList list =new ArrayList();
		try{
			if(session != null)
			{	

				String firstName=hwForm.getFirstName();
				String lastName=hwForm.getLastName();
				String userId=hwForm.getEmailId();
				String password=hwForm.getPassword();
				String contactNumber=hwForm.getContactNumber();

				list.add(firstName);
				list.add(lastName);
				list.add(userId);
				list.add(password);
				list.add(contactNumber);

				logisticDistributionDAO dao=new logisticDistributionDAOImpl();

				flag=dao.createNewUser(list);
				if(flag==false)
				{
					hwForm.setErrorMessage("username already exist");
				}else
				{
					hwForm.setErrorMessage("you have created your account successfully! Please login with your credentials");
				}


			}
			else
			{
				returnPage="errorPage";
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			//hwForm.setErrorMessage(e.getMessage());
		}
		return mapping.findForward(returnPage);


					}


	public ActionForward logoutUser(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) 
	        throws Exception 
       {
		  
		  HttpSession session=request.getSession();
		  
		  session.removeAttribute("userName"); 						
			
		  //session.removeAttribute("userID"); 		
		  
		  session.removeAttribute("cartItems");
			
		  session.invalidate();
			
		  System.out.println("loggin out");
	      return mapping.findForward("login");
		  
		  
		  
		  
		
		
       }






}
