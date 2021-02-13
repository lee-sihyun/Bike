package model;

import bean.*;

public class Reserve extends ConnectionPool {
/*/*예약 테이블------- -------- ------------- 
이름      널?       유형            
------- -------- ------------- 
SEQ     NOT NULL NUMBER        -시퀀스
NO      NOT NULL NUMBER        
ID      NOT NULL VARCHAR2(500) 
DDAY    NOT NULL NUMBER        
RDAY    NOT NULL VARCHAR2(500) 
CHARGER NOT NULL NUMBER     */
	
	
	
	/*예약 정보 저장*/
	public void setReBike(BikeRe bean) {
		
		getcon();

		try {
			
			
			String sql="INSERT INTO BIKERE VALUES"
					+ "(BIKERE_SEQ.NEXTVAL,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, bean.getNo());
			pstmt.setString(2, bean.getId());
			pstmt.setInt(3, bean.getDday());
			pstmt.setString(4, bean.getRday());
			pstmt.setInt(5, bean.getCharger());

		
			
		pstmt.executeUpdate();
			con.close();
			
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

	
	}
	
	
	/*자전거 정보 */
	
	public BikeBean getBikeInfo(int no) {
		
		BikeBean bean = new BikeBean();
		
		getcon();
		
		try {
			
			String sql="SELECT * FROM BIKE WHERE NO=?";
			pstmt=con.prepareStatement(sql);
			
			
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			
			/*자전거 테이블
 * 이름       널?       유형            
-------- -------- ------------- 
NO       NOT NULL NUMBER        - 시퀀스로 받을거 
NAME     NOT NULL VARCHAR2(500) 
CATEGORY NOT NULL NUMBER        
PRICE    NOT NULL NUMBER        
IMG      NOT NULL VARCHAR2(500) 
INFO     NOT NULL VARCHAR2(500)*/
			
			
			if(rs.next()) {
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(5));
				bean.setInfo(rs.getString(6));
				
				
			}
		con.close();	
	
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	
	
}
