package beans;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.time.temporal.ChronoUnit;
import java.time.LocalDate;

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
	private ArrayList<Amenity> amenities = new ArrayList<Amenity>();
	private GuestOption guestOption;
	private RoomSize roomSize;
	private long noOfDaysBetween;
	
	public Reservation(long reservationID, String checkIn, String checkOut, double totalPrice, long loyaltyPoints,
			long roomSizeID, long guestOptionID, long userID) {
		this.reservationID = reservationID;
		this.checkIn = Date.valueOf(checkIn);
		this.checkOut = Date.valueOf(checkOut);
		this.totalPrice = totalPrice;
		this.loyaltyPoints = loyaltyPoints;
		this.roomSizeID = roomSizeID;
		this.guestOptionID = guestOptionID;
		this.userID = userID;
		this.setDaysBetween();
	}
	
	public Reservation(long reservationID, String checkIn, String checkOut, double totalPrice, long loyaltyPoints, long userID) {
		this.reservationID = reservationID;
		this.checkIn = Date.valueOf(checkIn);
		this.checkOut = Date.valueOf(checkOut);
		this.totalPrice = totalPrice;
		this.loyaltyPoints = loyaltyPoints;
		this.userID = userID;
		this.setDaysBetween();
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

	public ArrayList<Amenity> getAmenities() 
	{
		return amenities;
	}

	public void addAmenity(Amenity amenity) 
	{
		this.amenities.add(amenity);
	}
	
	public GuestOption getGuestOption()
	{
		return guestOption;
	}
	
	public void setGuestOption(GuestOption guestOption)
	{
		this.guestOption = guestOption;
		this.guestOptionID = this.guestOption.getGuestOptionID();
	}
	
	public RoomSize getRoomSize()
	{
		return roomSize;
	}
	
	public void setRoomSize(RoomSize roomSize)
	{
		this.roomSize = roomSize;
		this.roomSizeID = this.roomSize.getRoomSizeID();
	}
	
	public long getDaysBetween()
	{
		return this.noOfDaysBetween;	
	}
	
	public void setDaysBetween()
	{
		this.noOfDaysBetween = ChronoUnit.DAYS.between(LocalDate.parse(this.checkIn.toString()), LocalDate.parse(this.checkOut.toString()));
	}
	
	public long calculateLoyaltyPoints()
	{
		this.setDaysBetween();
		this.loyaltyPoints = 150 * this.noOfDaysBetween;
		return this.loyaltyPoints;
	}
	
	public double calculateTotalPrice()
	{
		this.setDaysBetween();
		Iterator<Amenity> iterator = amenities.iterator();
		while(iterator.hasNext())
		{
			Amenity amenity = (Amenity)iterator.next();
			if(amenity.getPayRate().equals("flat"))
			{
				this.totalPrice += amenity.getPrice();
			}
			else if(amenity.getPayRate().equals("per"))
			{
				this.totalPrice += this.noOfDaysBetween * amenity.getPrice();
			}
		}
		this.totalPrice += this.noOfDaysBetween * (this.guestOption.getPrice());
		return this.totalPrice;
	}

	@Override
	public String toString()
	{
		return String.format("Reservation{reservationID=%s, checkIn=%s, checkOut=%s, totalPrice=%s, loyaltyPoints=%s, "
				+ "roomSizeID=%s, guestOptionID=%s, userID=%s}", reservationID, checkIn.toString(), checkOut.toString(), 
				totalPrice, loyaltyPoints, roomSizeID, guestOptionID, userID);
	}
	
			
}
