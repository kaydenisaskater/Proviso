package beans;

public class RoomSize 
{
	private long roomSizeID;
	private String roomSizeDescription;
	
	public RoomSize(long roomSizeID, String roomSizeDescription) 
	{
		this.roomSizeID = roomSizeID;
		this.roomSizeDescription = roomSizeDescription;
	}
	
	public RoomSize() {}

	public long getRoomSizeID() 
	{
		return roomSizeID;
	}

	public void setRoomSizeID(long roomSizeID) 
	{
		this.roomSizeID = roomSizeID;
	}

	public String getRoomSizeDescription() 
	{
		return roomSizeDescription;
	}

	public void setRoomSizeDescription(String roomSizeDescription) 
	{
		this.roomSizeDescription = roomSizeDescription;
	}

	@Override
	public String toString() 
	{
		return String.format("RoomSize{roomSizeID=%s, roomSizeDescription=%s}", roomSizeID, roomSizeDescription);
	}	
}
