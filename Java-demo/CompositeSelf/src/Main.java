
public class Main {
public static void main(String[] args){
		
		SongComponent Dir1 = 
				new SongGroup("Dir1");
		
		SongComponent Dir2 = 
				new SongGroup("Dir2");
		
		SongComponent Dir3 = 
				new SongGroup("Dir3");
		
		
		SongComponent Dir4 = new SongGroup("Dir4");
		
		Dir4.add(new Song("file2.doc"));
		
		Dir2.add(Dir4);
		Dir3.add(new Song("image2.jpg"));
		Dir3.add(new Song("file1.doc"));
		
		Dir1.add(new Song("image1.jpg"));
		Dir1.add(Dir3);
		Dir1.add(Dir2);
		
		ShowList list = new ShowList(Dir1);
		
		list.getSongList();
		
		Dir1.remove(Dir2);
		System.out.println("\n");
		list.getSongList();
			
	}
	
}
