
public class SeaAnimal extends AnimalFactory {

	@Override
	public Animal getAnimal(String animalName) {
		Animal animal = null;
		if ("fish".equals(animalName)){
			animal = new Fish();
		}
		return animal;
	}


}
