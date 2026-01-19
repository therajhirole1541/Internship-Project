<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Success</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1b2735, #090a0f);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: rgba(255, 255, 255, 0.05);
            padding: 30px 50px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
            animation: fadeIn 1s ease-in-out;
        }
        .success-icon {
            font-size: 60px;
            color: #4CAF50;
            animation: pop 0.5s ease-in-out;
        }
        h2 {
            margin-top: 10px;
            font-size: 26px;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background: #4CAF50;
            color: #fff;
            border-radius: 25px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }
        a:hover {
            background: #45a049;
            transform: scale(1.05);
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes pop {
            0% { transform: scale(0.8); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-icon">✅</div>
        <h2>${message}</h2>
        <a href="userDashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>



















