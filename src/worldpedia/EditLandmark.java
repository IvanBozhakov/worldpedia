package worldpedia;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import worldpedia.driver.Images;
import worldpedia.driver.Landmarks;

/**
 * Servlet implementation class EditLandmark
 */
@WebServlet("/EditLandmark")
public class EditLandmark extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private final String UPLOAD_DIRECTORY = "C:/Users/Admin/workspace/Worldpedia/WebContent/landmarks_photo";
    public EditLandmark() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/edit-landmark.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("logged") == null || !request.getSession().getAttribute("role").equals("admin")){
   		 response.sendRedirect("/");
   	}
   	
   	String land_name = null;
   	int lnd;
   	int country= 0;
   	int landmark_id = 0;
       if(ServletFileUpload.isMultipartContent(request)){
           try {
        	
           	
           	String land_desc= null;
           	
           	ArrayList<String> image_names = new ArrayList<String>();
               List<FileItem> multiparts = new ServletFileUpload(
                                        new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));
            
           	
           	
               for(FileItem item : multiparts){
                   if(!item.isFormField() && item.getSize() > 0){
                   	
                       String name = new File(item.getName()).getName();
                       item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                       image_names.add(name);
                       //
                   }else if(item.isFormField()){
                   	if (item.getFieldName().equals("name")) {
                   	     land_name = new String(item.getString().getBytes("iso-8859-1"), "UTF-8");
                   	     
                   	    
                   	  
                   	  }else if (item.getFieldName().equals("description")) {
                   		  land_desc = new String(item.getString().getBytes("iso-8859-1"), "UTF-8");
                   	  }
                   	  else if (item.getFieldName().equals("country_select")) {
                   		  country = Integer.parseInt(item.getString());
                      }
                   	  else if (item.getFieldName().equals("landmark_id")) {
                 		  landmark_id = Integer.parseInt(item.getString());
                       }
                   }
               }
            Landmarks landmark = new Landmarks();
            
           landmark.update(land_name, land_desc, country,landmark_id);
          	Images imageRepo = new Images();
           	
           	System.out.println(image_names);
           	if(image_names.size() > 0){
        
           	
           	for(String i :image_names){
           		
           		imageRepo.create("landmarks_photo/"+i, landmark_id);
           	}
           	
               imageRepo.closeConnection();
           	}
           	
              
           } catch (Exception ex) {
              System.out.println(ex);
           }          
        
       }else{
          //err
       }
      
     
       response.sendRedirect("EditLandmark?id="+landmark_id);
      //request.getRequestDispatcher("/add-landmark.jsp").forward(request, response);
	}

}
