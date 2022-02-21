package beans;

public class Inclusion 
{
	private long reservationID;
	private long amenityID;
	
	public Inclusion(long reservationID, long amenityID) 
	{
		this.reservationID = reservationID;
		this.amenityID = amenityID;
	}
	
	public Inclusion() {}

	public long getReservationID() 
	{
		return reservationID;
	}

	public void setReservationID(long reservationID) 
	{
		this.reservationID = reservationID;
	}

	public long getAmenityID() 
	{
		return amenityID;
	}

	public void setAmenityID(long amenityID) 
	{
		this.amenityID = amenityID;
	}

	@Override
	public String toString() 
	{		
		return String.format("Inclusion{reservationID=%s, amenityID=%s}", reservationID, amenityID);
	}
}
