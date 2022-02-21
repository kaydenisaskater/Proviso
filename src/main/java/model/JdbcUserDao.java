package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.User;

public class JdbcUserDao implements UserDao
{
	JdbcManager db = null;  
	
	public JdbcUserDao() 
	{
		db = new JdbcManager();
	}
	
	//Method to add new user record to database
	@Override
	public void add(User entity) 
	{
		Connection conn = db.getConn(); 
		User newUser = entity;
		
		//Perform SQL INSERT INTO users Table and output success or fail
		if(conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement(); 
				String sql = String.format("INSERT INTO `proviso`.`users` (`email`, `password`, `first_name`, `last_name`) values('%s', MD5('%s'), '%s', '%s');", 
						newUser.getEmail(), newUser.getPassword(), newUser.getFirstName(), newUser.getLastName());
				
				try
				{
					stmt.executeUpdate(sql);
					System.out.println("Inserted newUser: " + newUser.toString());
				}
				finally 
				{
					stmt.close();				
				}
			}
			catch(SQLException ex)
			{
				System.out.println("Unable to insert newUser: " + newUser.toString());
				System.out.println("SQL Exception: " + ex.getMessage());
			}
		}
	}
	
	//Method to retrieve a list of all users
	@Override
	public List<User> list() 
	{
		Connection conn = db.getConn();
		ArrayList<User> users = new ArrayList<User>();
		
		if(conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement();
				String sql = "SELECT user_id, email, password, first_name, last_name , accrued_loyalty_points "
						+ "FROM users";
				
				try 
				{
					ResultSet rs = stmt.executeQuery(sql);
					
					try 
					{
						while(rs.next()) 
						{
							User user = new User();
							user.setUserID(rs.getLong(1));
							user.setEmail(rs.getString(2));
							user.setPassword(rs.getString(3));
							user.setFirstName(rs.getString(4));
							user.setLastName(rs.getString(5));
							user.setAccruedLoyaltyPoints(rs.getLong(6));						
							users.add(user);
						}
					}
					finally 
					{
						rs.close();
					}
				}
				finally 
				{
					stmt.close();
				}
			}
			catch (SQLException ex)
			{
				System.out.println("Could not retrieve users.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
		
		return users;
	}
	
	//Method to retrieve a user with user_id
	@Override
	public User find(Long key) {
		Connection conn = db.getConn(); 
		
		User user = null;
		
		if (conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement(); 
				String sql = "SELECT user_id, email, password, first_name, last_name , accrued_loyalty_points FROM users "
						+ "WHERE user_id =" + key;
				
				try 
				{
					ResultSet rs = stmt.executeQuery(sql);
					
					try 
					{
						if (rs.next()) 
						{
							user = new User(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), 
									rs.getString(5), rs.getLong(6));
						}
					}
					finally
					{
						rs.close();
					}
				}
				finally 
				{
					stmt.close();
				}				
			}
			catch (SQLException ex)
			{
				System.out.println("Could not retrieve user.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
		}
		
		return user;
	}
	
	//Method to update user record with user_id
	@Override
	public void update(User entity) 
	{
		Connection conn = db.getConn();
		
		if (conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement();
				String sql = "UPDATE users SET email = '" + entity.getEmail()
					+ "', password = '" + entity.getPassword()
					+ "', first_name = '" + entity.getFirstName()
					+ "', last_name = '" + entity.getLastName()
					+ "', accrued_loyalty_points = " + entity.getAccruedLoyaltyPoints()
					+ " WHERE user_id = " + entity.getUserID();
				
				try 
				{
					stmt.executeUpdate(sql);
					System.out.println("Updated user: " + entity.toString());
				}
				finally
				{
					stmt.close();
				}
			}
			catch (SQLException ex)
			{
				System.out.println("Could not update user.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
	}
	
	//Method to update user record with user_id
	@Override
	public void remove(Long key) 
	{
		Connection conn = db.getConn(); 
		
		if (conn != null) 
		{
			try
			{
				Statement stmt = conn.createStatement(); 
				String sql = "DELETE FROM users WHERE user_id = " + key;
				
				try 
				{
					stmt.executeUpdate(sql);
					System.out.println("Deleted user: userID = " + key);
				}
				finally
				{
					stmt.close();
				}
			}
			catch (SQLException ex)
			{
				System.out.println("Could not delete user.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
	}
	
	public Long loginValidate(String email, String password) {
		Connection conn = db.getConn();
		
		User user = null;
		Long userId = null;
		
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "SELECT user_id, email, password FROM `proviso`.`users` WHERE email = '" + email + "' AND password = MD5('" + password + "')";
				
				try {
					ResultSet rs = stmt.executeQuery(sql);
					
					try {
						if (rs.next()) {
							
							user = new User(rs.getLong(1), rs.getString(2), rs.getString(3));
							userId = user.getUserID();
						}
						else {
							System.out.println("Email or Password were incorrect.");
						}
					}
					finally { rs.close(); }
				}
				finally { stmt.close(); }
			}
			catch (SQLException e) {
				System.out.println(e);
			}
		}
		return userId;
	}
	
	public boolean existingEmail(Long userId, String email) {
		Connection conn = db.getConn();
		User user = null;
		boolean result = false;
		
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "SELECT user_id, email FROM `proviso`.`users` WHERE email = '" + email + "'";
				
				try {
					ResultSet rs = stmt.executeQuery(sql);
					
					try {
						if (rs.next()) {
							user = new User(rs.getLong(1), rs.getString(2));
							
							if (userId != user.getUserID() && email != user.getEmail()) {
								result = true;
							}
							else {
								result = false;
							}
						}
						else {
							result = false;
						}
					}
					finally { rs.close(); }
				}
				finally { stmt.close(); }
			}
			catch (SQLException e) {
				System.out.println("SQL Exception: " + e);
			}
		}
		return result;
	}
}
