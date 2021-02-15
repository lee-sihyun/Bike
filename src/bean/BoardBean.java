package bean;
/*이름        널?       유형             
--------- -------- -------------- 
NO        NOT NULL NUMBER         -글번호
ID        NOT NULL VARCHAR2(500)  -작성자
TITLE     NOT NULL VARCHAR2(500)  -제목
CONTENT   NOT NULL VARCHAR2(2000) -내용
COMENT             VARCHAR2(500)  -댓글 null
IMG                VARCHAR2(2000) -첨부파일 nul
READCOUNT          NUMBER         -조회수 null
DAY       NOT NULL DATE    -작성일          */
public class BoardBean {
	
	int no;
	String id;
	String title;
	String content;
	String coment;
	String img;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
