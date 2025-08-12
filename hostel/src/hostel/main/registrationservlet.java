package hostel.main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class registrationservlet
 */
@WebServlet("/registrationservlet")
public class registrationservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registrationservlet() {
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
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirm_pass = request.getParameter("confirm-password");
		
		try{
			
			Connection con = ConnectDB.dbCon();
			PreparedStatement ps = con.prepareStatement("insert into login values(?,?,?)");
			ps.setInt(1, 0);
			ps.setString(2, email);
			ps.setString(3, password);
			
			int i = ps.executeUpdate();
			if(i>0) {
				response.sendRedirect("login.html");
			} else {
				response.sendRedirect("error.html");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
