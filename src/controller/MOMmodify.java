package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import service.MemberService;


@WebServlet("/memberModify")
public class MOMmodify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MOMmodify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String momId     = request.getParameter("momId");
		String momPw     = request.getParameter("momPw");
		String momName   = request.getParameter("momName");
		String momBirth  = request.getParameter("momBirth");
		String momGender = request.getParameter("momGender");
		String momEmail  = request.getParameter("momEmail");
		String momPhone  = request.getParameter("momPhone");
		
		MemberDTO member = new MemberDTO();
		member.setMomId(momId);
		member.setMomPw(momPw);
		member.setMomName(momName);
		member.setMomBirth(momBirth);
		member.setMomGender(momGender);
		member.setMomEmail(momEmail);
		member.setMomPhone(momPhone);
		
		MemberService momSvc = new MemberService();
		int result = momSvc.memberModify(member);
		
		if(result>0) {
			response.sendRedirect("memberView?momId="+momId);
		} else {
			response.sendRedirect("memberView?momId="+momId);
		}
		
		
	}
}
