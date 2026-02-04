package Servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Random;

@WebServlet("/gameServlet")
public class gameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String answer;
	public static int QNo = 1;
  
    public gameServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("qno", QNo);
		
		int opt1 = 0;
		int opt2 = 0;
		int opt3 = 0;
		
		Random r = new Random();
		int[] arr = new int[3];
		int ans = 0;
		
		if(QNo < 11) {
			for(int i = 0; i < 3; i++) {
				arr[i] = r.nextInt(51);
				ans += arr[i];
			}
			request.setAttribute("level", "Level 1");
			opt1 = r.nextInt(201);
			opt2 = r.nextInt(201);
			opt3 = r.nextInt(201);;
		} else if(QNo < 21) {
			for(int i = 0; i < 3; i++) {
				arr[i] = r.nextInt(101);
				ans += arr[i];
			}
			request.setAttribute("level", "Level 2");
			opt1 = r.nextInt(301);
			opt2 = r.nextInt(301);
			opt3 = r.nextInt(301);
		} else if(QNo < 31) {
			for(int i = 0; i < 3; i++) {
				arr[i] = r.nextInt(501);
				ans += arr[i];
			}
			request.setAttribute("level", "Level 3");
			opt1 = r.nextInt(1501);
			opt2 = r.nextInt(1501);
			opt3 = r.nextInt(1501);
		} else if(QNo < 41) {
			for(int i = 0; i < 3; i++) {
				arr[i] = r.nextInt(1001);
				ans += arr[i];
			}
			request.setAttribute("level", "Level 4");
			opt1 = r.nextInt(3001);
			opt2 = r.nextInt(3001);
			opt3 = r.nextInt(3001);
		} else if(QNo < 51) {
			for(int i = 0; i < 3; i++) {
				arr[i] = r.nextInt(10001);
				ans += arr[i];
			}
			request.setAttribute("level", "Level 5");
			opt1 = r.nextInt(30001);
			opt2 = r.nextInt(30001);
			opt3 = r.nextInt(30001);
		}
		request.setAttribute("firstNum", arr[0]);
		request.setAttribute("numbers", arr);
		answer = String.valueOf(ans);
		
		String[] options = {"first", "second", "third", "fourth"};
		
		for (int i = options.length - 1; i > 0; i--) {
	        int j = r.nextInt(i + 1);
	        String temp = options[i];
	        options[i] = options[j];
	        options[j] = temp;
	    }
		
		request.setAttribute(options[0], ans); // Correct answer in random position
	    request.setAttribute(options[1], opt1); // 0 to 400
	    request.setAttribute(options[2], opt2);
	    request.setAttribute(options[3], opt3);

	    System.out.println("Answer at: " + options[0]);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("game.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

