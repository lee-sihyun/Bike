package model;

import bean.*;

public class Member  extends ConnectionPool{

	
	
	
	//회원가입- 회원정보를 저장하는 메소드
	public void insertMember(MemberBean mbean) {
		try {
			/*이름    널?       유형            
----- -------- ------------- 
ID    NOT NULL VARCHAR2(500) 
PASS  NOT NULL VARCHAR2(500) 
EMAIL NOT NULL VARCHAR2(500) 
TEL   NOT NULL VARCHAR2(500) 
JOB   NOT NULL VARCHAR2(500) 
AGE   NOT NULL VARCHAR2(500) 
INFO           VARCHAR2(500) 
 */
			getcon();
			String sql="insert into member values(?,?,?,?,?,?,?)";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getJob());
			pstmt.setString(6, mbean.getAge());
			pstmt.setString(7, mbean.getInfo());
	
		
			pstmt.executeUpdate();
			con.close();
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	
	
	
	
	
	
	
	
}
