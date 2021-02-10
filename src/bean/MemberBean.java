package bean;

public class MemberBean {
/*
 * 이름    널?       유형            
----- -------- ------------- 
ID    NOT NULL VARCHAR2(500) 
PASS  NOT NULL VARCHAR2(500) 
EMAIL NOT NULL VARCHAR2(500) 
TEL   NOT NULL VARCHAR2(500) 
JOB   NOT NULL VARCHAR2(500) 
AGE   NOT NULL VARCHAR2(500) 
INFO           VARCHAR2(500) 
 
*/
	
	
	
	private String id;
	private String pass;
	private String email;
	private String tel;
	private String job;
	private String age;
	private String info;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}

	
	
}
