package com.uncc.struts.forms;

import org.apache.struts.action.ActionForm;

public class paymentForm extends ActionForm {
	
	String shipingName=null;
	
	String shipingAddress=null;
	
    String shipingCity=null;
	
	String shipingState=null;
	
	String shipingZipCode=null;
	
	String shipingContactNumber=null;
	
	String message=null;
	
	String mode=null;
	
	String cardNumber=null;
	
	String expiryMM=null;
	
	String expiryYY=null;
	
	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getExpiryMM() {
		return expiryMM;
	}

	public void setExpiryMM(String expiryMM) {
		this.expiryMM = expiryMM;
	}

	public String getExpiryYY() {
		return expiryYY;
	}

	public void setExpiryYY(String expiryYY) {
		this.expiryYY = expiryYY;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	String cvv=null;
	
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	
	
	public String getShipingName() {
		return shipingName;
	}

	public void setShipingName(String shipingName) {
		this.shipingName = shipingName;
	}

	public String getShipingAddress() {
		return shipingAddress;
	}

	public void setShipingAddress(String shipingAddress) {
		this.shipingAddress = shipingAddress;
	}

	public String getShipingCity() {
		return shipingCity;
	}

	public void setShipingCity(String shipingCity) {
		this.shipingCity = shipingCity;
	}

	public String getShipingState() {
		return shipingState;
	}

	public void setShipingState(String shipingState) {
		this.shipingState = shipingState;
	}

	public String getShipingZipCode() {
		return shipingZipCode;
	}

	public void setShipingZipCode(String shipingZipCode) {
		this.shipingZipCode = shipingZipCode;
	}

	public String getShipingContactNumber() {
		return shipingContactNumber;
	}

	public void setShipingContactNumber(String shipingContactNumber) {
		this.shipingContactNumber = shipingContactNumber;
	}

	
	

	

}
