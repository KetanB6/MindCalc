package Servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import static Servlets.gameServlet.answer;
import static Servlets.gameServlet.QNo;;

@WebServlet("/resultServlet")
public class resultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public resultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectedOption = (String) request.getParameter("selected");
		if(selectedOption == null) {
			selectedOption = "0";
		}
		
		System.out.println("selected: " + selectedOption);
		System.out.println("answer: " + answer);
		
		
		if(selectedOption.equals(answer)) {
			QNo++;
			response.sendRedirect("gameServlet");
		} else {
			request.setAttribute("right", answer);
			int attempt = QNo;
			String score = "";
			QNo = 1;
			if(attempt == 1) {
				score = "0";
			}else if(attempt < 10) {
				score = "⭐";
			} else if(attempt < 20) {
				score = "⭐⭐";
			} else if(attempt < 30) {
				score = "⭐⭐⭐";
			} else if(attempt < 40) {
				score = "⭐⭐⭐⭐";
			} else {
				score = "⭐⭐⭐⭐⭐";
			}
			request.setAttribute("score", score);
			RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
			dispatcher.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
