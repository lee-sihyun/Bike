package model;

import java.util.*;

import bean.*;

public class Coment extends ConnectionPool {

	/*
	 * �̸� ��? ���� ------ -------- -------------- SEQ NOT NULL NUMBER ID NOT NULL
	 * VARCHAR2(500) COMENT NOT NULL VARCHAR2(2000) DDAY NOT NULL DATE NO NUMBER
	 */
	/* ���̵�,�۹�ȣ�����޾ƿ��� ComentInsertProc.jsp */
	public void InsertComent(ComentBean bean) {

		getcon();

		try {

			String sql = "INSERT INTO COMENT VALUES(CM_SEQ.NEXTVAL,?,?,sysdate,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getComent());
			pstmt.setInt(3, bean.getNo());

			pstmt.executeQuery();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/* �ڸ�Ʈ ����Ʈ ��� - no�� �ش� �Խñ��� no�� ���� �Ǿ����� board/Fboard/Info.jsp */
	/**/

	/*
	 * public ComentBean getComentInfo(int no,int seq) { ComentBean bean = new
	 * ComentBean();
	 * 
	 * getcon();
	 * 
	 * try {
	 * 
	 * 
	 * 
	 * String sql="SELECT * FROM COMENT WHERE NO=? OR SEQ=?";
	 * 
	 * pstmt=con.prepareStatement(sql); pstmt.setInt(1, no); pstmt.setInt(2, seq);
	 * 
	 * 
	 * 
	 * rs=pstmt.executeQuery();
	 * 
	 * if(rs.next()) { bean.setSeq(rs.getInt(1)); bean.setId(rs.getString(2));
	 * bean.setComent(rs.getString(3));
	 * bean.setDday(rs.getString(4).toString());//�̰� string ������ �׽�Ʈ sdf��
	 * bean.setNo(rs.getInt(5));
	 * 
	 * 
	 * } con.close();
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return bean;
	 * 
	 * }
	 */

	public Vector<ComentBean> getComentInfo(int no) {
		Vector<ComentBean> v = new Vector<ComentBean>();

		getcon();

		try {

			String sql = "SELECT * FROM COMENT WHERE NO=? ORDER BY SEQ";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ComentBean bean = new ComentBean();
				bean.setSeq(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setComent(rs.getString(3));
				bean.setDday(rs.getString(4).toString());// �̰� string ������ �׽�Ʈ sdf��
				bean.setNo(rs.getInt(5));

				v.add(bean);

			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return v;
	}

	/*�ڸ�Ʈ����*/
	
	public void delComent(int seq ,int no) {

		getcon();

		try {

			String sql = "DELETE FROM COMENT WHERE SEQ=? AND NO=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.setInt(2, no);
		
			

			pstmt.executeUpdate();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	
	

	public void updateComent(ComentBean bean) {

		getcon();
		try {

			String sql = "UPDATE COMENT SET COMENT=?,DDAY=SYSDATE WHERE SEQ=? AND NO=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bean.getComent());
			pstmt.setInt(2, bean.getSeq());
			pstmt.setInt(3, bean.getNo());

			pstmt.executeUpdate();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
