
public abstract class SongComponent {
	
	public void add(SongComponent newSongComponent) {
		
		throw new UnsupportedOperationException();
		
	}
	
	
		public void remove(SongComponent newSongComponent) {
			
			throw new UnsupportedOperationException();
			
	}
		
	// This allows me to get components
		
	public SongComponent getComponent(int componentIndex) {
			
		throw new UnsupportedOperationException();
			
	}
	
	// This allows me to retrieve song names
	
	public String getSongName() {
			
		throw new UnsupportedOperationException();
			
	}
	
	// This allows me to retrieve band names
	
	public String getBandName() {
				
		throw new UnsupportedOperationException();
				
	}
	
	// This allows me to retrieve release year
	
	public int getReleaseYear() {
				
		throw new UnsupportedOperationException();
				
	}
	
	// When this is called by a class object that extends
	// SongComponent it will print out information
	// specific to the Song or SongGroup
	
	public void displaySongInfo() {
				
		throw new UnsupportedOperationException();
				
	}
	
}