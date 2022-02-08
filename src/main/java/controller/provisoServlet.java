package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class provisoServlet
 */
@WebServlet(name = "ProvisoServlet", urlPatterns = {"/proviso/*"})
public class provisoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public provisoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String base = "/jsp/"; //Sets the base as the jsp folder.
		String url = base + "index.jsp"; //The default url points to index.jsp in the jsp folder.
		String action = request.getParameter("action"); //Get the action parameter when provided.
		
		if (action != null) {
			switch(action) {
			case "homepage":
				url = base + "index.jsp";
				break;
			case "viewLogin":
				url = base + "login.jsp";
				break;
			}
		}
	}

}
