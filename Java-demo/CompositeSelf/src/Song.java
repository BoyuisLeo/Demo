
public class Song extends SongComponent {
	String songName;
	
	public Song(String newSongName){	
		songName = newSongName;	
	}
	public String getSongName() { 
		return songName; 
		}
	public void displaySongInfo(){
		System.out.println(getSongName());
	}
}
