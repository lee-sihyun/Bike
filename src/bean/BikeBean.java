package bean;


/*
 * 
 * 자전거 테이블
 * 이름       널?       유형            
-------- -------- ------------- 
NO       NOT NULL NUMBER        - 시퀀스로 받을거 
NAME     NOT NULL VARCHAR2(500) 
CATEGORY NOT NULL NUMBER        
PRICE    NOT NULL NUMBER        
IMG      NOT NULL VARCHAR2(500) 
INFO     NOT NULL VARCHAR2(500) 
*/
public class BikeBean {

	private int no;
	private String name;
	private String category;
	private int price;
	private String img;
	private String info;
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	
	
	
}



