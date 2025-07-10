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
		    window.location.href = "index.jsp";
		  }
		});
</script>

	<%
    int[] numbers = (int[]) request.getAttribute("numbers");
	%>

    <div class="container">
    	<h1 class="head">MindCalc</h1>
    	<div class="top-status">
            <div class="Qno">Level: ${level}</div>
            <div class="t2">Qno: ${qno}</div>
        </div>
        
        <div class="progress-container">
		  <div class="progress-bar" id="progressBar"></div>
		</div>

		<script>
		  const progressBar = document.getElementById('progressBar');
		  let width = 0;
		  const duration = 11000;
		  const interval = 90;
		
		  const step = 100 / (duration / interval);
		
		  const timer = setInterval(() => {
		    if (width >= 100) {
		      clearInterval(timer);
		      document.getElementById("form").submit();
		    } else {
		      width += step;
		      progressBar.style.width = width + '%';
		    }
		  }, interval);
		</script>
        
        <div class="container c2" id="box">
        	${firstNum}
        </div>
        <div class="container c2 c3">
        	<form action="resultServlet" method="post" id="form">
	            <button class="start options" name="selected" value="${first}">${first}</button>
	            <button class="start options" name="selected" value="${second}">${second}</button>
	            <button class="start options" name="selected" value="${third}">${third}</button>
	            <button class="start options" name="selected" value="${fourth}">${fourth}</button>
           </form>
        </div>
    </div>
    
    <script>

	    const numbers = <%= java.util.Arrays.toString(numbers).replace("[", "[").replace("]", "]") %>;
	    const box = document.getElementById('box');
	    let index = 1;
	
	    const countdown = setInterval(() => {
	        if (index < numbers.length) {
	            box.textContent = numbers[index];
	            index++;
	        } else {
	            clearInterval(countdown);
	            box.textContent = 'What is sum?';
	        }
	    }, 2000);
	</script>
</body>

</html>