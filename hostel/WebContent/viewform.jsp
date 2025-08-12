<%@ page import="java.sql.*" %>
<%@ page import="hostel.main.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Hostel Admission - Full Details</title>

  <!-- Bootstrap & FontAwesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    /* Same full styling */
    :root {
      --primary-color: #0d6efd;
      --secondary-color: #6c757d;
      --accent-color: #28a745;
      --light-bg: #f8f9fa;
      --dark-text: #343a40;
      --sidebar-bg: #003366;
      --sidebar-hover: #004080;
      --header-bg: #0056b3;
    }
    body {
      background-color: var(--light-bg);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      color: var(--dark-text);
      line-height: 1.6;
    }
    .form-container {
      background-color: #ffffff;
      padding: 2.5rem;
      border-radius: 15px;
      box-shadow: 0 6px 30px rgba(0, 0, 0, 0.08);
      max-width: 1100px;
      margin: 2rem auto;
      border: 1px solid rgba(0, 0, 0, 0.05);
    }
    h1, h2 {
      text-align: center;
      color: var(--header-bg);
    }
    h3 {
      color: var(--primary-color);
      font-weight: 600;
      margin: 1.5rem 0 1rem;
      font-size: 1.4rem;
      padding-bottom: 0.5rem;
      border-bottom: 2px solid #eee;
    }
    label {
      font-weight: 600;
      color: var(--secondary-color);
      margin-bottom: 0.5rem;
      display: block;
    }
    .form-control, .form-select, textarea {
      padding: 0.75rem 1rem;
      border-radius: 8px;
      border: 1px solid #ced4da;
      transition: all 0.3s ease;
      box-shadow: none;
    }
    .form-control:focus, .form-select:focus, textarea:focus {
      border-color: var(--primary-color);
      box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.15);
    }
    .btn-back {
      background-color: var(--primary-color);
      color: white;
      margin-top: 20px;
      padding: 10px 25px;
      border-radius: 8px;
      text-decoration: none;
      display: inline-block;
    }
    .btn-back:hover {
      background-color: var(--sidebar-hover);
      color: white;
    }
    table th {
      background-color: var(--primary-color);
      color: white;
      text-align: center;
    }
    table td {
      vertical-align: middle;
    }
    .table-responsive {
      border-radius: 10px;
      overflow: hidden;
      margin-bottom: 1.5rem;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    }
    textarea {
      resize: none;
    }
  </style>
</head>

<body>

<div class="form-container">
  <h1>SES BOY'S HOSTEL</h1>
  <h2>Admission Form Data</h2>

<%
		
  try {
	int id = Integer.parseInt(request.getParameter("id"));
    Connection con = ConnectDB.dbCon();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM hostel_admissions WHERE id=?");
    ps.setInt(1,id);
    ResultSet rs = ps.executeQuery();
    

    if(rs.next()) {
%>

<div class="row g-3">
  <div class="col-md-6">
    <label>Start Year:</label>
    <p class="form-control"><%= rs.getInt("start_year") %></p>
  </div>
  <div class="col-md-6">
    <label>End Year:</label>
    <p class="form-control"><%= rs.getInt("end_year") %></p>
  </div>
  <div class="col-12">
    <label>Student Name:</label>
    <p class="form-control"><%= rs.getString("student_name") %></p>
  </div>
  <div class="col-md-6">
    <label>Gender:</label>
    <p class="form-control"><%= rs.getString("gender") %></p>
  </div>
  <div class="col-md-6">
    <label>Nationality:</label>
    <p class="form-control"><%= rs.getString("nationality") %></p>
  </div>
  <div class="col-md-6">
    <label>Date of Birth:</label>
    <p class="form-control"><%= rs.getDate("date_of_birth") %></p>
  </div>
  <div class="col-md-6">
    <label>Blood Group:</label>
    <p class="form-control"><%= rs.getString("blood_group") %></p>
  </div>
  <div class="col-md-6">
    <label>Religion:</label>
    <p class="form-control"><%= rs.getString("religion") %></p>
  </div>
  <div class="col-md-6">
    <label>Caste:</label>
    <p class="form-control"><%= rs.getString("caste") %></p>
  </div>
  <div class="col-md-6">
    <label>Height (cm):</label>
    <p class="form-control"><%= rs.getInt("height_cm") %></p>
  </div>
  <div class="col-md-6">
    <label>Weight (kg):</label>
    <p class="form-control"><%= rs.getInt("weight_kg") %></p>
  </div>
  <div class="col-md-6">
    <label>Physically Handicapped:</label>
    <p class="form-control"><%= rs.getString("physically_handicapped") %></p>
  </div>
  <div class="col-md-6">
    <label>Defence Service Personnel:</label>
    <p class="form-control"><%= rs.getString("defence_service_personnel") %></p>
  </div>
  <div class="col-12">
    <label>Permanent Address:</label>
    <p class="form-control"><%= rs.getString("permanent_address") %></p>
  </div>
  <div class="col-md-6">
    <label>City:</label>
    <p class="form-control"><%= rs.getString("city") %></p>
  </div>
  <div class="col-md-6">
    <label>Pin Code:</label>
    <p class="form-control"><%= rs.getString("pin_code") %></p>
  </div>
  <div class="col-md-6">
    <label>Taluka:</label>
    <p class="form-control"><%= rs.getString("taluka") %></p>
  </div>
  <div class="col-md-6">
    <label>District:</label>
    <p class="form-control"><%= rs.getString("district") %></p>
  </div>
  <div class="col-md-6">
    <label>State:</label>
    <p class="form-control"><%= rs.getString("state") %></p>
  </div>
  <div class="col-md-6">
    <label>Phone Number:</label>
    <p class="form-control"><%= rs.getString("phone_number") %></p>
  </div>
  <div class="col-md-6">
    <label>Email:</label>
    <p class="form-control"><%= rs.getString("email") %></p>
  </div>
  <div class="col-md-6">
    <label>College Name:</label>
    <p class="form-control"><%= rs.getString("college_name") %></p>
  </div>
  <div class="col-md-6">
    <label>Class/Branch:</label>
    <p class="form-control"><%= rs.getString("class_branch") %></p>
  </div>
</div>

<hr>

<h3>Parents / Guardian Details</h3>
<div class="table-responsive">
  <table class="table table-bordered">
    <thead>
      <tr>
        <th></th>
        <th>Father</th>
        <th>Mother</th>
        <th>Local Relative</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><strong>Name</strong></td>
        <td><%= rs.getString("father_name") %></td>
        <td><%= rs.getString("mother_name") %></td>
        <td><%= rs.getString("local_relative_name") %></td>
      </tr>
      <tr>
        <td><strong>Occupation</strong></td>
        <td><%= rs.getString("father_occupation") %></td>
        <td><%= rs.getString("mother_occupation") %></td>
        <td><%= rs.getString("local_relative_occupation") %></td>
      </tr>
      <tr>
        <td><strong>Office Address</strong></td>
        <td><%= rs.getString("father_office_address") %></td>
        <td><%= rs.getString("mother_office_address") %></td>
        <td><%= rs.getString("local_relative_address") %></td>
      </tr>
      <tr>
        <td><strong>City & PinCode</strong></td>
        <td><%= rs.getString("father_city_pincode") %></td>
        <td><%= rs.getString("mother_city_pincode") %></td>
        <td><%= rs.getString("local_relative_city_pincode") %></td>
      </tr>
      <tr>
        <td><strong>Phone No.</strong></td>
        <td><%= rs.getString("father_phone") %></td>
        <td><%= rs.getString("mother_phone") %></td>
        <td><%= rs.getString("local_relative_phone") %></td>
      </tr>
    </tbody>
  </table>
</div>

<%
    }
    rs.close();
    ps.close();
  } catch (Exception e) {
%>
  <p class="alert alert-danger">Error fetching student details: <%= e.getMessage() %></p>
<%
  }
%>



<%
    try {
    	int id = Integer.parseInt(request.getParameter("id"));

      Connection con2 = ConnectDB.dbCon();
      PreparedStatement ps2 = con2.prepareStatement("SELECT * FROM hostel_fee_details WHERE id=?");
      ps2.setInt(1,id);
      ResultSet rs2 = ps2.executeQuery();

      if (rs2.next()) {
%>

<div class="form-container">
  <h2>Hostel Fee Payment Details</h2>

  <div class="table-responsive mb-4">
    <table class="table table-bordered text-center">
      <thead>
        <tr>
          <th>Particulars</th>
          <th>Amount (₹)</th>
          <th>Bank Details</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Admission Fee</td>
          <td><%= rs2.getString("admission_fee") %></td>
          <td><%= rs2.getString("admission_bank_details") %></td>
        </tr>
        <tr>
          <td>Hostel Deposit</td>
          <td><%= rs2.getString("hostel_deposit") %></td>
          <td><%= rs2.getString("deposit_bank_details") %></td>
        </tr>
        <tr>
          <td>Maintenance Fee</td>
          <td><%= rs2.getString("maintenance_fee") %></td>
          <td><%= rs2.getString("maintenance_bank_details") %></td>
        </tr>
        <tr class="table-active">
          <td><strong>Total Amount</strong></td>
          <td colspan="2"><strong>₹<%= rs2.getString("total_amount") %></strong></td>
        </tr>
      </tbody>
    </table>
  </div>

  <div class="row g-3">
    <div class="col-md-6">
      <label>Room Number:</label>
      <p class="form-control"><%= rs2.getString("room_number") %></p>
    </div>
    <div class="col-md-6">
      <label>Building Name:</label>
      <p class="form-control"><%= rs2.getString("building_details") %></p>
    </div>
  </div>

  <div class="mb-3">
    <label>Remarks:</label>
    <textarea class="form-control" readonly><%= rs2.getString("remarks") %></textarea>
  </div>

</div> <!-- second form-container -->

<%
      }
      rs2.close();
      ps2.close();
    } catch (Exception e2) {
%>
  <p class="alert alert-danger">Error fetching fee details: <%= e2.getMessage() %></p>
<%
    }
%>

<hr>

<!-- Back Button -->
<a href="listStudents.jsp" class="btn-back"><i class="fas fa-arrow-left"></i> Back to List</a>

<hr>

</div> <!-- Main outer form-container -->


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
