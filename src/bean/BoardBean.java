package bean;
/*�̸�        ��?       ����             
--------- -------- -------------- 
NO        NOT NULL NUMBER         -�۹�ȣ
ID        NOT NULL VARCHAR2(500)  -�ۼ���
TITLE     NOT NULL VARCHAR2(500)  -����
CONTENT   NOT NULL VARCHAR2(2000) -����
COMENT             VARCHAR2(500)  -��� null
READCOUNT          NUMBER         -��ȸ�� null
DAY       NOT NULL DATE    -�ۼ���          */
public class BoardBean {
	
	int no;
	String id;
	String title;
	String content;
	String coment;

	int readcount;
	String day;
	
	
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
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	
	
	

}
