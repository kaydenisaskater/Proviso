package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Amenity;

public class JdbcAmenityDao implements AmenityDao
{
	JdbcManager db = null;  
	
	public JdbcAmenityDao() 
	{
		db = new JdbcManager();
	}	
	//Method to add new amenity record to database
	@Override
	public void add(Amenity entity) 
	{
		Connection conn = db.getConn(); 
		Amenity newAmenity = entity;
		
		//Perform SQL INSERT INTO amenities Table and output success or fail
		if(conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement(); 
				String sql = String.format("INSERT INTO amenities (amenity_description, price, pay_rate) VALUES('%s', %s, '%s');", 
						newAmenity.getAmenityDescription(), newAmenity.getPrice(), newAmenity.getPayRate());

				
				try
				{
					stmt.executeUpdate(sql);
					System.out.println("Inserted newAmenity: " + newAmenity.toString());
				}
				finally 
				{
					stmt.close();				
				}
			}
			catch(SQLException ex)
			{
				System.out.println("Unable to insert newAmenity: " + newAmenity.toString());
				System.out.println("SQL Exception: " + ex.getMessage());
			}
		}
	}
	
	//Method to retrieve a list of all amenities
	@Override
	public List<Amenity> list() 
	{
		Connection conn = db.getConn();
		ArrayList<Amenity> amenities = new ArrayList<Amenity>();
		
		if(conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement();
				String sql = "SELECT amenity_id, amenity_description, price, pay_rate "
						+ "FROM amenities";
				
				try 
				{
					ResultSet rs = stmt.executeQuery(sql);
					
					try 
					{
						while(rs.next()) 
						{
							Amenity amenity = new Amenity();
							amenity.setAmenityID(rs.getLong(1));
							amenity.setAmenityDescription(rs.getString(2));
							amenity.setPrice(rs.getDouble(3));
							amenity.setPayRate(rs.getString(4));
							amenities.add(amenity);
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
				System.out.println("Could not retrieve amenities.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
		
		return amenities;
	}	
	//Method to retrieve an amenity with amenity_id
	@Override
	public Amenity find(Long key) 
	{
		Connection conn = db.getConn(); 
		
		Amenity amenity = null;
		
		if (conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement(); 
				String sql = "SELECT amenity_id, amenity_description, price, pay_rate FROM amenities "
						+ "WHERE amenity_id = " + key;
				
				try 
				{
					ResultSet rs = stmt.executeQuery(sql);					
					try 
					{
						if (rs.next()) 
						{
							amenity = new Amenity(rs.getLong(1), rs.getString(2), rs.getDouble(3), rs.getString(4));
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
				System.out.println("Could not retrieve amenity.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
		}
		
		return amenity;
	}
	
	//Method to update amenity record with amenity_id
	@Override
	public void update(Amenity entity) 
	{
		Connection conn = db.getConn();
		
		if (conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement();
				String sql = "UPDATE amenities SET amenity_description = '" + entity.getAmenityDescription()
					+ "', price = " + entity.getPrice()
					+ ", pay_rate = '" + entity.getPayRate()
					+ "', WHERE amenity_id = " + entity.getAmenityID();
				
				try 
				{
					stmt.executeUpdate(sql);
					System.out.println("Updated amenity: " + entity.toString());
				}
				finally
				{
					stmt.close();
				}
			}
			catch (SQLException ex)
			{
				System.out.println("Could not update amenity.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
	}	
	//Method to delete amenity record with amenity_id
	@Override
	public void remove(Long key) 
	{
		Connection conn = db.getConn(); 
		
		if (conn != null) 
		{
			try
			{
				Statement stmt = conn.createStatement(); 
				String sql = "DELETE FROM amenities WHERE amenity_id = " + key;
				
				try 
				{
					stmt.executeUpdate(sql);
					System.out.println("Deleted amenity: amenityID = " + key);
				}
				finally
				{
					stmt.close();
				}
			}
			catch (SQLException ex)
			{
				System.out.println("Could not delete amenity.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
	}
}
