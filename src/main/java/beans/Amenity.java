package beans;

public class Amenity 
{
	private long amenityID;
	private String amenityDescription;
	private double price;
	private String payRate;
	
	public Amenity(long amenityID, String amenityDescription, double price, String payRate) 
	{
		this.amenityID = amenityID;
		this.amenityDescription = amenityDescription;
		this.price = price;
		this.payRate = payRate;
	}
	
	public Amenity() {}

	public long getAmenityID() 
	{
		return amenityID;
	}

	public void setAmenityID(long amenityID) 
	{
		this.amenityID = amenityID;
	}

	public String getAmenityDescription() 
	{
		return amenityDescription;
	}

	public void setAmenityDescription(String amenityDescription) 
	{
		this.amenityDescription = amenityDescription;
	}

	public double getPrice() 
	{
		return price;
	}

	public void setPrice(double price) 
	{
		this.price = price;
	}

	public String getPayRate() 
	{
		return payRate;
	}

	public void setPayRate(String payRate) 
	{
		this.payRate = payRate;
	}

	@Override
	public String toString() 
	{		
		return String.format("Amenity{amenityID=%s, amenityDescription=%s, price=%s, payRate=%s}", amenityID, 
				amenityDescription, price, payRate);
	}
}
