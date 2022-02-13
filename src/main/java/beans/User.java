package beans;

public class User 
{
	private long userID;
	private String email;
	private String password;
	private String firstName;
	private String lastName;
	private long accruedLoyaltyPoints;
	
	//Constructor to access all members of a User record
	public User(long userID, String email, String password, String firstName, String lastName, long accruedLoyaltyPoints)
	{
		this.userID = userID;
		this.email = email;
		this.password = password;
		this.firstName = firstName; 
		this.lastName = lastName;
		this.accruedLoyaltyPoints = accruedLoyaltyPoints;
	}
	
	//Constructor for minimum requirements for registration
	public User(long userID, String email, String password)
	{
		this.userID = userID;
		this.email = email;
		this.password = password;
	}
	
	public User(Long userID, String email) {
		this.userID = userID;
		this.email = email;
	}
	
	//Default constructor
	public User() {}

	public long getUserID() 
	{
		return userID;
	}

	public void setUserID(long userID) 
	{
		this.userID = userID;
	}

	public String getEmail() 
	{
		return email;
	}

	public void setEmail(String email) 
	{
		this.email = email;
	}

	public String getPassword() 
	{
		return password;
	}

	public void setPassword(String password) 
	{
		this.password = password;
	}

	public String getFirstName() 
	{
		return firstName;
	}

	public void setFirstName(String firstName) 
	{
		this.firstName = firstName;
	}

	public String getLastName() 
	{
		return lastName;
	}

	public void setLastName(String lastName) 
	{
		this.lastName = lastName;
	}

	public long getAccruedLoyaltyPoints() 
	{
		return accruedLoyaltyPoints;
	}

	public void setAccruedLoyaltyPoints(long accruedLoyaltyPoints) 
	{
		this.accruedLoyaltyPoints = accruedLoyaltyPoints;
	}

	@Override
	public String toString()
	{		
		return String.format("User{userID=%s, email=%s, password=%s, firstName=%s, lastName=%s, accruedLoyaltyPoints=%s}",
				userID, email, password, firstName, lastName, accruedLoyaltyPoints);
	}
	
}
