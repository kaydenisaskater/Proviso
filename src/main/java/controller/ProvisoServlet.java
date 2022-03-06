package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import beans.Amenity;
import beans.GuestOption;
import beans.Inclusion;
import beans.Reservation;
import beans.RoomSize;
import model.JdbcReservationDao;
import model.JdbcRoomSizeDao;
import model.JdbcAmenityDao;
import model.JdbcGuestOptionDao;
import model.JdbcInclusionDao;
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
		response.setContentType("text/html");
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String base = "/jsp/"; // Set the base folder name to jsp.
		String url = base + "index.jsp"; // set the default url to /jsp/index.jsp.
		String action = request.getParameter("action"); // get the parameter action value.
		
		
		HttpSession session = request.getSession();
		
		//Registration Message attributes
		session.setAttribute("errorMessageEmail", null);
		session.setAttribute("errorMessagePassword", null);
		session.setAttribute("successfulRegistration", null);
		
		//Login Message attributes
		session.setAttribute("errorMessageLogin", null);
		session.setAttribute("successfulAccountCreation", null);
		session.setAttribute("successfulLogin", null);
		session.setAttribute("successfulLogout", null);
		session.setAttribute("errorUpdatingUser", null);
		session.setAttribute("successfulUserUpdate", null);
		
		//Reservation Message attributes
		session.setAttribute("successfulReservation", null);
		
		
		if (action != null) 
		{
			switch (action) 
			{
				//user creation request
				case "createUser":
					if(createUser(request,response,session)) {
						url = base + "login.jsp";
					}else {
						url = base + "registration.jsp";
					}
					break;
					
				//update user request
				case "updateUser":
					updateUser(request, response, session);
					url = base + "profile.jsp";
					break;
					
				//login/logout request
				case "loginUser":
					if(loginUser(request, response, session)) {
						url = base + "index.jsp";
					}
					else {
						url = base + "login.jsp";
					}
					break;
				case "logout":
					logoutUser(request, response, session);
					url = base + "index.jsp";
					break;
				//page requests
				case "viewLogin":
					url = base + "login.jsp";
					break;
				case "profile":
					url = base + "profile.jsp";
					break;
				case "aboutUs":
					url = base + "About.jsp";
					break;
				case "contactUs":
					url = base + "contact.jsp";
					break;
				
					
				//reservation requests
				case "reservation":
					url = base + "hotelReservationImproved.jsp";
					break;
				case "confirmation":
					confirmReservation(request, response, session);
					url = base + "reservationConfirmation.jsp";
					break;
				case "placeReservation":
					placeReservation(request, response, session);
					url = base + "index.jsp";
					break;
				case "editReservation":
					url = base + "hotelReservationImproved.jsp";
					break;
				case "reservationSummary":
					url = base + "reservationSummary.jsp";
					break;
				//reservation lookup
				case "reservationLookup":
					url = base + "lookupThought.jsp";
					break;
					
				//loyalty points page requests
				case "loyaltyLookup":
					url = base + "loyaltyLookup.jsp";
					break;
				case "loyaltySummary":
					url = base + "personalLoyalty.jsp";
					break;
				case "lookup":
					if( lookupLoyalty(request, response)) {
						url = base + "loyaltyLookup.jsp";
					}
					else {
						url = base + "loyaltyLookup.jsp";
					}
					break;
				
			}
		}
		
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
		requestDispatcher.forward(request, response);
	}
	
	
	
	//Creates a New User in the database will return true if successful and false if not
	private boolean createUser(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException
	{
		
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
			session.setAttribute("errorMessagePassword", "Invalid Password: pasword must have 8 characters long and at least 1 uppercase and 1 lowercase character");
		}
		
		if(isValidEmail(email) && isValidPassword(password)) {
			session.setAttribute("successfulRegistration", "Registration Successful: Please Log in");
			JdbcUserDao userDao= new JdbcUserDao();
			userDao.add(newUser);
			return true;
		}
		
		return false;

	}
	//Validate Email
	private boolean isValidEmail(String email) {
		if(!email.contains("@")) {
			
			return false;
		}
		
		
		int index = email.indexOf('@');
		if(index > 0 && email.indexOf('.', index) > 0 && email.indexOf(' ') <= 0) {
			return true;
		}
		return false;
	}
	//Validate Password
	private boolean isValidPassword(String password) {
		int pwdSize = password.length();
		boolean isLowerCheck = false;
		boolean isUpperCheck = false;
		if(pwdSize >= 8) {
			for(int i = 0; i<pwdSize;i++) {
				char c = password.charAt(i);
				if(Character.isUpperCase(c)) {
					isUpperCheck = true;
				}
				if(Character.isLowerCase(c)) {
					isLowerCheck = true;
				}
				if(isLowerCheck && isUpperCheck) {
					return true;
				}
			}	
		}
		return false;
		
	}
	
	private boolean loginUser (HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		Long userId = null;
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User user = new User();
		
		JdbcUserDao userDao = new JdbcUserDao();
		
		userId = userDao.loginValidate(email, password);
		if (userId != null) {
			user = userDao.find(userId);
			session.setAttribute("user", user);
			session.setAttribute("successfulLogin", user.getFirstName() + " " + user.getLastName() + " logged in successfully!");
			return true;
		}
		else {
			session.setAttribute("errorMessageLogin", "Email or Password are incorrect.");
			return false;
		}
		
	}
	
	private void logoutUser (HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		User user = new User();
		user = (User)session.getAttribute("user");
		session.setAttribute("successfulLogout", user.getFirstName() + " " + user.getLastName() + " has been logged out.");
		session.removeAttribute("user");
	}
	
	private boolean updateUser (HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		boolean result = false;
		
		//instantiate a user object
		User user = new User();
		
		//set the user object to the sesssion's user attribute
		user = (User)session.getAttribute("user");
		
		
		//check if email is valid
		if (isValidEmail(email)) {
			JdbcUserDao userDao = new JdbcUserDao();
			
			if (userDao.existingEmail(user.getUserID(), email)) {
				session.setAttribute("errorUpdatingUser", "The email already exists.");
			}
			else {
				user.setUserID(Long.parseLong(userId));
				user.setFirstName(firstName);
				user.setLastName(lastName);
				user.setEmail(email);
				user.setPassword(user.getPassword());
				user.setAccruedLoyaltyPoints(user.getAccruedLoyaltyPoints());
				
				userDao.update(user);
				result = true;
				session.setAttribute("successfulUserUpdate", "Traveler information updated successfully!");
			}
		}
		else {
			session.setAttribute("errorUpdatingUser", "The email isn't a valid email");
			result = false;
		}
		return result;
	}
	
	private void confirmReservation(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Reservation reservation = new Reservation();
		JdbcAmenityDao amenityDao = new JdbcAmenityDao();
		JdbcGuestOptionDao guestOptionDao = new JdbcGuestOptionDao();
		JdbcRoomSizeDao roomSizeDao = new JdbcRoomSizeDao();
		
		String[] perPayRates = request.getParameterValues("per[]");
		String[] flatPayRates = request.getParameterValues("flat[]");
		
		String roomID = request.getParameter("roomSize");
		String guestCount = request.getParameter("guest");
		String checkIn = request.getParameter("check-in");
		String checkOut = request.getParameter("check-out");
		Double total = null;
		
		
		
		System.out.println("Room Size: " + roomID);
		System.out.println(
				"Guest Count: " + guestCount +
				"\nCheck In Date: " + checkIn + 
				"\nCheck Out Date: " + checkOut);
		if(perPayRates != null)
		{
			for (int i = 0; i < perPayRates.length; i++) 
			{
				System.out.println("Per Pay Rates: " + Long.parseLong(perPayRates[i]));
				Amenity amenity = amenityDao.find(Long.parseLong(perPayRates[i]));
				reservation.addAmenity(amenity);
			}
		}
		if(flatPayRates != null)
		{
			for (int i = 0; i < flatPayRates.length; i++) 
			{
				System.out.println("Flat Pay Rates: " + flatPayRates[i].toString());
				Amenity amenity = amenityDao.find(Long.parseLong(flatPayRates[i]));
				reservation.addAmenity(amenity);
			}
		}
		
		
		
		reservation.setRoomSizeID(Long.parseLong(roomID));
		reservation.setGuestOptionID(Long.parseLong(guestCount));
		reservation.setCheckIn(checkIn);
		reservation.setCheckOut(checkOut);
		
		reservation.calculateLoyaltyPoints();
		System.out.println("Loyalty Points: " + reservation.getLoyaltyPoints());
		
		RoomSize roomSize = roomSizeDao.find(Long.parseLong(roomID));
		reservation.setRoomSize(roomSize);
		
		GuestOption guestOption = guestOptionDao.find(Long.parseLong(guestCount));
		reservation.setGuestOption(guestOption);
		reservation.calculateTotalPrice();
		System.out.println("Total Price: " + reservation.getTotalPrice());
		
		session.setAttribute("pendingReservation", reservation);
		
		System.out.println("Check In: " + reservation.getCheckIn());

		
	}
	
	private void placeReservation(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Reservation pendingReservation = (Reservation)session.getAttribute("pendingReservation");
		User user = (User)session.getAttribute("user");
		Reservation reservation = new Reservation();
		Inclusion inclusion = new Inclusion();
	
		reservation.setCheckIn(pendingReservation.getCheckIn());
		reservation.setCheckOut(pendingReservation.getCheckOut());
		reservation.setTotalPrice(pendingReservation.getTotalPrice());
		reservation.setLoyaltyPoints(pendingReservation.getLoyaltyPoints());
		reservation.setRoomSizeID(pendingReservation.getRoomSizeID());
		reservation.setGuestOptionID(pendingReservation.getGuestOptionID());
		reservation.setUserID(user.getUserID());
		ArrayList<Amenity> amenities = pendingReservation.getAmenities();
		
		for (int i = 0; i < amenities.size(); i++) {
			Amenity amenity = amenities.get(i);
			amenity.getAmenityID();
		}

		JdbcReservationDao reservationDao = new JdbcReservationDao();
		JdbcInclusionDao inclusionDao = new JdbcInclusionDao();
		
		Long reservationID = reservationDao.addRetrieveKey(reservation);
		
		for (int i = 0; i < amenities.size(); i++) {
			Amenity amenity = amenities.get(i);
			
			inclusion.setReservationID(reservationID);
			inclusion.setAmenityID(amenity.getAmenityID());
			inclusionDao.add(inclusion);
		}
		
		session.removeAttribute("pendingReservation");
		session.setAttribute("successfulReservation", "Reservation has successfully been placed.");
		
	}
	
	private boolean lookupLoyalty(HttpServletRequest request, HttpServletResponse response) {
		JdbcUserDao userDao = new JdbcUserDao();
		
		if (request.getParameter("userId") == "") {
			request.setAttribute("lookupUserError", "Enter in a User ID.");
			return false;
		}else {
			User lookupUser = userDao.find(Long.parseLong(request.getParameter("userId")));
			
			if (lookupUser == null) {
				request.setAttribute("lookupUserMsg", "No user has been found with the id: " + request.getParameter("userId"));
			}
			
			request.setAttribute("lookupUser", lookupUser);
			return true;
		}
	}
}
