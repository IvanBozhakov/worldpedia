package worldpedia;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import worldpedia.beans.Landmark;
import worldpedia.driver.Landmarks;

/**
 * Servlet implementation class FovoritesServlet
 */
@WebServlet("/FovoritesServlet")
public class FovoritesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FovoritesServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get favorites for user
		if(request.getSession().getAttribute("logged") == null){
			request.getRequestDispatcher("/login.jsp").forward(request, response);
	   	}else{
		Landmarks landmarksRepo = new Landmarks();
		int user_id = (Integer)request.getSession().getAttribute("id");
		ArrayList<Landmark> landmarks =  landmarksRepo.getFavoritesLandmarksForUser(user_id);
		if(landmarks.size() == 0){
			request.setAttribute("no_found", true);
		}
		request.setAttribute("landmarks", landmarksRepo.getFavoritesLandmarksForUser(user_id));
		request.getRequestDispatcher("/favorites.jsp").forward(request, response);
	   	}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(request.getSession().getAttribute("logged") == null){
			request.getRequestDispatcher("/favorites.jsp").forward(request, response);
	   	}else{
			int landmark_id = Integer.parseInt(request.getParameter("landmark_id"));
			int user_id = (Integer)request.getSession().getAttribute("id");
			Landmarks landmarksRepo = new Landmarks();
			landmarksRepo.addFavorite(user_id, landmark_id);
			this.doGet(request, response);
	   	}
		//request.getRequestDispatcher("/index.jsp").forward(request, response);
		
	}

}
