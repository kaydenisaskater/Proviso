package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.GuestOption;

public class JdbcGuestOptionDao implements GuestOptionDao
{
	JdbcManager db = null;  
	
	public JdbcGuestOptionDao() 
	{
		db = new JdbcManager();
	}	
	//Method to add new guest_option record to database
	@Override
	public void add(GuestOption entity) 
	{
		Connection conn = db.getConn(); 
		GuestOption newGuestOption = entity;
		
		//Perform SQL INSERT INTO guest_options Table and output success or fail
		if(conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement(); 
				String sql = String.format("INSERT INTO guest_options (guest_count, price) VALUES(%s, %s);", 
						newGuestOption.getGuestCount(), newGuestOption.getPrice());
				
				try
				{
					stmt.executeUpdate(sql);
					System.out.println("Inserted newGuestOption: " + newGuestOption.toString());
				}
				finally 
				{
					stmt.close();				
				}
			}
			catch(SQLException ex)
			{
				System.out.println("Unable to insert newGuestOption: " + newGuestOption.toString());
				System.out.println("SQL Exception: " + ex.getMessage());
			}
		}
	}
	
	//Method to retrieve a list of all guest_options
	@Override
	public List<GuestOption> list() 
	{
		Connection conn = db.getConn();
		ArrayList<GuestOption> guestOptions = new ArrayList<GuestOption>();
		
		if(conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement();
				String sql = "SELECT guest_option_id, guest_count, price "
						+ "FROM guest_options";
				
				try 
				{
					ResultSet rs = stmt.executeQuery(sql);
					
					try 
					{
						while(rs.next()) 
						{
							GuestOption guestOption = new GuestOption();
							guestOption.setGuestOptionID(rs.getLong(1));
							guestOption.setGuestCount(rs.getInt(2));
							guestOption.setPrice(rs.getDouble(3));
							guestOptions.add(guestOption);
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
				System.out.println("Could not retrieve guest_options.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
		
		return guestOptions;
	}
	
	//Method to retrieve a guest_option with guest_option_id
	@Override
	public GuestOption find(Long key) 
	{
		Connection conn = db.getConn(); 
		
		GuestOption guestOption = null;
		
		if (conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement(); 
				String sql = "SELECT guest_option_id, guest_count, price FROM guest_options "
						+ "WHERE guest_option_id = " + key;
				
				try 
				{
					ResultSet rs = stmt.executeQuery(sql);
					
					try 
					{
						if (rs.next()) 
						{
							guestOption = new GuestOption(rs.getLong(1), rs.getInt(2), rs.getDouble(3));
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
				System.out.println("Could not retrieve guest_option.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
		}
		
		return guestOption;
	}
	
	//Method to update guest_option record with guest_option_id
	@Override
	public void update(GuestOption entity) 
	{
		Connection conn = db.getConn();
		
		if (conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement();
				String sql = "UPDATE guest_options SET guest_count = " + entity.getGuestCount()
					+ ", price = " + entity.getPrice()
					+ "WHERE guest_option_id = " + entity.getGuestOptionID();
				
				try 
				{
					stmt.executeUpdate(sql);
					System.out.println("Updated guest_option: " + entity.toString());
				}
				finally
				{
					stmt.close();
				}
			}
			catch (SQLException ex)
			{
				System.out.println("Could not update guest_option.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
	}
	
	//Method to delete guest_option record with guest_option_id
	@Override
	public void remove(Long key) 
	{
		Connection conn = db.getConn(); 
		
		if (conn != null) 
		{
			try
			{
				Statement stmt = conn.createStatement(); 
				String sql = "DELETE FROM guest_options WHERE guest_option_id = " + key;
				
				try 
				{
					stmt.executeUpdate(sql);
					System.out.println("Deleted guest_option: guestOptionID = " + key);
				}
				finally
				{
					stmt.close();
				}
			}
			catch (SQLException ex)
			{
				System.out.println("Could not delete guest_option.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}	
	}
}
