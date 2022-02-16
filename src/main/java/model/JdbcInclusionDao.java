package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Inclusion;

public class JdbcInclusionDao implements InclusionDao
{
	JdbcManager db = null;  
	
	public JdbcInclusionDao() 
	{
		db = new JdbcManager();
	}
	
	//Method to add new inclusion record to database
	@Override
	public void add(Inclusion entity) 
	{
		Connection conn = db.getConn(); 
		Inclusion newInclusion = entity;
		
		//Perform SQL INSERT INTO include Table and output success or fail
		if(conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement(); 
				String sql = String.format("INSERT INTO include (reservation_id, amenity_id) VALUES(%s, %s);", 
						newInclusion.getReservationID(), newInclusion.getAmenityID());
				
				try
				{
					stmt.executeUpdate(sql);
					System.out.println("Inserted newInclusion: " + newInclusion.toString());
				}
				finally 
				{
					stmt.close();				
				}
			}
			catch(SQLException ex)
			{
				System.out.println("Unable to insert newInclusion: " + newInclusion.toString());
				System.out.println("SQL Exception: " + ex.getMessage());
			}
		}
	}
	
	//Method to retrieve a list of all inclusions
	@Override
	public List<Inclusion> list() 
	{
		Connection conn = db.getConn();
		ArrayList<Inclusion> inclusions = new ArrayList<Inclusion>();
		
		if(conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement();
				String sql = "SELECT reservation_id, amenity_id "
						+ "FROM reservations";
				
				try 
				{
					ResultSet rs = stmt.executeQuery(sql);
					
					try 
					{
						while(rs.next()) 
						{
							Inclusion inclusion = new Inclusion();
							inclusion.setReservationID(rs.getLong(1));
							inclusion.setAmenityID(rs.getLong(2));
							inclusions.add(inclusion);
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
				System.out.println("Could not retrieve inclusions.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
		
		return inclusions;
	}
	
	//Method to retrieve a list of all inclusions with reservation_id
	public List<Inclusion> list(Long reservationID) 
	{
		Connection conn = db.getConn();
		ArrayList<Inclusion> inclusions = new ArrayList<Inclusion>();
		
		if(conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement();
				String sql = "SELECT reservation_id, amenity_id "
						+ "FROM reservations "
						+ "WHERE reservation_id = " + reservationID;
				
				
				try 
				{
					ResultSet rs = stmt.executeQuery(sql);
					
					try 
					{
						while(rs.next()) 
						{
							Inclusion inclusion = new Inclusion();
							inclusion.setReservationID(rs.getLong(1));
							inclusion.setAmenityID(rs.getLong(2));
							inclusions.add(inclusion);
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
				System.out.println("Could not retrieve reservation inclusions.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
		
		return inclusions;
	}

	@Override
	public Inclusion find(Long key) 
	{
		// Cannot properly be implemented as this Entity has a composite key.
		return null;
	}
	
	//Method to retrieve an inclusion with reservation_id and amenity_id
	public Inclusion find(Long reservationID, Long amenityID) 
	{
		Connection conn = db.getConn(); 
		
		Inclusion inclusion = null;
		
		if (conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement();
				String sql = "SELECT reservation_id, amenity_id "
						+ "FROM inclusions "
						+ "WHERE reservation_id = " + reservationID + " AND amenity_id = " + amenityID;
				
				try 
				{
					ResultSet rs = stmt.executeQuery(sql);
					
					try 
					{
						if (rs.next()) 
						{
							inclusion = new Inclusion(rs.getLong(1), rs.getLong(2));
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
				System.out.println("Could not retrieve inclusion.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
		}
		
		return inclusion;
	}
	
	@Override
	public void update(Inclusion entity) 
	{
		// TODO - No feature to update inclusions yet. Can be automatically updated through proper SQL Table Creation
	}

	@Override
	public void remove(Long key) 
	{
		// // Cannot properly be implemented as this Entity has a composite key. 
	}
	
	public void remove(Long reservationID, Long amenityID) 
	{
		// TODO - No feature to delete inclusions yet. Can be automatically deleted through proper SQL Table Creation
	}
}
