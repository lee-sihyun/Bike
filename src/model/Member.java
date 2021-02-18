package model;

import bean.*;

public class Member extends ConnectionPool {

	// 회원가입- 회원정보를 저장하는 메소드
	public void insertMember(MemberBean mbean) {
		try {
			/*
			 * 이름 널? 유형 ----- -------- ------------- ID NOT NULL VARCHAR2(500) PASS NOT NULL
			 * VARCHAR2(500) EMAIL NOT NULL VARCHAR2(500) TEL NOT NULL VARCHAR2(500) JOB NOT
			 * NULL VARCHAR2(500) AGE NOT NULL VARCHAR2(500) INFO VARCHAR2(500)
			 */
			getcon();
			String sql = "insert into member values(?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getJob());
			pstmt.setString(6, mbean.getAge());
			pstmt.setString(7, mbean.getInfo());

			pstmt.executeUpdate();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 로그인 검증 LoginProc.jsp
	public int getMemer(String id, String pass) {

		int result = 0;// count 함수를 이용하여 0이면 회원이 없도록 설정
		getcon();

		try {
			String sql = "SELECT COUNT(*) FROM MEMBER WHERE ID=? AND PASS=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pass);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				result = rs.getInt(1); // 0또는 1값이 저장
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	/* 아이디 중복 체크 -member/idCheckProc.jsp */

	public MemberBean search(String id) {
		MemberBean bean = new MemberBean();
		getcon();

		try {

			String sql = "SELECT * FROM MEMBER WHERE ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				bean.setId(rs.getString(1));
				bean.setPass(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setJob(rs.getString(5));
				bean.setAge(rs.getString(6));
				bean.setInfo(rs.getString(6));

			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

}
