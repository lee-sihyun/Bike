package model;

import bean.*;

public class Member extends ConnectionPool {

	// ȸ������- ȸ�������� �����ϴ� �޼ҵ�
	public void insertMember(MemberBean mbean) {
		try {
			/*
			 * �̸� ��? ���� ----- -------- ------------- ID NOT NULL VARCHAR2(500) PASS NOT NULL
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

	//�α��� ���� LoginProc.jsp 
	public int getMemer(String id, String pass) {

		int result = 0;//count �Լ��� �̿��Ͽ� 0�̸� ȸ���� ������ ����
		getcon();

		try {
			String sql = "SELECT COUNT(*) FROM MEMBER WHERE ID=? AND PASS=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pass);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				result = rs.getInt(1); //0�Ǵ� 1���� ����
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

}
