<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="google-site-verification" content="your_verification_token" />
    <title>MindCalc</title>
    <link rel="stylesheet" href="styles/styles.css">
</head>

<body>
<script>
	window.addEventListener("pageshow", function(event) {
		  if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
		    // This was a back or forward navigation
		    window.location.href = "index.jsp";
		  }
		});
</script>
    <div class="container">
        <h1 class="head">MindCalc</h1>
        <div class="container c2">
            Try not to forgot the numbers while adding them.
        </div>
        <div class="container c2 c3 idx">
        	<form action="gameServlet" method="get" id="myForm"></form>
            <button class="start" onclick="loader()">Start</button>
        </div>
    </div>

    <div class=" container blur" id="blur">
        <div class="timer">
            <h1 id="timer">3</h1>
        </div>
    </div>
    <script>
        function loader() {
            document.getElementById('blur').style.display = 'flex';

            let seconds = 3;
            const timerElement = document.getElementById("timer");

            const countdown = setInterval(() => {
                seconds--;
                if (seconds > 0) {
                    timerElement.textContent = seconds;
                } else {
                    clearInterval(countdown);
                    document.getElementById("myForm").submit();
                }
            }, 1000);

        }
    </script>
</body>

</html>