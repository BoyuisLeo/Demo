
public class Main {
	
	public static void main(String[] args) {
		OS obj = getOS("close");
		obj.spec();
		
	}
	
	public static OS getOS (String os){
		if (os == "open"){
			return new Andorid();
		}
		else if (os == "close"){
			return new iOS();
		}
		else 
			return new Win();
	}
}
