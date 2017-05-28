package worldpedia;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import worldpedia.beans.User;
import worldpedia.driver.UserRepo;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(); 
    	session.invalidate();
    	response.sendRedirect("index.jsp");
    	return; 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  email = request.getParameter("email");
		String  password = request.getParameter("password");
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		UserRepo repo = new UserRepo();
		
		user = repo.loginUser(user);
		if(!(user.getEmail().equals("")) && !(user.getPassword().equals(""))){
			//user logged
			HttpSession session = request.getSession();
		    session.setAttribute("username", user.getName());
		    session.setAttribute("id", user.getId());
		    session.setAttribute("role", user.getRole());
		    session.setAttribute("image", user.getPhoto());
		    session.setAttribute("email", user.getEmail());
		    session.setAttribute("logged", true);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
			
		}else{
			//user not logged
			request.setAttribute("error", "Email or password not correct! Please try again.");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
