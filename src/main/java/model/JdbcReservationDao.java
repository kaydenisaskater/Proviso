package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
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
	public List<Reservation> listAggregatedReservation(Long userID) 
	{
		Connection conn = db.getConn();
		HashMap<Long, Reservation> hmReservations = new HashMap<Long, Reservation>();
		
		if(conn != null) 
		{
			try 
			{					
				CallableStatement stmt = conn.prepareCall("{call proviso.get_all_reservation_info(?)}");
				
				//Set userID parameter for procedure call
				stmt.setLong(1, userID);
				
				//Flag to check if call statement produced results
				boolean hasResults = stmt.execute();
				
				try 
				{
					while(hasResults)
					{
						ResultSet rs = stmt.getResultSet();
						try 
						{
							while(rs.next()) 
							{
								Reservation reservation;
								RoomSize roomSize = new RoomSize(rs.getLong("r.room_size_id"), rs.getString("s.room_size_description"));
								GuestOption guestOption = new GuestOption(rs.getLong("r.guest_option_id"), rs.getInt("g.guest_count"), rs.getDouble("g.price"));
								long reservationID = rs.getLong("r.reservation_id");
								
								if(hmReservations.containsKey(reservationID)) //Reservation is already mapped retrieve declared reservation
								{
									reservation = hmReservations.get(reservationID);
								}
								else //Reservation is not already mapped instantiate reservation object
								{
									reservation = new Reservation(reservationID, rs.getString("r.check_in_date"), rs.getString("r.check_out_date"),
											rs.getDouble("r.total_price"), rs.getLong("r.loyalty_points"), userID);
									reservation.setGuestOption(guestOption);
									reservation.setRoomSize(roomSize);
									hmReservations.put(reservationID, reservation);
								}
								
								//Check to see if amenity id field is not null and if so create and add amenity to reservation
								if((Long)rs.getLong("i.amenity_id") != null)
								{
									Amenity amenity = new Amenity(rs.getLong("i.amenity_id"), rs.getString("a.amenity_description"), rs.getDouble("a.price"), rs.getString("a.pay_rate"));
									reservation.addAmenity(amenity);								
								}
								reservation.toString();
							}	
						}
						finally 
						{
							rs.close();
						}
						hasResults = stmt.getMoreResults();
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
		List<Reservation> reservations = new ArrayList<Reservation>(values);
		return reservations;
	}
	
	//Method to retrieve a reservation with reservation_id
	@Override
	public Reservation find(Long reservationID) 
	{
		Connection conn = db.getConn();
		HashMap<Long, Reservation> hmReservations = new HashMap<Long, Reservation>();		
		Reservation reservation = null;
		
		if(conn != null) 
		{
			try 
			{					
				CallableStatement stmt = conn.prepareCall("{call proviso.get_all_reservation_info_by_reservation_id(?)}");
				
				//Set reservationID parameter for procedure call
				stmt.setLong(1, reservationID);
				
				//Flag to check if call statement produced results
				boolean hasResults = stmt.execute();
				
				try 
				{
					while(hasResults)
					{
						ResultSet rs = stmt.getResultSet();
						try 
						{
							while(rs.next()) 
							{
								
								if(hmReservations.containsKey(reservationID)) //Reservation is already mapped retrieve declared reservation
								{
									reservation = hmReservations.get(reservationID);
								}
								else //Reservation is not already mapped instantiate reservation object
								{
									RoomSize roomSize = new RoomSize(rs.getLong("r.room_size_id"), rs.getString("s.room_size_description"));
									GuestOption guestOption = new GuestOption(rs.getLong("r.guest_option_id"), rs.getInt("g.guest_count"), rs.getDouble("g.price"));
									reservation = new Reservation(reservationID, rs.getString("r.check_in_date"), rs.getString("r.check_out_date"),
											rs.getDouble("r.total_price"), rs.getLong("r.loyalty_points"), rs.getLong("r.user_id"));
									reservation.setGuestOption(guestOption);
									reservation.setRoomSize(roomSize);
									hmReservations.put(reservationID, reservation);
								}
								
								//Check to see if amenity id field is not null and if so create and add amenity to reservation
								if((Long)rs.getLong("i.amenity_id") != null)
								{
									Amenity amenity = new Amenity(rs.getLong("i.amenity_id"), rs.getString("a.amenity_description"), rs.getDouble("a.price"), rs.getString("a.pay_rate"));
									reservation.addAmenity(amenity);								
								}
								reservation.toString();
							}	
						}
						finally 
						{
							rs.close();
						}
						hasResults = stmt.getMoreResults();
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
		reservation = hmReservations.get(reservationID);
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
