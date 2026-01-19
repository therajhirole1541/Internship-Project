<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Space Tourism</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #000015, #0a0a23);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .contact-container {
            background-color: #121230;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.6);
            max-width: 600px;
            width: 90%;
        }

        h2 {
            text-align: center;
            color: #00ccff;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input, textarea {
            margin-bottom: 15px;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            background-color: #1a1a40;
            color: white;
        }

        textarea {
            resize: vertical;
            min-height: 120px;
        }

        button {
            background-color: #00ccff;
            color: black;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: white;
            color: #0a0a23;
        }

        .info-text {
            text-align: center;
            color: #aaa;
            font-size: 14px;
            margin-top: 20px;
        }

        @media (max-width: 500px) {
            .contact-container {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>

    <div class="contact-container">
        <h2>📞 Contact Us</h2>
        <form method="post" action="ContactServlet">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <input type="text" name="subject" placeholder="Subject" required>
            <textarea name="message" placeholder="Your Message..." required></textarea>
            <button type="submit">Send Message</button>
        </form>
        <div class="info-text">
            We'll get back to you as soon as possible. 🌌
        </div>
    </div>

</body>
</html>
