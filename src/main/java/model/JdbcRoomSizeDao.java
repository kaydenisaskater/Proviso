package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.RoomSize;

public class JdbcRoomSizeDao implements RoomSizeDao
{
	JdbcManager db = null;  
	
	public JdbcRoomSizeDao() 
	{
		db = new JdbcManager();
	}
	
	//Method to add new room_size record to database
	@Override
	public void add(RoomSize entity) 
	{
		Connection conn = db.getConn(); 
		RoomSize newRoomSize = entity;
		
		//Perform SQL INSERT INTO room_sizes Table and output success or fail
		if(conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement(); 
				String sql = String.format("INSERT INTO room_sizes (room_size_description) VALUES('%s');", 
						newRoomSize.getRoomSizeDescription());

				
				try
				{
					stmt.executeUpdate(sql);
					System.out.println("Inserted newRoomSize: " + newRoomSize.toString());
				}
				finally 
				{
					stmt.close();				
				}
			}
			catch(SQLException ex)
			{
				System.out.println("Unable to insert newRoomSize: " + newRoomSize.toString());
				System.out.println("SQL Exception: " + ex.getMessage());
			}
		}
	}
	
	//Method to retrieve a list of all room_sizes
	@Override
	public List<RoomSize> list() 
	{
		Connection conn = db.getConn();
		ArrayList<RoomSize> roomSizes = new ArrayList<RoomSize>();
		
		if(conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement();
				String sql = "SELECT room_size_id, room_size_description "
						+ "FROM room_sizes";
				
				try 
				{
					ResultSet rs = stmt.executeQuery(sql);
					
					try 
					{
						while(rs.next()) 
						{
							RoomSize roomSize = new RoomSize();
							roomSize.setRoomSizeID(rs.getLong(1));
							roomSize.setRoomSizeDescription(rs.getString(2));
							roomSizes.add(roomSize);
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
				System.out.println("Could not retrieve room_sizes.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
		
		return roomSizes;
	}
	
	//Method to retrieve a room_size with room_size_id
	@Override
	public RoomSize find(Long key) 
	{
		Connection conn = db.getConn(); 
		
		RoomSize roomSize = null;
		
		if (conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement(); 
				String sql = "SELECT room_size_id, room_size_description FROM room_sizes "
						+ "WHERE room_size_id = " + key;
				
				try 
				{
					ResultSet rs = stmt.executeQuery(sql);
					
					try 
					{
						if (rs.next()) 
						{
							roomSize = new RoomSize(rs.getLong(1), rs.getString(2));
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
				System.out.println("Could not retrieve room_size.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
		}
		
		return roomSize;
	}
	
	//Method to update room_size record with room_size_id
	@Override
	public void update(RoomSize entity) 
	{
		Connection conn = db.getConn();
		
		if (conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement();
				String sql = "UPDATE room_sizes SET room_size_description = '" + entity.getRoomSizeDescription()
					+ "', WHERE room_size_id = " + entity.getRoomSizeID();
				
				try 
				{
					stmt.executeUpdate(sql);
					System.out.println("Updated room_size: " + entity.toString());
				}
				finally
				{
					stmt.close();
				}
			}
			catch (SQLException ex)
			{
				System.out.println("Could not update room_size.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
	}	
	//Method to delete room_size record with room_size_id
	@Override
	public void remove(Long key) 
	{
		Connection conn = db.getConn(); 		
		if (conn != null) 
		{
			try
			{
				Statement stmt = conn.createStatement(); 
				String sql = "DELETE FROM room_sizes WHERE room_size_id = " + key;
				
				try 
				{
					stmt.executeUpdate(sql);
					System.out.println("Deleted room_size: roomSizeID = " + key);
				}
				finally
				{
					stmt.close();
				}
			}
			catch (SQLException ex)
			{
				System.out.println("Could not delete room_size.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
	}
}
