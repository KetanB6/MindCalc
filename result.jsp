<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            Score:<br> ${score}
        </div>
       <div class="container c2 c3">
        	<form action="gameServlet" method="get" id="myForm"></form>
            <button class="start" onclick="loader()">Play Again</button>
            <button class="start" onclick="window.location.href='index.jsp'">Home</button>
        </div>
        
        <div class=" container blur blur2" id="blur">
        <div class="timer">
            <h1 id="timer">3</h1>
        </div>
   	 </div>
   	 
   	 <div class=" container blur blur2" id="message">
        <h1>Oops! The correct answer was ${right}</h1>
     </div>
    
    <script>    	
    	if(${right} != null){
    		document.getElementById('message').style.display='flex';
			setInterval(() => {                   
				document.getElementById('message').style.display='none';
            }, 2000);		
    	}
   
    </script>
   	 
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
    </div>
</body>

</html>