package worldpedia;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import worldpedia.driver.CommentsRepo;

/**
 * Servlet implementation class Comment
 */
@WebServlet("/Comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Comment() {
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
		CommentsRepo cr=new CommentsRepo();
		String text = request.getParameter("comment");
		int user = Integer.parseInt(request.getParameter("user"));
		int landmark = Integer.parseInt(request.getParameter("landmark"));
		cr.add(landmark, user, text);
		
		String json = "{\"text\": \""+text+"\",\"user\": \""+
		request.getSession().getAttribute("username")+"\", \"image\" : \""+
				request.getSession().getAttribute("image")+"\"}";
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
		
	}

}
