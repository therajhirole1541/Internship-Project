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
    <title>Book Trip - Space Tourism</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background: radial-gradient(circle at top, #0a0a23, #000010);
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .booking-container {
            width: 100%;
            max-width: 550px;
            background: rgba(26, 26, 64, 0.95);
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 0 40px rgba(0, 204, 255, 0.3);
            backdrop-filter: blur(8px);
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            color: #00ccff;
            text-align: center;
            margin-bottom: 25px;
        }

        .emoji {
            font-size: 1.5em;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: 500;
            color: #a8d8ff;
        }

        input, select {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            background-color: #0f0f2d;
            color: white;
            font-size: 1em;
            outline: none;
            transition: all 0.3s ease;
        }

        input:focus, select:focus {
            background-color: #1a1a40;
            box-shadow: 0 0 8px #00ccff;
        }

        button {
            width: 100%;
            padding: 14px;
            margin-top: 25px;
            background: linear-gradient(90deg, #00ccff, #0066ff);
            color: white;
            font-weight: bold;
            font-size: 1.1em;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 0 10px rgba(0,204,255,0.5);
        }

        button:hover {
            background: linear-gradient(90deg, #00e6ff, #3399ff);
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(0,204,255,0.8);
        }

        .info-text {
            text-align: center;
            font-size: 0.9em;
            color: #b3e0ff;
            margin-top: 15px;
        }

        /* Responsive */
        @media (max-width: 600px) {
            .booking-container {
                padding: 25px;
            }
        }
    </style>
</head>
<body>

<div class="booking-container">
    <h2>🚀 Book Your Space Trip, <span class="emoji"><%= userName %></span></h2>

    <form action="BookTripServlet" method="post">
        <label>🌌 Destination:</label>
        <select name="destination" required>
            <option value="">Select Destination</option>
            <option value="Moon">🌙 Moon</option>
            <option value="Mars">🔴 Mars</option>
            <option value="ISS">🛰️ International Space Station</option>
            <option value="Titan">🪐 Titan (Saturn's Moon)</option>
            <option value="Europa">❄️ Europa (Jupiter's Moon)</option>
        </select>

        <label>📅 Date of Trip:</label>
        <input type="date" name="tripDate" required min="<%= java.time.LocalDate.now() %>">

        <label>🎟 No. of Tickets:</label>
        <input type="number" name="tickets" min="1" max="10" required>

        <button type="submit">🚀 Confirm Booking</button>
    </form>

    <div class="info-text">
        🌠 Experience the cosmos like never before! Seats are limited.
    </div>
</div>

</body>
</html>
