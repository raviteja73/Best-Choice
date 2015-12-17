package com.uncc.struts.forms;

import org.apache.struts.action.ActionForm;

public class cartForm extends ActionForm {
	
	String productId=null;

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

}
