<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    String userName = (String) session.getAttribute("userName");
    if (userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard - Space Tourism</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: radial-gradient(circle at top, #0a0a23, #000010);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: white;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        /* Floating stars background effect */
        body::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            background: transparent url('https://www.transparenttextures.com/patterns/stardust.png') repeat;
            animation: stars 60s linear infinite;
            opacity: 0.3;
        }
        @keyframes stars {
            from { transform: translate(0,0); }
            to { transform: translate(-500px, -500px); }
        }

        .dashboard {
            position: relative;
            background: rgba(18, 18, 48, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 0 25px rgba(0, 204, 255, 0.4);
            text-align: center;
            width: 100%;
            max-width: 550px;
            backdrop-filter: blur(10px);
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            color: #00ccff;
            font-size: 28px;
            margin-bottom: 25px;
            text-shadow: 0 0 8px #00ccff;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin: 15px 0;
        }

        a, button {
            text-decoration: none;
            font-size: 18px;
            color: white;
            background: linear-gradient(90deg, #0d1b3d, #1f3a93);
            padding: 14px 20px;
            border-radius: 10px;
            display: inline-block;
            transition: 0.3s;
            border: none;
            cursor: pointer;
            width: 80%;
            box-shadow: 0 0 10px rgba(0,204,255,0.4);
        }

        a:hover, button:hover {
            background: linear-gradient(90deg, #00ccff, #0066ff);
            color: black;
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(0,204,255,0.8);
        }

        form {
            margin: 0;
        }

        .footer-note {
            font-size: 0.85em;
            margin-top: 25px;
            color: #a8d8ff;
            opacity: 0.8;
        }

        @media (max-width: 480px) {
            .dashboard {
                padding: 25px;
            }
            a, button {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <div class="dashboard">
        <h2>Welcome, <%= userName %> 🚀</h2>
        <ul>
            <li><a href="bookTrip.jsp">🛰 Book Trip</a></li>
            <li>
                <form action="ViewBookingServlet" method="get">
                    <button type="submit">📄 View Booking</button>
                </form>
            </li>
            <li><a href="feedback.jsp">💬 Feedback</a></li>
            <li><a href="logout.html">🔓 Logout</a></li>
        </ul>
        <div class="footer-note">🌌 Your Gateway to the Stars</div>
    </div>

</body>
</html>
