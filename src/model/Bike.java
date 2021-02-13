package model;

import java.util.*;

import bean.*;

public class Bike extends ConnectionPool {

	// 전체 따릉이 목록:BikeList.jsp

	public Vector<BikeBean> getAllBike() {

		Vector<BikeBean> v = new Vector<>();
		BikeBean bean = null;
		getcon();

		try {

			String sql = "SELECT * FROM BIKE ORDER BY NO DESC";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new BikeBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(5));
				bean.setInfo(rs.getString(6));

				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;

	}
	
//카테고리별 자동차 리스트 -BikeCategoryList.jsp
	public Vector<BikeBean> getCateBike(int category) {

		Vector<BikeBean> v = new Vector<>();
		BikeBean bean = null;

		getcon();

		try {

			String sql = "SELECT * FROM BIKE WHERE CATEGORY=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, category);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new BikeBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(5));
				bean.setInfo(rs.getString(6));

				v.add(bean);
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}


//상세페이지- Reinfo.jsp;
	public BikeBean getReinfo(int no) {

		BikeBean bean = new BikeBean();
		getcon();

		
		
		try {
			
			String sql="SELECT * FROM BIKE WHERE NO=?";
			pstmt=con.prepareStatement(sql);
		
			
			pstmt.setInt(1, no);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(5));
				bean.setInfo(rs.getString(6));

				
			}
			
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

}
