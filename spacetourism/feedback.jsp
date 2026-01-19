<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submit Feedback - Space Tourism Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef1f5;
            padding: 40px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            border-radius: 10px;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        textarea {
            width: 100%;
            height: 150px;
            padding: 10px;
            font-size: 15px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type=submit] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 6px;
        }
        input[type=submit]:hover {
            background-color: #0056b3;
        }
        .back {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Submit Your Feedback</h2>
    <form action="SubmitFeedbackServlet" method="post">
        <textarea name="message" placeholder="Write your feedback here..." required></textarea>
        <input type="submit" value="Submit Feedback">
    </form>
    <div class="back">
        <a href="userDashboard.jsp">← Back to Dashboard</a>
    </div>
</div>

</body>
</html>