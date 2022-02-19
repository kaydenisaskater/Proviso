package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import beans.Reservation;
import beans.Amenity;
import beans.RoomSize;
import beans.GuestOption;

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
				String sql = String.format("INSERT INTO reservations (check_in_date, check_out_date, "
						+ "total_price, loyalty_points, room_size_id, guest_option_id, user_id) "
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
	
	//Method to add new reservation record to database and return generated key (auto increment)
	public Long addRetrieveKey(Reservation entity) 
	{
		Connection conn = db.getConn(); 
		Reservation newReservation = entity;
		long generatedKey = 0;
		
		//Perform SQL INSERT INTO reservations Table and output success or fail
		if(conn != null) 
		{
			try 
			{
				String sql = String.format("INSERT INTO reservations (check_in_date, check_out_date, "
						+ "total_price, loyalty_points, room_size_id, guest_option_id, user_id) "
						+ "VALUES('%s', '%s', %s, %s, %s, %s, %s);", 
						newReservation.getCheckIn(), newReservation.getCheckOut(), newReservation.getTotalPrice(),
						newReservation.getLoyaltyPoints(), newReservation.getRoomSizeID(), newReservation.getGuestOptionID(),
						newReservation.getUserID());
				
				PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);; 
				
				try
				{
					generatedKey = stmt.executeUpdate();
					
					try(ResultSet rs = stmt.getGeneratedKeys()){
						while (rs.next()) {
							int newId = rs.getInt(1);
							generatedKey = newId;
					}
					}
					
					System.out.println("Inserted newReservation: " + newReservation.toString());
					System.out.println("Auto-Generated Key: " + generatedKey);
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
		
		return generatedKey;
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
						+ "FROM reservations";
				
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
	
	//Method to retrieve a list of all reservations with user_id
	public List<Reservation> list(Long userID) 
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
						+ "FROM reservations "
						+ "WHERE user_id = " + userID;
				
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
				System.out.println("Could not retrieve user's reservations.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
		
		return reservations;
	}
	
	//Method to retrieve a list of all reservations with user_id
		public ArrayList<Reservation> listAggregatedReservation(Long userID) 
		{
			Connection conn = db.getConn();
			HashMap<Long, Reservation> hmReservations = new HashMap<Long, Reservation>();
			
			if(conn != null) 
			{
				try 
				{
					Statement stmt = conn.createStatement();
					String sql = String.format("SELECT reservations.reservation_id, reservations.check_in_date, reservations.check_out_date, reservations.total_price, reservations.loyalty_points, include.amenity_id, amenities.amenity_description, amenities.price, amenities.pay_rate, reservations.room_size_id, room_sizes.room_size_description, reservations.guest_option_id, guest_options.guest_count, guest_options.price "
							+ "FROM users INNER JOIN (room_sizes INNER JOIN ((guest_options INNER JOIN reservations ON guest_options.guest_option_id = reservations.guest_option_id) INNER JOIN (amenities INNER JOIN include ON amenities.amenity_id = include.amenity_id) ON reservations.reservation_id = include.reservation_id) ON room_sizes.room_size_id = reservations.room_size_id) ON users.user_id = reservations.user_id "
							+ "WHERE (((reservations.user_id)=%s)) "
							+ "ORDER BY reservations.reservation_id, include.amenity_id", userID);
					System.out.println(sql);
					
					try 
					{
						ResultSet rs = stmt.executeQuery(sql);
						
						try 
						{
							System.out.println(rs.next() == false);
							while(rs.next()) 
							{
								Reservation reservation;
								Amenity amenity = new Amenity(rs.getLong(6), rs.getString(7), rs.getDouble(8), rs.getString(9));
								RoomSize roomSize = new RoomSize(rs.getLong(10), rs.getString(11));
								GuestOption guestOption = new GuestOption(rs.getLong(12), rs.getInt(13), rs.getDouble(14));
								long reservationID = rs.getLong(1);
								
								//If Reservation is already mapped insert amenities, guest option, and room size
								if(hmReservations.containsKey(reservationID))
								{
									reservation = hmReservations.get(reservationID);
								}
								else
								{
									reservation = new Reservation(reservationID, rs.getString(2), rs.getString(3),
											rs.getDouble(4), rs.getLong(5), userID);
									reservation.setGuestOption(guestOption);
									reservation.setRoomSize(roomSize);
									hmReservations.put(reservationID, reservation);
								}
								reservation.addAmenity(amenity);								
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
					System.out.println("Could not retrieve user's reservations.");
					System.out.println("SQL Exception: " + ex.getMessage());
				}
				finally 
				{
					db.closeConn(conn);
				}
			}
			Collection<Reservation> values = hmReservations.values();
			ArrayList<Reservation> reservations = new ArrayList<Reservation>(values);
			return reservations;
		}
	
	//Method to retrieve a reservation with reservation_id
	@Override
	public Reservation find(Long reservationID) 
	{
		Connection conn = db.getConn(); 
		
		Reservation reservation = null;
		
		if (conn != null) 
		{
			try 
			{
				Statement stmt = conn.createStatement();
				String sql = "SELECT reservation_id, check_in_date, check_out_date, total_price, loyalty_points, "
						+ " room_size_id, guest_option_id, user_id "
						+ "FROM reservations "
						+ "WHERE reservation_id = " + reservationID;
				
				try 
				{
					ResultSet rs = stmt.executeQuery(sql);
					
					try 
					{
						if (rs.next()) 
						{
							reservation = new Reservation(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getDouble(4), 
									rs.getLong(5), rs.getLong(6), rs.getLong(7), rs.getLong(8));
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
				System.out.println("Could not retrieve reservation.");
				System.out.println("SQL Exception: " + ex.getMessage());
			}
		}
		
		return reservation;
	}
	
	//Method to update reservation record with reservation_id
	@Override
	public void update(Reservation entity) 
	{
		// TODO - No feature to update reservation yet.
	}
	
	//Method to delete reservation record with reservation_id
	@Override
	public void remove(Long key) 
	{
		// TODO - No feature to delete reservation yet.
		
	}

}
