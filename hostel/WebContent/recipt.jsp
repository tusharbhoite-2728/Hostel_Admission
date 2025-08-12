<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="hostel.main.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hostel Fee Receipt</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Times New Roman', serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            margin: 0;
        }
        .receipt-container {
            width: 100%;
            max-width: 650px;
            background: #fff;
            border: 1px solid #ccc;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.1);
            padding: 40px;
            position: relative;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 2px solid #333;
            padding-bottom: 15px;
        }
        .header h2 {
            margin: 0;
            font-weight: bold;
            font-size: 24px;
            color: #003366;
        }
        .header p {
            margin: 5px 0 0;
            font-size: 16px;
        }
        .receipt-title {
            text-align: center;
            font-weight: bold;
            font-size: 20px;
            margin: 25px 0;
            text-decoration: underline;
            color: #003366;
        }
        .details-table, .amount-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }
        .details-table td {
            padding: 8px 5px;
            border-bottom: 1px solid #ddd;
        }
        .details-table td:first-child {
            font-weight: bold;
            width: 40%;
        }
        .amount-table th, .amount-table td {
            padding: 8px 5px;
            border-bottom: 1px solid #ddd;
        }
        .amount-table th {
            background-color: #f1f1f1;
            font-weight: bold;
        }
        .amount-table td:last-child {
            text-align: right;
            font-weight: bold;
        }
        .total-amount {
            font-weight: bold;
            font-size: 18px;
            text-align: center;
            margin: 25px 0;
            padding: 12px;
            border-top: 2px dashed #000;
            border-bottom: 2px dashed #000;
        }
        .payment-details, .notes {
            font-size: 14px;
            margin-top: 15px;
        }
        .seal {
            position: absolute;
            right: 40px;
            bottom: 40px;
            width: 120px;
            height: 120px;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 120"><circle cx="60" cy="60" r="55" fill="none" stroke="%230056b3" stroke-width="2"/><circle cx="60" cy="60" r="45" fill="none" stroke="%230056b3" stroke-width="1"/><text x="60" y="50" text-anchor="middle" font-family="Arial" font-size="10" fill="%230056b3">OFFICIAL SEAL</text><text x="60" y="65" text-anchor="middle" font-family="Arial" font-size="10" fill="%230056b3">SHIRPUR EDUCATION</text><text x="60" y="80" text-anchor="middle" font-family="Arial" font-size="10" fill="%230056b3">SOCIETY</text><text x="60" y="95" text-anchor="middle" font-family="Arial" font-size="8" fill="%230056b3">BOYS HOSTEL</text></svg>');
            background-size: contain;
            background-repeat: no-repeat;
            opacity: 0.8;
        }
        @media print {
            body {
                background-color: white;
            }
            .receipt-container {
                box-shadow: none;
                border: none;
                padding: 0;
            }
            .seal {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<%
    try {
        Connection con = ConnectDB.dbCon();

        int studentId = Integer.parseInt(request.getParameter("id")); // Get from URL param

        PreparedStatement ps = con.prepareStatement("SELECT * FROM hostel_admissions WHERE id = ?");
        ps.setInt(1, studentId);
        ResultSet rs = ps.executeQuery();

        PreparedStatement ps1 = con.prepareStatement("SELECT * FROM paymet WHERE user_id = ?");
        ps1.setInt(1, studentId);
        ResultSet rs1 = ps1.executeQuery();

        PreparedStatement ps2 = con.prepareStatement("SELECT * FROM hostel_fee_details WHERE id = ?");
        ps2.setInt(1, studentId);
        ResultSet rs2 = ps2.executeQuery();

        if (rs.next() && rs1.next() && rs2.next()) {
            int admissionFee = rs2.getInt("admission_fee");
            int hostelDeposit = rs2.getInt("hostel_deposit");
            int maintenanceFee = rs2.getInt("maintenance_fee");
            int total = admissionFee + hostelDeposit + maintenanceFee;
            String amountInWords = NumberToWords.convert(total);
%>
<div class="receipt-container">
    <div class="header">
        <h2>SHIRPUR EDUCATION SOCIETY</h2>
        <h2>BOYS HOSTEL</h2>
        <p>NIMZARI NAKA SHIRPUR MAHARASHTRA 425405</p>
    </div>

    <div class="receipt-title">HOSTEL FEE</div>

    <table class="details-table">
        <tr><td>College Name</td><td>R.C.PATEL INST OF TECH</td></tr>
        <tr><td>Receipt No.</td><td>TYdncwer</td></tr>
        <tr><td>Student ID</td><td><%= rs.getInt("ID") %></td></tr>
        <tr><td>Name</td><td><%= rs.getString("student_name") %></td></tr>
        <tr><td>Date</td><td><%= rs1.getString("date") %></td></tr>
        <tr><td>Branch</td><td><%= rs.getString("class_branch") %></td></tr>
    </table>

    <div class="receipt-title">Received the following ( Rs. ) AMOUNT</div>

    <table class="amount-table">
        <tr><th>Particulars</th><th>Amount</th></tr>
        <tr><td>Admission Fee</td><td><%= admissionFee %></td></tr>
        <tr><td>Hostel Deposit</td><td><%= hostelDeposit %></td></tr>
        <tr><td>Maintenance Fee</td><td><%= maintenanceFee %></td></tr>
    </table>

    <div class="total-amount">
        Total: Rs. <%= total %> /- <br>
        In Words: <%= amountInWords %> Only
    </div>

    <div class="payment-details">
        <p>Payment subject to realisation.</p>
        <p>Payment drawn on STATE BANK OF INDIA, Chq.No. : 487651, Date : 15/11/2022</p>
    </div>

    <div class="notes">
        <p><strong>Note:</strong></p>
        <p>Hostel deposit will not be refundable without original Deposit Receipt.</p>
        <p>Hostel deposit will not be refundable till the completion of the Course.</p>
    </div>

    <div class="seal"></div>
</div>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
