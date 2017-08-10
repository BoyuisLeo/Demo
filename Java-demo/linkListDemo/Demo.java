package linkListDemo;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Scanner;

public class Demo {
	
	public static void main(String[] args) {
		LinkedList<String> placeToVisit = new LinkedList<>();
		
		
		addNewCity(placeToVisit, "A");
		addNewCity(placeToVisit, "B");
		addNewCity(placeToVisit, "C");
		addNewCity(placeToVisit, "D");
		addNewCity(placeToVisit, "E");
		addNewCity(placeToVisit, "F");
		addNewCity(placeToVisit, "G");
		
		
		
		
		
		//printList(placeToVisit);
		travel(placeToVisit);
		
		
		
	}
	
	private static void printList(LinkedList<String> linklist){
		Iterator<String> i = linklist.iterator();
		while(i.hasNext()){
			System.out.println("Now visiting " + i.next());
		}
	}
	
	private static boolean addNewCity(LinkedList<String> linklist, String newCity){
		ListIterator<String> currentCity = linklist.listIterator();
		while(currentCity.hasNext()){
			int comparsion = currentCity.next().compareTo(newCity);
			
			if(comparsion ==0){
				System.out.println("Current City already exist, no new city added");
				return false;
			}
			if(comparsion > 0){
				currentCity.previous();
				currentCity.add(newCity);
				System.out.println("New City " + newCity + " has added.");
				return true;
			}
			if(comparsion < 0){
				
			}
		}
		currentCity.add(newCity);
		System.out.println("New City " + newCity + " has added.");
		return true;
	}
	
	private static void travel(LinkedList<String> cities){
		Scanner scanner = new Scanner(System.in);
		boolean quit = false;
		boolean forward = true;
		ListIterator<String> i = cities.listIterator();
		
		if(cities.isEmpty()){
			System.out.println("queue is empty");
			return;
		}else{
			System.out.println("Now visiting " + i.next());
		}
		
		while(!quit){
			int action = scanner.nextInt();
			scanner.nextLine();
			switch(action){
				case 0:
					quit = true;
					break;
				case 1:
					if(!forward){
						if(i.hasNext()){
							i.next();
						}
						forward = true;
					}
					if(i.hasNext()){
						System.out.println("Now visiting "+ i.next());
					}else{
						System.out.println("Reach the end of trip");
						forward = false;
					}
					break;
				case 2:
					if(forward){
						if(i.hasPrevious()){
							i.previous();
						}
						forward = false;
					}
					if(i.hasPrevious()){
						System.out.println("Now visiting "+ i.previous());
					}else{
						System.out.println("Start your trip");
						forward = true;
					}
					break;
			}
		}
	}

	
}
