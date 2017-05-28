package worldpedia;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import worldpedia.driver.UserRepo;

/**
 * Servlet implementation class Account
 */
@WebServlet("/Account")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  username = request.getParameter("name");
		String  oldpassword = request.getParameter("oldpassword");
		String  password = request.getParameter("password");
		String  confirm = request.getParameter("confirm");
		UserRepo userRepo = new UserRepo();
		
		if(!oldpassword.equals("")){
			if(userRepo.checkOldPassword(oldpassword, request)){
				if(password.length() < 6){
					request.setAttribute("error-settings", "Password is short!");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
					dispatcher.forward(request, response);
				}
				if(password.equals(confirm)){
					userRepo.changePassword(password, request);
					request.setAttribute("error-settings", "Password was change!");
				}else{
					request.setAttribute("error-settings", "Passwords mismatch!");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
					dispatcher.forward(request, response);
				}
			}else{
				//old password is not correct
				request.setAttribute("error-settings", "Old password is wrong!");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
				dispatcher.forward(request, response);
			}
		}
		
	
		userRepo.changeUsername(username, request);
		request.getSession().setAttribute("username", username);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
		dispatcher.forward(request, response);
	}

}
