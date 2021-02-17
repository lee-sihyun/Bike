package model;

import java.util.*;

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
					+ "(BIKERE_SEQ.NEXTVAL,?,?,?,?,'예약완료')";
			pstmt=con.prepareStatement(sql);
			

			pstmt.setString(1, bean.getId());
			pstmt.setInt(2, bean.getDday());
			pstmt.setString(3, bean.getRday());
			pstmt.setInt(4, bean.getCharger());

		
			
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
	
	/*페이징처리를위한-reserve/ReList.jsp*/
	
	public int getReAllCount() {

		getcon();

		int count = 0;

		try {

			String sql = "SELECT COUNT(*) FROM BIKERE";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);

			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;

	}
	
	
	/*전체게시글 반환*/
	
	public Vector<BikeRe> getAllRe(int startRow, int endRow) {

		Vector<BikeRe> v = new Vector<>();

		getcon();

		try {

			String sql = 
					
					
					 "select * from "
								+ "(select A.* ,Rownum Rnum from "
								+ "(select *from BIKERE order by no desc)A)"
								+ "where Rnum >= ? and Rnum <= ?";
							
					
			
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			
			rs = pstmt.executeQuery();	
			
			while (rs.next()) {

				BikeRe bean = new BikeRe();
				bean.setNo(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setDday(rs.getInt(3));
				bean.setRday(rs.getString(4));
				bean.setCharger(rs.getInt(5));
				bean.setProc(rs.getString(6));

				v.add(bean);
				
			

			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return v;
	}
	
	
	/*자전거 반납-ReList.jsp*/
	
	
	
	public void upDateProc(BikeRe bean) {
		getcon();
		
		
		try {
			
			String sql="UPDATE BIKERE SET PROC='반납완료' WHERE NO=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, bean.getNo());
			pstmt.executeUpdate();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
}
