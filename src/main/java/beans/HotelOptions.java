package beans;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

public class HotelOptions {
	
	private ArrayList<String> roomSizes = new ArrayList<String>();
	private Map<String, Double> amenities = new LinkedHashMap<String, Double>();
	private Map<Integer, Double> guests = new LinkedHashMap<Integer, Double>();
	private int loyaltyPoints;
	
	
	public HotelOptions() {
		super();
		
		//Room Size
		this.roomSizes.add("Double Full");
		this.roomSizes.add("Queen");
		this.roomSizes.add("Double Queen");
		this.roomSizes.add("King");
		
		//Amenities
		this.amenities.put("Wi-Fi", 12.99);
		this.amenities.put("Breakfast", 8.99);
		this.amenities.put("Parking", 19.99);
		
		//Guests
		this.guests.put(1, 115.00);
		this.guests.put(2, 115.00);
		this.guests.put(3, 115.00);
		this.guests.put(4, 150.00);
		this.guests.put(5, 150.00);
		
		//loyaltyPoints
		this.loyaltyPoints = 150;
		
	}


	public ArrayList<String> getRoomSizes() {
		return roomSizes;
	}


	public void setRoomSizes(ArrayList<String> roomSizes) {
		this.roomSizes = roomSizes;
	}


	public Map<String, Double> getAmenities() {
		return amenities;
	}


	public void setAmenities(Map<String, Double> amenities) {
		this.amenities = amenities;
	}


	public Map<Integer, Double> getGuests() {
		return guests;
	}


	public void setGuests(Map<Integer, Double> guests) {
		this.guests = guests;
	}


	public int getLoyaltyPoints() {
		return loyaltyPoints;
	}


	public void setLoyaltyPoints(int loyaltyPoints) {
		this.loyaltyPoints = loyaltyPoints;
	}
	
	
}
