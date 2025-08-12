<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "hostel.main.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hostel-Rector Admin Panel</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --primary-light: #4895ef;
            --secondary: #3f37c9;
            --dark: #1e1e24;
            --light: #f8f9fa;
            --gray: #adb5bd;
            --success: #4cc9f0;
            --danger: #f72585;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #f5f7fb;
            color: var(--dark);
            overflow-x: hidden;
        }

        .dashboard {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 280px;
            background: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 1.5rem 0;
            transition: all 0.3s ease;
            z-index: 100;
            position: fixed;
            height: 100vh;
            overflow-y: auto;
        }

        .sidebar-header {
            padding: 0 1.5rem 1.5rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        .sidebar-header h3 {
            color: var(--primary);
            font-size: 1.5rem;
            font-weight: 600;
        }

        .sidebar-menu {
            padding: 1rem 0;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 0.75rem 1.5rem;
            margin: 0.25rem 0;
            color: var(--dark);
            text-decoration: none;
            transition: all 0.2s ease;
            border-left: 3px solid transparent;
        }

        .menu-item:hover {
            background-color: rgba(67, 97, 238, 0.1);
            color: var(--primary);
            border-left: 3px solid var(--primary);
        }

        .menu-item.active {
            background-color: rgba(67, 97, 238, 0.1);
            color: var(--primary);
            border-left: 3px solid var(--primary);
            font-weight: 500;
        }

        .menu-item i {
            margin-right: 0.75rem;
            font-size: 1.1rem;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 2rem;
            background-color: #f5f7fb;
            margin-left: 280px;
            transition: margin-left 0.3s ease;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .header h2 {
            color: var(--dark);
            font-size: 1.75rem;
            margin-right: auto;
        }

        .user-profile {
            display: flex;
            align-items: center;
        }

        .user-profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 0.75rem;
            object-fit: cover;
        }

        .user-info h4 {
            font-size: 0.875rem;
            font-weight: 500;
            margin-bottom: 0.125rem;
        }

        .user-info p {
            font-size: 0.75rem;
            color: var(--gray);
        }

        /* Card Styles */
        .card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            padding: 1.5rem;
            margin-bottom: 2rem;
            width: 100%;
            overflow-x: auto;
        }

        .card-header {
            margin-bottom: 1.5rem;
        }

        .card-header h3 {
            font-size: 1.25rem;
            color: var(--dark);
        }

        /* Form Styles */
        .form-container {
            max-width: 800px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--dark);
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 6px;
            font-size: 0.875rem;
            transition: all 0.2s ease;
        }

        .form-control:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            border: none;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--secondary);
        }

        /* Search Box */
        .search-container {
            margin-bottom: 2rem;
        }

        .search-box {
            display: flex;
            max-width: 500px;
            width: 100%;
        }

        .search-box input {
            flex: 1;
            padding: 0.75rem 1rem;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 6px 0 0 6px;
            font-size: 0.875rem;
            outline: none;
            transition: all 0.2s ease;
        }

        .search-box input:focus {
            border-color: var(--primary);
        }

        .search-box button {
            padding: 0 1.25rem;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 0 6px 6px 0;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .search-box button:hover {
            background-color: var(--secondary);
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 3rem 0;
            color: var(--gray);
        }

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: var(--gray);
            opacity: 0.5;
        }

        /* Table Styles */
        .table-responsive {
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 600px;
        }

        th, td {
            padding: 0.75rem 1rem;
            text-align: left;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        th {
            font-weight: 500;
            color: var(--gray);
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        td {
            font-size: 0.875rem;
        }

        /* Mobile Menu Toggle */
        .menu-toggle {
            display: none;
            background: var(--primary);
            color: white;
            border: none;
            padding: 0.75rem;
            border-radius: 6px;
            cursor: pointer;
            margin-right: 1rem;
        }

        /* Responsive */
        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
                position: fixed;
                top: 0;
                left: 0;
                height: 100vh;
                z-index: 1000;
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
                padding-top: 5rem;
            }

            .menu-toggle {
                display: block;
            }

            .header {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                background: white;
                padding: 1rem;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                z-index: 100;
            }
        }

        @media (max-width: 576px) {
            .user-profile {
                display: none;
            }
            
            .search-box {
                max-width: 100%;
            }
            
            .card {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <h3>Hostel-Rector</h3>
            </div>
            
            <div class="sidebar-menu">
                <a href="student.jsp" class="menu-item active" data-section="students">
                    <i class="fas fa-users"></i>
                    <span>View All Students</span>
                </a>
                <a href="studentrecipt.jsp" class="menu-item" data-section="receipts">
                    <i class="fas fa-receipt"></i>
                    <span>View All Receipts</span>
                </a>
                <a href="search.html" class="menu-item" data-section="search">
                    <i class="fas fa-search"></i>
                    <span>Search Single Student</span>
                </a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="header">
                <button class="menu-toggle" id="menuToggle">
                    <i class="fas fa-bars"></i>
                </button>
                <h2>View All Students</h2>
                <div class="user-profile">
                    <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Admin">
                    <div class="user-info">
                        <h4>Admin Name</h4>
                        <p>Hostel Rector</p>
                    </div>
                </div>
            </div>
            
            <% try { Connection con = ConnectDB.dbCon();
            PreparedStatement ps = con.prepareStatement("SELECT  ha.ID, hfd.room_number,ha.student_name, ha.start_year,ha.phone_number,hfd.building_details,ha.father_phone FROM hostel_admissions ha JOIN hostel_fee_details hfd ON ha.ID = hfd.ID");
            ResultSet rs = ps.executeQuery();
            
             %>

            <!-- Students Section -->
            <div class="section-content" id="students-section">
                <form method="post" action="process_students.php" class="form-container">
                    <div class="card">
                        <div class="card-header">
                            <h3>Student Records</h3>
                        </div>

                        <div class="table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Room_NO</th>
                                        <th>Name</th>
                                        <th>Start year</th>
                                        <th>Std MONo</th>
                                        <th>Building details</th>
                                        <th>Parent NO</th>
                                        <th>Recipt</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                
                                <% 
                                
                                while(rs.next()){
                                	
                                	System.out.println("while starts here...");
                                	System.out.println(rs.getInt("ID"));
                                	System.out.println(rs.getInt("room_number"));
                                	System.out.println(rs.getString("student_name"));
                                	System.out.println(rs.getInt("start_year"));
                                	System.out.println(rs.getString("phone_number"));
                                	System.out.println(rs.getString("building_details"));
                                	System.out.println(rs.getString("father_phone"));

                                	
                                	
                          %>
                             <tr>
                            <td><%= rs.getInt("ID") %></td>
                            <td><%= rs.getInt("room_number") %></td>
                            <td><%= rs.getString("student_name") %></td>
                            <td><%= rs.getInt("start_year") %></td>
                            <td><%= rs.getString("phone_number") %></td>
                            <td><%= rs.getString("building_details") %></td>
                            <td><%= rs.getString("father_phone") %></td>
                            <td><a href="recipt.jsp?id=<%=rs.getInt("ID") %>">Click Here</a></td>
                                    <!-- Student data will be dynamically inserted here -->
                                    
                                    </tr>
                                    <%  }  %>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>

          
<%
            }catch(Exception e) {
	e.printStackTrace();
} %>
          

          

</body>
</html>