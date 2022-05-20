/**
 * 
 */
package com.hrm.bean;

/**
 * @author Naveena Konduru
 *
 */
public class RequestBean {

	private String textArea;
	private String senderMail;
	private String recieverMail;
	private String reasonName;
	private String reasonId;
	private String status;
	private String managerReason;
	private String reAssignMailId;
	/**
	 * @return the textArea
	 */
	public String getTextArea() {
		return textArea;
	}
	/**
	 * @param textArea the textArea to set
	 */
	public void setTextArea(String textArea) {
		this.textArea = textArea;
	}
	/**
	 * @return the senderMail
	 */
	public String getSenderMail() {
		return senderMail;
	}
	/**
	 * @param senderMail the senderMail to set
	 */
	public void setSenderMail(String senderMail) {
		this.senderMail = senderMail;
	}
	/**
	 * @return the recieverMail
	 */
	public String getRecieverMail() {
		return recieverMail;
	}
	/**
	 * @param recieverMail the recieverMail to set
	 */
	public void setRecieverMail(String recieverMail) {
		this.recieverMail = recieverMail;
	}
	/**
	 * @return the reasonName
	 */
	public String getReasonName() {
		return reasonName;
	}
	/**
	 * @param reasonName the reasonName to set
	 */
	public void setReasonName(String reasonName) {
		this.reasonName = reasonName;
	}
	/**
	 * @return the reasonId
	 */
	public String getReasonId() {
		return reasonId;
	}
	/**
	 * @param reasonId the reasonId to set
	 */
	public void setReasonId(String reasonId) {
		this.reasonId = reasonId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getManagerReason() {
		return managerReason;
	}
	public void setManagerReason(String managerReason) {
		this.managerReason = managerReason;
	}
	public String getReAssignMailId() {
		return reAssignMailId;
	}
	public void setReAssignMailId(String reAssignMailId) {
		this.reAssignMailId = reAssignMailId;
	}
	
	
}
