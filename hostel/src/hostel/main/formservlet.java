package hostel.main;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/formservlet")
public class formservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public formservlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data safely
    	
    	
    	
    	
    	
        int start_year = Integer.parseInt(request.getParameter("start_year"));
        int end_year = Integer.parseInt(request.getParameter("end_year"));
        String name = request.getParameter("student_name");
        String gender = request.getParameter("gender");
        String nationality = request.getParameter("nationality");
        String dob = request.getParameter("date_of_birth");
        String blood_gr = request.getParameter("blood_group");
        String religion = request.getParameter("religion");
        String caste = request.getParameter("caste");

        // Handling NULL values for integer fields
        int height = (request.getParameter("height_cm") != null && !request.getParameter("height_cm").isEmpty()) 
            ? Integer.parseInt(request.getParameter("height_cm")) : 0;
        int weight = (request.getParameter("weight_kg") != null && !request.getParameter("weight_kg").isEmpty()) 
            ? Integer.parseInt(request.getParameter("weight_kg")) : 0;

        String handicap = request.getParameter("physically_handicapped");
        String defence = request.getParameter("defence_service_personnel");
        String address = request.getParameter("permanent_address");
        String city = request.getParameter("city");
        String pin = request.getParameter("pin_code");
        String taluka = request.getParameter("taluka");
        String district = request.getParameter("district");
        String state = request.getParameter("state");
        String number = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String college = request.getParameter("college_name");
        String branch = request.getParameter("class_branch");
        String father_name = request.getParameter("father_name");
        String mother_name = request.getParameter("mother_name");
        String local_relative_name = request.getParameter("local_relative_name");
        String father_occupation = request.getParameter("father_occupation");
        String mother_occupation = request.getParameter("mother_occupation");
        String local_relative_occupation = request.getParameter("local_relative_occupation");
        String father_office_address = request.getParameter("father_office_address");
        String mother_office_address = request.getParameter("mother_office_address");
        String local_relative_address = request.getParameter("local_relative_address");
        String father_city_pincode = request.getParameter("father_city_pincode");
        String mother_city_pincode = request.getParameter("mother_city_pincode");
        String city_pincode = request.getParameter("local_relative_city_pincode");
        String father_phone = request.getParameter("father_phone");
        String mother_phone = request.getParameter("mother_phone");
        String relative_phone = request.getParameter("local_relative_phone");

        try (Connection con = ConnectDB.dbCon();
             PreparedStatement ps = con.prepareStatement(
                 "INSERT INTO hostel_admissions ("+
                 "start_year, end_year, student_name, gender, nationality, date_of_birth, " +
                 "blood_group, religion, caste, height_cm, weight_kg, physically_handicapped, " +
                 "defence_service_personnel, permanent_address, city, pin_code, taluka, " +
                 "district, state, phone_number, email, college_name, class_branch, father_name, " +
                 "mother_name, local_relative_name, father_occupation, mother_occupation, " +
                 "local_relative_occupation, father_office_address, mother_office_address, " +
                 "local_relative_address, father_city_pincode, mother_city_pincode, " +
                 "local_relative_city_pincode, father_phone, mother_phone, local_relative_phone) " +
                 "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)")) {

            ps.setInt(1, start_year);
            ps.setInt(2, end_year);
            ps.setString(3, name);
            ps.setString(4, gender);
            ps.setString(5, nationality);

            // Convert dob to SQL Date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.sql.Date sqlDob = new java.sql.Date(sdf.parse(dob).getTime());
            ps.setDate(6, sqlDob);

            ps.setString(7, blood_gr);
            ps.setString(8, religion);
            ps.setString(9, caste);
            ps.setInt(10, height);
            ps.setInt(11, weight);
            ps.setString(12, handicap);
            ps.setString(13, defence);
            ps.setString(14, address);
            ps.setString(15, city);
            ps.setString(16, pin);
            ps.setString(17, taluka);
            ps.setString(18, district);
            ps.setString(19, state);
            ps.setString(20, number);
            ps.setString(21, email);
            ps.setString(22, college);
            ps.setString(23, branch);
            ps.setString(24, father_name);
            ps.setString(25, mother_name);
            ps.setString(26, local_relative_name);
            ps.setString(27, father_occupation);
            ps.setString(28, mother_occupation);
            ps.setString(29, local_relative_occupation);
            ps.setString(30, father_office_address);
            ps.setString(31, mother_office_address);
            ps.setString(32, local_relative_address);
            ps.setString(33, father_city_pincode);
            ps.setString(34, mother_city_pincode);
            ps.setString(35, city_pincode);
            ps.setString(36, father_phone);
            ps.setString(37, mother_phone);
            ps.setString(38, relative_phone);
            
            
            
           

            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("form1.html");
            } else {
                response.sendRedirect("form.html");
            }

        } catch (Exception e) {
            e.printStackTrace();
          
        }
    }
}
