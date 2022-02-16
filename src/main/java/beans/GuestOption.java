package beans;

public class GuestOption 
{
	private long guestOptionID;
	private int guestCount;
	private double price;
	
	public GuestOption(long guestOptionID, int guestCount, double price) 
	{
		this.guestOptionID = guestOptionID;
		this.guestCount = guestCount;
		this.price = price;
	}
	
	public GuestOption() {}

	public long getGuestOptionID() 
	{
		return guestOptionID;
	}

	public void setGuestOptionID(long guestOptionID) 
	{
		this.guestOptionID = guestOptionID;
	}

	public int getGuestCount() 
	{
		return guestCount;
	}

	public void setGuestCount(int guestCount) 
	{
		this.guestCount = guestCount;
	}

	public double getPrice() 
	{
		return price;
	}

	public void setPrice(double price) 
	{
		this.price = price;
	}

	@Override
	public String toString() 
	{
		return String.format("GuestOption{guestOptionID=%s, guestCount=%s, price=%s}", guestOptionID, guestCount, price);
	}
}
