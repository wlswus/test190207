package net.hb.bbs.reply;

public class ReplyDTO {

	private int br_no;
	private String br_id;
	private String br_content;
	private java.util.Date br_date;
	private int b_no;
	
	private int rrn;
	
	public int getRrn() { return rrn; }
	public void setRrn(int rrn) { this.rrn = rrn; }
	
	
	public int getBr_no() { return br_no; }
	public void setBr_no(int br_no) { this.br_no = br_no; }
	public String getBr_id() { return br_id; }
	public void setBr_id(String br_id) { this.br_id = br_id; }	
	public String getBr_content() { return br_content; }
	public void setBr_content(String br_content) { this.br_content = br_content; }	
	public java.util.Date getBr_date() { return br_date; }
	public void setBr_date(java.util.Date br_date) { this.br_date = br_date; }	
	public int getB_no() { return b_no; }
	public void setB_no(int b_no) { this.b_no = b_no; }
	
	
}
