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

public class cartAction extends DispatchAction {


	public ActionForward removeFromCart(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) 
					throws Exception 
					{

		HttpSession session=request.getSession();

		String returnPage = "viewCart";
		int total=0;
		ArrayList list=new ArrayList();

		logisticDistributionDAO dao=new logisticDistributionDAOImpl();
		actionForm hwForm=(actionForm)form;
		try{
			if(session != null)
			{	

				String productId=hwForm.getProductId();
				ArrayList product_id=new ArrayList();
				System.out.println("productID"+productId);
				Map<String,String> cartItems = (Map<String, String>) session.getAttribute("cartItems");
				cartItems.remove(productId);
				System.out.println("cartItems"+cartItems);
				session.setAttribute("cartItems",cartItems);

				for(String quan : cartItems.values()){

					total = Integer.parseInt(quan) + total;
				}
				System.out.println("total quantity add to cart"+total);
				session.setAttribute("total",total);


				java.util.Iterator entries = cartItems.entrySet().iterator();
				while (entries.hasNext()) {
					Map.Entry entry = (Map.Entry) entries.next();
					String key = (String)entry.getKey();
					product_id.add(key);
					System.out.println("product_id"+product_id);

					String value = (String)entry.getValue();
					System.out.println("Key = " + key + ", Value = " + value);
				}
				
				if(!product_id.isEmpty()){
					list=dao.getProductDetails(product_id);
				}				
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








}
