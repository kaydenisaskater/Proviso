package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Reservation;

public class JdbcReservationDao implements ReservationDao
{
	JdbcManager db = null;  
	
	public JdbcReservationDao() 
	{
		db = new JdbcManager();
	}
	
	//Method to add new reservation record to database
	@Override
	public void add(Reservation entity) 
	{
		Connection conn = db.getConn(); 
		Reservation newReservation = entity;
		
		//Perform SQL INSERT INTO reservations Table and output success or fail
		if(conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement(); 
				String sql = String.format("INSERT INTO `proviso`.`reservations` (`check_in_date`, `check_out_date`, "
						+ "`total_price`, `loyalty_points`, `room_size_id`, `guest_option_id`, `user_id`) "
						+ "VALUES('%s', '%s', %s, %s, %s, %s, %s);", 
						newReservation.getCheckIn(), newReservation.getCheckOut(), newReservation.getTotalPrice(),
						newReservation.getLoyaltyPoints(), newReservation.getRoomSizeID(), newReservation.getGuestOptionID(),
						newReservation.getUserID());
				
				try
				{
					stmt.executeUpdate(sql);
					System.out.println("Inserted newReservation: " + newReservation.toString());
				}
				finally 
				{
					stmt.close();				
				}
			}
			catch(SQLException ex)
			{
				System.out.println("Unable to insert newReservation: " + newReservation.toString());
				System.out.println("SQL Exception: " + ex.getMessage());
			}
		}
	}
	
	//Method to retrieve a list of all reservations
	@Override
	public List<Reservation> list() 
	{
		Connection conn = db.getConn();
		ArrayList<Reservation> reservations = new ArrayList<Reservation>();
		
		if(conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement();
				String sql = "SELECT reservation_id, check_in_date, check_out_date, total_price, loyalty_points, "
						+ " room_size_id, guest_option_id, user_id "
						+ "FROM users";
				
				try 
				{
					ResultSet rs = stmt.executeQuery(sql);
					
					try 
					{
						while(rs.next()) 
						{
							Reservation reservation = new Reservation();
							reservation.setReservationID(rs.getLong(1));
							reservation.setCheckIn(rs.getString(2));
							reservation.setCheckOut(rs.getString(3));
							reservation.setTotalPrice(rs.getDouble(4));
							reservation.setLoyaltyPoints(rs.getLong(5));
							reservation.setRoomSizeID(rs.getLong(6));
							reservation.setGuestOptionID(rs.getLong(7));
							reservation.setUserID(rs.getLong(8));
							reservations.add(reservation);
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
				System.out.println("Could not retrieve reservations.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
		
		return reservations;
	}

	@Override
	public Reservation find(Long reservationID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Reservation entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long key) {
		// TODO Auto-generated method stub
		
	}

}
