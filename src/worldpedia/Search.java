package worldpedia;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import worldpedia.driver.Landmarks;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int country_id  = Integer.parseInt(request.getParameter("country"));
		String name  = request.getParameter("name").toLowerCase();
		Landmarks LandmarkRepo = new Landmarks();
		if(country_id != 0 && name.equals("")){
			//search by country
			request.setAttribute("landmarks", LandmarkRepo.searchByCountry(country_id));
		}else if(country_id == 0 && !(name.equals(""))){
			//search by name
			request.setAttribute("landmarks", LandmarkRepo.searchByName(name));
		}else if(country_id != 0 && !(name.equals(""))){
			request.setAttribute("landmarks", LandmarkRepo.searchByNameAndCountry(country_id, name));
			//search by name and country
		}else{
			//no search result
			request.setAttribute("no_found", true);
		}
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
