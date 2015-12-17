package com.uncc.struts.actions;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.uncc.struts.DAO.logisticDistributionDAO;
import com.uncc.struts.DAO.logisticDistributionDAOImpl;
import com.uncc.struts.forms.actionForm;
import com.uncc.struts.forms.paymentForm;

public class paymentAction extends DispatchAction {
	
	
	
	public ActionForward payment(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) 
					throws Exception 
					{

		HttpSession session=request.getSession();

		String returnPage = "orderSuccess";
		 int total=0;
   
    logisticDistributionDAO dao=new logisticDistributionDAOImpl();
    
    boolean flag=false;
		
    paymentForm hwForm=(paymentForm)form;
		
    try{
			if(session != null)
			{	

           
           Map<String,String> cartItems = (Map<String, String>) session.getAttribute("cartItems");
           
           String userId=(String)session.getAttribute("userId");
   		
           
           String shipingName=hwForm.getShipingName();
           
           String shipingAddress=hwForm.getShipingAddress();
           
           String shipingCity=hwForm.getShipingCity();
           
           String shipingState=hwForm.getShipingState();
           
           String shipingZipCode=hwForm.getShipingZipCode();
           
           String shipingContactNumber=hwForm.getShipingContactNumber();
           
         /*  ArrayList list = (ArrayList)session.getAttribute("cartDetails");
       	for(int i=0;i<list.size();i++){
       		
       		ArrayList productDetails = (ArrayList)list.get(i);
       		String productId = (String)productDetails.get(0);
       	}
			*/
           flag=dao.placeOrder(cartItems,userId,shipingName,shipingAddress,shipingCity,shipingState,shipingZipCode,shipingContactNumber);

           if(flag==true)
           {
        	   
        	   hwForm.setMessage("order placed successfully");
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
	
	
	
	
	
	

}
