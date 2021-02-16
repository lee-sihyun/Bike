package bean;

public class ComentBean {
/*이름     널?       유형             
------ -------- -------------- 
SEQ    NOT NULL NUMBER         
ID     NOT NULL VARCHAR2(500)  
COMENT NOT NULL VARCHAR2(2000) 
DDAY   NOT NULL DATE           
NO              NUMBER         */
	private int seq;
	private String id;
	private String coment;
	private String dday;
	private int no;
	/*글의 no*/
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public String getDday() {
		return dday;
	}
	public void setDday(String dday) {
		this.dday = dday;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	
	
}
