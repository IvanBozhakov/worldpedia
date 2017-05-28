package worldpedia;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import worldpedia.beans.Tag;
import worldpedia.driver.TagsRepo;

/**
 * Servlet implementation class Tags
 */
@WebServlet("/Tags")
public class Tags extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Tags() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int landmark = Integer.parseInt(request.getParameter("landmark").toString());
		
		TagsRepo tagRepo = new TagsRepo();
		ArrayList<ArrayList<String>> list = tagRepo.getTagUsersByLandmarkId(landmark);
		Gson gson=new GsonBuilder().create();
	    String jsonArray=gson.toJson(list);
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(jsonArray);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user_id = Integer.parseInt(request.getSession().getAttribute("id").toString());
		
		int landmark = Integer.parseInt(request.getParameter("landmark"));
		String comment = request.getParameter("comment");
		String date =  request.getParameter("date");
		
		Tag tag = new Tag();
		tag.setUser_id(user_id);
		tag.setLandmark_id(landmark);
		tag.setComment(comment);
		tag.setDate(date);
		TagsRepo tagrepo = new TagsRepo();
		tagrepo.tag(tag);
		
	
	}

}
