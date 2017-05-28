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
 * Servlet implementation class UserImage
 */
@WebServlet("/UserImage")
public class UserImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "C:/Users/Admin/workspace/Worldpedia/WebContent/images";

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
    	/*if(request.getSession().getAttribute("logged") == null || !request.getSession().getAttribute("role").equals("admin")){
    		 response.sendRedirect("/");
    	}*/
    	
    	
    	
        if(ServletFileUpload.isMultipartContent(request)){
        	
            try {
            	
            	String image;
            	
            	
            
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));
             
                
            	
                for(FileItem item : multiparts){
                	
                    if(!item.isFormField() && item.getSize() > 0){
                    	if(item.getContentType().equals("image/jpeg") || 
                    			item.getContentType().equals("image/png") || item.getContentType().equals("image/jpg") ||
                    			item.getContentType().equals("image/gif")){
                    		
                    		 String name = new File(item.getName()).getName();
                    		 name = request.getSession().getAttribute("id")+"_"+name;
                             item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                             image = name;
                             Images imageRepo = new Images();
                             imageRepo.updateUserImage(image, request);
                             request.getSession().setAttribute("image", image);
                            
                    }else{
                    	request.setAttribute("error", "File not image!");
            			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
            			dispatcher.forward(request, response);
                    }
                    	
                       
                        
                    }
                }
             
            	
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
    			dispatcher.forward(request, response);
            } catch (Exception ex) {
               System.out.println(ex);
            }          
         
        }else{
           //err
        }
       
       
    
	}

}
