package hostel.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class payment
 */
@WebServlet("/payment")
public class payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public payment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		int ID = GeterSeter.getID();
		System.out.println(ID);
		String UTR_ID = request.getParameter("UTR_ID");
		String date = request.getParameter("date");
		
		try{
			Connection con = ConnectDB.dbCon();
			PreparedStatement ps = con.prepareStatement("INSERT INTO paymet VALUES(?, ?, ?, ?)");
			
			ps.setInt(1, 0);
			ps.setInt(2, ID);
			ps.setString(3, UTR_ID);
			ps.setString(4, date);
			
			int i = ps.executeUpdate();
			if(i>0) {
				response.sendRedirect("download.html");
			} else {
				response.sendRedirect("error.html");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
