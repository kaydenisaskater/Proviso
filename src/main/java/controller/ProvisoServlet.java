package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import model.JdbcUserDao;

/**
 * Servlet implementation class ProvisoServlet
 */
@WebServlet("/ProvisoServlet")
public class ProvisoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProvisoServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String base = "/jsp/"; // Set the base folder name to jsp.
		String url = base + "index.jsp"; // set the default url to /jsp/index.jsp.
		String action = request.getParameter("action"); // get the parameter action value.
		
		if (action != null) 
		{
			switch (action) 
			{
				case "createUser":
					createUser(request,response,base+"registration.jsp");
					break;
			}
		}
		
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);

		requestDispatcher.forward(request, response);
	}
	private void createUser(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		session.setAttribute("errorMessageEmail", null);
		session.setAttribute("errorMessagePassword", null);
		
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email"); 
		String password = request.getParameter("password"); 
		

		User newUser = new User();
		newUser.setFirstName(firstName);
		newUser.setLastName(lastName);
		
		//Email Check
		if(isValidEmail(email)) {
			newUser.setEmail(email);
		}else {
			session.setAttribute("errorMessageEmail", "invalid email address");
		}

		//Password Check
		if(isValidPassword(password)) {
			newUser.setPassword(password);
		}else {
			session.setAttribute("errorMessagePassword", "Invalid Password: pasword must have 8 charactors and at least 1 uppercase");
		}
		
		if(isValidEmail(email) && isValidPassword(password)) {
			JdbcUserDao userDao= new JdbcUserDao();
			userDao.add(newUser);
		}
		
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
		requestDispatcher.forward(request, response);

	}
	private boolean isValidEmail(String email) {
		int index = email.indexOf('@');
		if(index < 0 || email.indexOf('.', index) < 0 || email.indexOf(' ') >= 0) {
			return true;
		}
		return false;
	}
	private boolean isValidPassword(String password) {
		int pwdSize = password.length();
		if(pwdSize >= 8) {
			for(int i = 0; i<pwdSize;i++) {
				char c = password.charAt(i);
				if(Character.isUpperCase(c)) {
					return true;
				}
			}	
		}
		return false;
		
	}

}
