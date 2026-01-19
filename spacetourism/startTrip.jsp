<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%
    List<String> bookerNames = (List<String>) request.getAttribute("bookerNames");
    Boolean canStartObj = (Boolean) request.getAttribute("canStart");
    boolean canStart = (canStartObj != null && canStartObj);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Start Trip</title>
    <style>
        body {
            margin: 0;
            background: black;
            color: white;
            text-align: center;
            font-family: Arial, sans-serif;
            overflow: hidden;
        }

        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: radial-gradient(circle, rgba(0,0,0,1) 60%, rgba(10,10,30,1) 100%);
            z-index: -2;
        }

        .stars {
            position: fixed;
            width: 100%; height: 100%;
            
            animation: moveStars 200s linear infinite;
            z-index: -1;
        }
        @keyframes moveStars {
            from {background-position: 0 0;}
            to {background-position: -10000px 5000px;}
        }

        .shooting-star {
            position: absolute;
            width: 2px;
            height: 80px;
            background: linear-gradient(white, transparent);
            top: -100px;
            animation: shooting 5s linear infinite;
            opacity: 0.7;
        }
        @keyframes shooting {
            0% { transform: translateX(0) translateY(0) rotate(45deg); opacity: 0; }
            10% { opacity: 1; }
            100% { transform: translateX(-800px) translateY(800px) rotate(45deg); opacity: 0; }
        }

        .launch-btn {
            margin-top: 200px;
            padding: 20px 50px;
            font-size: 2em;
            font-weight: bold;
            color: white;
            background: red;
            border: none;
            border-radius: 15px;
            cursor: pointer;
            box-shadow: 0 0 20px yellow, 0 0 40px orange;
            transition: transform 0.3s;
        }
        .launch-btn:hover {
            transform: scale(1.1);
        }

        .names {
            font-size: 2em;
            margin-top: 50px;
            display: none;
        }

        .countdown {
            font-size: 7em;
            font-weight: bold;
            margin-top: 200px;
            text-shadow: 0 0 20px yellow, 0 0 40px orange, 0 0 60px red;
            display: none;
            animation: glow 1s infinite;
        }
        @keyframes glow {
            0% { color: red; text-shadow: 0 0 20px red; }
            50% { color: yellow; text-shadow: 0 0 40px orange; }
            100% { color: red; text-shadow: 0 0 20px red; }
        }

        .rocket {
            position: absolute;
            bottom: -200px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 100px;
            display: none;
            animation: flyUp 4s linear forwards;
        }
        @keyframes flyUp {
            0% { bottom: -200px; opacity: 1; }
            100% { bottom: 120%; opacity: 0; }
        }

        .video {
            display: none;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            z-index: 10;
        }
        iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
</head>
<body>
<div class="stars"></div>
<div class="shooting-star" style="left: 80%; animation-delay: 2s;"></div>
<div class="shooting-star" style="left: 50%; animation-delay: 6s;"></div>
<div class="shooting-star" style="left: 30%; animation-delay: 10s;"></div>

<%
    if (!canStart) {
%>
    <h1>Cannot start trip — less than 5 bookings.</h1>
<%
    } else {
%>
    <!-- Launch Button -->
    <button class="launch-btn" onclick="startLaunch()">🚀 Launch Rocket</button>

    <!-- Show bookers -->
    <div class="names">
        <h2>👨‍🚀 Bookers Ready for Launch:</h2>
        <ul>
            <% for (String name : bookerNames) { %>
                <li><%= name %></li>
            <% } %>
        </ul>
    </div>

    <!-- Countdown display -->
    <div class="countdown"></div>

    <!-- Rocket animation -->
    <div class="rocket">🚀</div>

    <!-- Video -->
    <div class="video">
        <iframe src="https://www.youtube.com/embed/0qo78R_yYFA?autoplay=1&mute=0"
                allow="autoplay; fullscreen"></iframe>
    </div>

    <script>
        const namesDiv = document.querySelector('.names');
        const countdownDiv = document.querySelector('.countdown');
        const rocketDiv = document.querySelector('.rocket');
        const videoDiv = document.querySelector('.video');
        const launchBtn = document.querySelector('.launch-btn');

        function startLaunch() {
            launchBtn.style.display = 'none'; // hide button
            namesDiv.style.display = 'block'; // Step 1: Show names
            setTimeout(() => {
                namesDiv.style.display = 'none';
                startCountdown(10);  // Step 2: Start countdown
            }, 5000);
        }

        function startCountdown(seconds) {
            countdownDiv.style.display = 'block';
            let count = seconds;
            countdownDiv.textContent = count;

            const timer = setInterval(() => {
                count--;
                countdownDiv.textContent = count;
                if (count <= 0) {
                    clearInterval(timer);
                    countdownDiv.style.display = 'none';

                    // Step 3: Show rocket animation
                    rocketDiv.style.display = 'block';
                    rocketDiv.addEventListener("animationend", () => {
                        rocketDiv.style.display = 'none';
                        videoDiv.style.display = 'block'; // Step 4: Show full video
                    });
                }
            }, 1000);
        }
    </script>
<%
    }
%>
</body>
</html>


