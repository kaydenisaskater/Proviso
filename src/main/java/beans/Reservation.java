package beans;

import java.sql.Date;

public class Reservation 
{
	private long reservationID;
	private Date checkIn;
	private Date checkOut;
	private double totalPrice;
	private long loyaltyPoints;
	private long roomSizeID;
	private long guestOptionID;
	private long userID;
	
	public Reservation(long reservationID, String checkIn, String checkOut, double totalPrice, long loyaltyPoints,
			long roomSizeID, long guestOptionID, long userID) {
		this.reservationID = reservationID;
		this.checkIn = Date.valueOf(checkOut);
		this.checkOut = Date.valueOf(checkOut);
		this.totalPrice = totalPrice;
		this.loyaltyPoints = loyaltyPoints;
		this.roomSizeID = roomSizeID;
		this.guestOptionID = guestOptionID;
		this.userID = userID;
	}
	
	public Reservation() {}

	public long getReservationID() 
	{
		return reservationID;
	}

	public void setReservationID(long reservationID) 
	{
		this.reservationID = reservationID;
	}

	public String getCheckIn() 
	{
		return checkIn.toString();
	}

	public void setCheckIn(String checkIn) 
	{
		this.checkIn = Date.valueOf(checkIn);
	}

	public String getCheckOut() 
	{
		return checkOut.toString();
	}

	public void setCheckOut(String checkOut) 
	{
		this.checkOut = Date.valueOf(checkOut);
	}

	public double getTotalPrice() 
	{
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) 
	{
		this.totalPrice = totalPrice;
	}

	public long getLoyaltyPoints() 
	{
		return loyaltyPoints;
	}

	public void setLoyaltyPoints(long loyaltyPoints) 
	{
		this.loyaltyPoints = loyaltyPoints;
	}

	public long getRoomSizeID() 
	{
		return roomSizeID;
	}

	public void setRoomSizeID(long roomSizeID) 
	{
		this.roomSizeID = roomSizeID;
	}

	public long getGuestOptionID() 
	{
		return guestOptionID;
	}

	public void setGuestOptionID(long guestOptionID) 
	{
		this.guestOptionID = guestOptionID;
	}

	public long getUserID() 
	{
		return userID;
	}

	public void setUserID(long userID) 
	{
		this.userID = userID;
	}

	@Override
	public String toString()
	{
		return String.format("Reservation{reservationID=%s, checkIn=%s, checkOut=%s, totalPrice=%s, loyaltyPoints=%s, "
				+ "roomSizeID=%s, guestOptionID=%s, userID=%s}", reservationID, checkIn.toString(), checkOut.toString(), 
				totalPrice, loyaltyPoints, roomSizeID, guestOptionID, userID);
	}
	
			
}
