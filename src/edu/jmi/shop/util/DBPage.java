package edu.jmi.shop.util;

public class DBPage {
   public int getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCurruentPage() {
		return curruentPage;
	}
	public void setCurruentPage(int curruentPage) {
		this.curruentPage = curruentPage;
	}
	public int getEveryCount() {
		return everyCount;
	}
	public void setEveryCount(int everyCount) {
		this.everyCount = everyCount;
	}
   private int recordCount;//��¼��
   private int pageCount;//ҳ����
   private int curruentPage;//��ǰҳ
   private int everyCount=20;//ÿҳ����
}
