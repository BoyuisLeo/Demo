
public class Main {
	public static void main(String[] args) {
		
		AnimalFactory animalFact = AnimalFactory.getAnimalFactory("sea");
		Animal animal = animalFact.getAnimal("fish");
		String speakSound = animal.speak();
		System.out.println(animalFact.getClass().getName());
		System.out.println(animal.getClass().getName());
		System.out.println(speakSound);
	}
}
