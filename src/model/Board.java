package model;

import java.util.*;

import bean.*;

public class Board extends ConnectionPool {

	/* 공지사항 관련 */

	/*------- -------- -------------- 
	NO      NOT NULL NUMBER         
	ID      NOT NULL VARCHAR2(500)  
	TITLE   NOT NULL VARCHAR2(1000) 
	CONTENT NOT NULL VARCHAR2(2000) 
	NBDATE  NOT NULL DATE           
	*/

	/* 공지사항 게시글 작성-BoardWriteProc.jsp */

	public void NoticeWrite(NoticeBoard bean) {

		getcon();

		try {

			String sql = "INSERT INTO NOTICEBOARD VALUES " + "(NB_SEQ.NEXTVAL,?,?,?,SYSDATE)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getTitle());
			pstmt.setString(3, bean.getContent());

			pstmt.executeUpdate();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/* 전체게시글- NoticeBoardList.jsp */

	public Vector<NoticeBoard> getAllNotice() {

		Vector<NoticeBoard> v = new Vector<>();

		getcon();

		try {

			String sql = "SELECT * FROM NOTICEBOARD ORDER BY NO DESC ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				NoticeBoard bean = new NoticeBoard();
				bean.setNo(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setTitle(rs.getString(3));
				bean.setContent(rs.getString(4));
				bean.setNbdate(rs.getString(5).toString());

				v.add(bean);

			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return v;

	}

	/* 키워드로 검색- NoticeBoardSearchListProc.jsp */

	public NoticeBoard Serch(String title) {
		NoticeBoard bean = new NoticeBoard();

		getcon();

		try {

			String sql = "SELECT * FROM NOTICEBOARD WHERE TITLE=? ";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, title);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				bean.setNo(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setTitle(rs.getString(3));
				bean.setContent(rs.getString(4));
				bean.setNbdate(rs.getString(5).toString());

			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;

	}

	/* 공지사항 게시물 상세페이지-Noticeinfo.jsp */

	public NoticeBoard getNoticeInfo(int no) {

		NoticeBoard bean = new NoticeBoard();

		getcon();

		try {

			String sql = "SELECT * FROM NOTICEBOARD WHERE NO=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setNo(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setTitle(rs.getString(3));
				bean.setContent(rs.getString(4));
				bean.setNbdate(rs.getString(5));

			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;

	}

}
