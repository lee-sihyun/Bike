package model;

import java.sql.*;
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
/*
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

	}*/
	
	public Vector<NoticeBoard> getAllNotice(int startRow, int endRow) {

		Vector<NoticeBoard> v = new Vector<>();

		getcon();

		try {

			String sql = 
					
					
					 "select * from "
								+ "(select A.* ,Rownum Rnum from "
								+ "(select *from noticeboard order by no desc)A)"
								+ "where Rnum >= ? and Rnum <= ?";
							
					
			
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			
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

			String sql = "SELECT * FROM NOTICEBOARD WHERE TITLE = ? ";
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

	/* 공지사항 삭제-Del.jsp */

	public void delNoticeBoard(int no) {

		getcon();

		try {

			String sql = "DELETE FROM NOTICEBOARD WHERE NO=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);

			pstmt.executeUpdate();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/* 공지사항 수정 -UpdateProc.jsp */

	public void updateNoticeBoard(NoticeBoard bean) {

		getcon();
		try {

			String sql = "UPDATE NOTICEBOARD SET TITLE=?,CONTENT=?,NBDATE=sysdate WHERE NO=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNo());

			pstmt.executeUpdate();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int getNoticeAllCount() {

		getcon();

		int count = 0;

		try {

			String sql = "SELECT COUNT(*) FROM NOTICEBOARD";
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
	

	/*********************************************************************/

	/*
	 * 이름 널? 유형 --------- -------- -------------- 
	 * NO NOT NULL NUMBER -글번호
	 *  ID NOT
	 * NULL VARCHAR2(500) -작성자 TITLE NOT NULL VARCHAR2(500) -제목 CONTENT NOT NULL
	 * VARCHAR2(2000) -내용 COMENT VARCHAR2(500) -댓글 null IMG VARCHAR2(2000) -첨부파일 nul
	 * READCOUNT NUMBER -조회수 null DAY NOT NULL DATE -작성일
	 */

	/* 자유게시판 리스트-board/fboard/List.jsp 전체글의 개수 리턴 */

	public int getAllCount() {

		getcon();

		int count = 0;

		try {

			String sql = "SELECT COUNT(*) FROM BOARD";
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

	/* 게시글 작성 */

	public void insertBoard(BoardBean bean) {

		getcon();
//조회수는 초기값으로 0을부여
		try {
			String sql="INSERT INTO BOARD VALUES (BOARD_SEQ.NEXTVAL,?,?,?,?,0,SYSDATE)";
			pstmt=con.prepareStatement(sql);
			
		pstmt.setString(1,bean.getId() );
		pstmt.setString(2, bean.getTitle());
		pstmt.setString(3,bean.getContent());
		pstmt.setString(4,bean.getComent());

		
		pstmt.executeUpdate();
		con.close();
			

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	
	public Vector<BoardBean> getAllBoard(int startRow, int endRow) {

		Vector<BoardBean> v = new Vector<>();

		getcon();

		try {

			String sql = 
			 "select * from "
				+ "(select A.* ,Rownum Rnum from "
				+ "(select *from board order by no desc)A)"
				+ "where Rnum >= ? and Rnum <= ?";
			
			
			
		
			
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			
			rs = pstmt.executeQuery();	
			
			
		

			while (rs.next()) {

				BoardBean bean = new BoardBean();
				bean.setNo(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setTitle(rs.getString(3));
				bean.setContent(rs.getString(4));
				bean.setComent(rs.getString(5));
				bean.setReadcount(rs.getInt(6));
				bean.setDay(rs.getString(7).toString());
		
				v.add(bean);

			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return v;

	}
	
	
	/*보드 상세정보-lnfo.jsp*/
	public BoardBean getBoardInfo(int no) {

		BoardBean bean = new BoardBean();

		getcon();

		try {
			/*조회수 증가*/

				String readcountup="UPDATE BOARD SET READCOUNT=READCOUNT+1 WHERE NO=?";
				pstmt=con.prepareStatement(readcountup);
				pstmt.setInt(1, no);
				pstmt.executeUpdate();
			
			

			String sql = "SELECT * FROM BOARD WHERE NO=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setNo(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setTitle(rs.getString(3));
				bean.setContent(rs.getString(4));
				bean.setComent(rs.getString(5));

				bean.setReadcount(rs.getInt(6));
				bean.setDay(rs.getString(7).toString());
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;

	}
	

	
	/*자유게시판 게시물 삭제- board/Fboard/Del.jsp*/
	public void delBoard(int no) {

		getcon();

		try {

			String sql = "DELETE FROM BOARD WHERE NO=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);

			pstmt.executeUpdate();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	
	
	/*자유게시판  게시물 수정  board/Fboard/UpdateProc.jsp*/
	
	
	public void updateBoard(BoardBean bean) {

		getcon();
		try {

			String sql = "UPDATE BOARD SET TITLE=?,CONTENT=?,DAY=sysdate WHERE NO=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNo());

			pstmt.executeUpdate();
			con.close(); 	

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
