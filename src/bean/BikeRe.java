package bean;


/*예약 테이블------- -------- ------------- 
이름      널?       유형            
------- -------- ------------- 
SEQ     NOT NULL NUMBER        -시퀀스
NO      NOT NULL NUMBER        
ID      NOT NULL VARCHAR2(500) 
DDAY    NOT NULL NUMBER        
RDAY    NOT NULL VARCHAR2(500) 
CHARGER NOT NULL NUMBER     */
public class BikeRe {

	
	private int no;
	private String id;
	private int dday;
	private String rady;
	private int charger;
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
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
	public String getRady() {
		return rady;
	}
	public void setRady(String rady) {
		this.rady = rady;
	}
	public int getCharger() {
		return charger;
	}
	public void setCharger(int charger) {
		this.charger = charger;
	}
	
	
	

	
	
	
	
}
