
public class LandAnimal extends AnimalFactory {

	@Override
	public Animal getAnimal(String animalName) {
		Animal animal = null;
		if ("dog".equals(animalName)){
			animal = new Dog();
		}else if ("cat".equals(animalName)){
			animal = new Cat();
		}
		return animal;
	}

}
