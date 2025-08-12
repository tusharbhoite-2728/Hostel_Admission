package hostel.main;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Form1servlet
 */
@WebServlet("/Form1servlet")
public class Form1servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Form1servlet() {
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
		
		
		
	
		String admission_fee = request.getParameter("admission_fee");
	    String admission_bank_details = request.getParameter("admission_bank_details");
	    String hostel_deposit = request.getParameter("hostel_deposit");
	    String deposit_bank_details = request.getParameter("deposit_bank_details");
	    String maintenance_fee = request.getParameter("maintenance_fee");
	    String maintenance_bank_details = request.getParameter("maintenance_bank_details");
	    String total_amount = request.getParameter("total_amount");
	    String room_number = request.getParameter("room_number");
	    String building_details = request.getParameter("building_details");
	    String remarks = request.getParameter("remarks");

	    Connection con = ConnectDB.dbCon();

	    try {
	        // Step 1: Get student ID from hostel_admissions
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT * FROM hostel_admissions WHERE email = (SELECT email FROM login WHERE id = ?)"
	        );
	        ps.setInt(1, GeterSeter.getID());

	        ResultSet rs = ps.executeQuery();

	        int id = -1;
	        if (rs.next()) {
	            id = rs.getInt("id");  // ✅ Moved after rs.next()
	        } else {
	            response.getWriter().println("No record found for the given user.");
	            return;
	        }

	        // Step 2: Insert fee details
	        PreparedStatement ps1 = con.prepareStatement("INSERT INTO hostel_fee_details VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
	        ps1.setInt(1, 0); // Assuming auto-increment
	        ps1.setInt(2, id);
	        ps1.setString(3, admission_fee);
	        ps1.setString(4, admission_bank_details);
	        ps1.setString(5, hostel_deposit);
	        ps1.setString(6, deposit_bank_details);
	        ps1.setString(7, maintenance_fee);
	        ps1.setString(8, maintenance_bank_details);
	        ps1.setString(9, total_amount);
	        ps1.setString(10, room_number);
	        ps1.setString(11, building_details);
	        ps1.setString(12, remarks);

	        int i = ps1.executeUpdate();
	        if (i > 0) {
	            response.sendRedirect("payment.html");
	        } else {
	            response.sendRedirect("form.html");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
	}

}
