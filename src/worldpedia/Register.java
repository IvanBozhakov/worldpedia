package worldpedia;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import worldpedia.beans.User;
import worldpedia.driver.UserRepo;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }
    public static final Pattern VALID_EMAIL_ADDRESS_REGEX = 
    	    Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  name = request.getParameter("name");
		String  email = request.getParameter("email");
		String  password = request.getParameter("password");
		String  confirm = request.getParameter("confirm");
		
		if(!this.validate(email)){
			request.setAttribute("error", "Email not valid!");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/register.jsp");
			dispatcher.forward(request, response);
		}
		if(!password.equals(confirm)){
			request.setAttribute("error", "Passwords not match!");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/register.jsp");
			dispatcher.forward(request, response);
		}
		if(password.length() < 4){
			request.setAttribute("error", "Passwords is short!");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/register.jsp");
			dispatcher.forward(request, response);
		}
		if(name.length() < 3){
			request.setAttribute("error", "Name is short!");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/register.jsp");
			dispatcher.forward(request, response);
		}
		User user = new User(name, email, password, "user");
		UserRepo repo = new UserRepo();
		
		if(!repo.checkUserEmail(email)){
			repo.createUser(user);
		}else{
			request.setAttribute("error", "Email already exists!");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/register.jsp");
			dispatcher.forward(request, response);
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
		dispatcher.forward(request, response);
	}
	
	public  boolean validate(String email) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX .matcher(email);
        return matcher.find();
	}
	
	

	
	
	

}
