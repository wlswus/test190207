package net.hb.bbs;

import org.springframework.web.multipart.MultipartFile;

public class bbsDTO {
	
	private int b_no;
	private String b_id;
	private String b_name;
	private String b_title;
	private String b_content;
	private java.util.Date b_date;
	private String b_file_name;
	private MultipartFile upload_f;
	
	private int rn,start,end;
	private String skey,sval;
	
	
	public int getRn() { return rn; }
	public void setRn(int rn) { this.rn = rn; }
	public int getStart() { return start; }
	public void setStart(int start) { this.start = start; }
	public int getEnd() { return end; }
	public void setEnd(int end) { this.end = end; }
	public String getSkey() { return skey; }
	public void setSkey(String skey) { this.skey = skey; }
	public String getSval() { return sval; }
	public void setSval(String sval) { this.sval = sval; }
	
	public int getB_no() { return b_no; }
	public void setB_no(int b_no) { this.b_no = b_no; }
	
	public String getB_id() { return b_id; }
	public void setB_id(String b_id) { this.b_id = b_id; }

	public String getB_name() { return b_name; }
	public void setB_name(String b_name) { this.b_name = b_name; }
	
	public String getB_title() { return b_title; }
	public void setB_title(String b_title) { this.b_title = b_title; }

	public String getB_content() { return b_content; }
	public void setB_content(String b_content) { this.b_content = b_content; }

	public java.util.Date getB_date() { return b_date; }
	public void setB_date(java.util.Date b_date) { this.b_date = b_date; }
	
	public String getB_file_name() { return b_file_name; }
	public void setB_file_name(String b_file_name) { this.b_file_name = b_file_name; }
	
	public MultipartFile getUpload_f() { return upload_f; }
	public void setUpload_f(MultipartFile upload_f) { this.upload_f = upload_f; }
	
	
}
