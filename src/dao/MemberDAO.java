package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MemberDTO;

public class MemberDAO {

	private static MemberDAO dao;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public static MemberDAO getInstance() {
		if(dao==null) {
			dao = new MemberDAO();
		}
		return dao;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	
	public MemberDTO memberLogin2(String momId, String momPw) {
		MemberDTO loginId2 = null;
		String sql = "SELECT MOMSUB, FLOOR(MOMSUB-SYSDATE) FROM MOMEMBER WHERE MOMID=? AND MOMPW=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, momId);
			pstmt.setString(2, momPw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginId2 = new MemberDTO();
				loginId2.setMomSub(rs.getString(1));
				loginId2.setMomSubD(rs.getInt(2));
				/*
				 * loginId2.setMomSub(momSub); = rs.getString(9); loginId2 = rs.getString(10);
				 */
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("loginId2DAO :" + loginId2 );
		
		return loginId2;
	}
	
	

	public int momSub(MemberDTO member) {
		int result = 0;
			
			System.out.println("memberDTO : " + member);
		
		String sql = "UPDATE MOMEMBER SET MOMMONEY=MOMMONEY-?, MOMSUB=(SYSDATE+TO_NUMBER(?)) WHERE MOMID=?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, member.getMomMoney());
			pstmt.setString(2, member.getMomSub());
			pstmt.setString(3, member.getMomId());
			System.out.println("getmomSub : " + member.getMomSub());
			System.out.println("getmomId : " + member.getMomId());
			
			
			result = pstmt.executeUpdate();
			
			System.out.println("result : " + result);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}
	
	
	
	// ???????????? ????????? ???
	public int memberJoin(MemberDTO member) {
		int result = 0;
		
		String sql="INSERT INTO MOMEMBER VALUES(?,?,?,?,?,?,?,DEFAULT,DEFAULT)";
		 
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMomId());
			pstmt.setString(2, member.getMomPw());
			pstmt.setString(3, member.getMomName());
			pstmt.setString(4, member.getMomBirth());
			pstmt.setString(5, member.getMomGender());
			pstmt.setString(6, member.getMomEmail());
			pstmt.setString(7, member.getMomPhone());
			
			result = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	// ????????? ???????????? ????????? ???
	public String idCheck(String momId) {
		String checkId = null;
		String sql = "SELECT MOMID FROM MOMEMBER WHERE MOMID=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, momId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				checkId = rs.getString(1);
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		} 
		return checkId;
	}
	
	// ????????? ????????? ????????? ???
	public String memberLogin(String momId, String momPw) {
		String loginId = null;
		
		String sql="SELECT MOMID FROM MOMEMBER WHERE MOMID=? AND MOMPW=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, momId);
			pstmt.setString(2, momPw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				loginId = rs.getString(1);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return loginId;
	}
	// ?????? ???????????? ????????? ????????? ???
	public int momListCount() {
		int momListCount = 0;
		String sql = "SELECT COUNT(*) FROM MOMEMBER";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				momListCount = rs.getInt(1);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return momListCount;
	}

	public ArrayList<MemberDTO> memberList(int startRow, int endRow) {
		ArrayList<MemberDTO> momList = new ArrayList<MemberDTO>();
		MemberDTO member = null;
		
		String sql = "SELECT MOMID,MOMNAME,TO_CHAR(MOMBIRTH,'YYYY-MM-DD') FROM MOMLIST WHERE RN BETWEEN ? AND ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			System.out.println("member : " + member);
			while(rs.next()) {
				member = new MemberDTO();
				member.setMomId(rs.getString(1));
				member.setMomName(rs.getString(2));
				member.setMomBirth(rs.getString(3));
				
				System.out.println("member : " + member);
				
				momList.add(member);
				
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return momList;
	}
	// ???????????? ???????????? ???
	public MemberDTO memberView(String momId) {
		MemberDTO member = null;
		String sql = "SELECT MOMID, MOMPW, MOMNAME, TO_CHAR(MOMBIRTH,'YYYY-MM-DD'), MOMGENDER, MOMEMAIL, MOMPHONE, MOMMONEY,TO_CHAR(MOMSUB,'YYYY-MM-DD'),  CEIL(MOMSUB-SYSDATE) FROM MOMEMBER WHERE MOMID=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, momId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				member = new MemberDTO();
				member.setMomId(rs.getString(1));
				member.setMomPw(rs.getString(2));
				member.setMomName(rs.getString(3));
				member.setMomBirth(rs.getString(4));
				member.setMomGender(rs.getString(5));
				member.setMomEmail(rs.getString(6));
				member.setMomPhone(rs.getString(7));
				member.setMomMoney(rs.getInt(8));
				member.setMomSub(rs.getString(9));
				member.setMomSubD(rs.getInt(10));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("memberDAO : " + member);
		return member;
	}
	// ?????? ?????? ?????? ????????? ???
	public int memberModify(MemberDTO member) {
		int result = 0;
		String sql="UPDATE MOMEMBER SET MOMPW=?, MOMNAME=?, MOMBIRTH=?, "
				 + "MOMGENDER=?, MOMEMAIL=?, MOMPHONE=? WHERE MOMID=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMomPw());
			pstmt.setString(2, member.getMomName());
			pstmt.setString(3, member.getMomBirth());
			pstmt.setString(4, member.getMomGender());
			pstmt.setString(5, member.getMomEmail());
			pstmt.setString(6, member.getMomPhone());
			pstmt.setString(7, member.getMomId());
			result = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	// ?????? ?????? ????????? ???
	public int memberDelete(String momId) {
		int result = 0;
		String sql="DELETE FROM MOMEMBER WHERE MOMID=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, momId);
			System.out.println("momId : " + momId);
			result = pstmt.executeUpdate();
			System.out.println("result : " + result);
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	// ?????? ?????? ?????? ????????? ???
	public int memberCharge(MemberDTO member) {
		int result = 0;
		System.out.println("memberDAO : " + member);
		System.out.println("memberDAO result : " + result);
		String sql="UPDATE MOMEMBER SET MOMMONEY=? WHERE MOMID=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member.getMomMoney());
			pstmt.setString(2, member.getMomId());
			result = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int memberMoney(MemberDTO member) {
		int result = 0;
		String sql="UPDATE MOMEMBER SET MOMMONEY=MOMMONEY+? WHERE MOMID=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member.getMomMoney());
			pstmt.setString(2, member.getMomId());
			
			
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		
		
		return result;
	}

	public MemberDTO checkMoney(String momId) {
		
		MemberDTO member = null;
		String sql = "SELECT MOMMONEY FROM MOMEMBER WHERE MOMID=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, momId);
			System.out.println("momId : " + momId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberDTO();
				member.setMomMoney(rs.getInt(1));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return member;
	}

	


	
	
	
}
