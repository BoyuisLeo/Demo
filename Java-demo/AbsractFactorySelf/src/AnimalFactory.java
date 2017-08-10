
public abstract class AnimalFactory {
	public abstract Animal getAnimal(String animalType); 
	
	public static AnimalFactory getAnimalFactory(String factoryType){
		AnimalFactory animalfact = null;
		if (("land").equals(factoryType)){
			animalfact = new LandAnimal();
		}
		else if (("sea").equals(factoryType)){
			animalfact = new SeaAnimal();
		}
			
		return animalfact;
		
	}
}
