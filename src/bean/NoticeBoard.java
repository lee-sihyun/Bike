package bean;

public class NoticeBoard {

	
	/*
	 * 이름      널?       유형             
------- -------- -------------- 
NO      NOT NULL NUMBER         
ID      NOT NULL VARCHAR2(500)  
TITLE   NOT NULL VARCHAR2(1000) 
CONTENT NOT NULL VARCHAR2(2000) 
NBDATE  NOT NULL DATE           
*/
	
	
	private int no;
	private String id;
	private String title;
	private String content;
	private String nbdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNbdate() {
		return nbdate;
	}
	public void setNbdate(String nbdate) {
		this.nbdate = nbdate;
	}
	
	
	
	
	
}
