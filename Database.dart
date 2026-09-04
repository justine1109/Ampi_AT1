import 'database.dart';
import 'models.dart';

class StoresController {
  final DogPetStore dogPetStore;
  final CatPetStore catPetStore;
  final BirdPetStore birdPetStore;

  Pet? currentPet;

  StoresController(this.dogPetStore, this.catPetStore, this.birdPetStore);

  void addDog(String name, int hunger, int thirst, int happiness) {
    dogPetStore.add(Dog(name, hunger, thirst, happiness));
  }

  void addCat(String name, int hunger, int thirst, int happiness) {
    catPetStore.add(Cat(name, hunger, thirst, happiness));
  }

  void addBird(String name, int hunger, int thirst, int happiness) {
    birdPetStore.add(Bird(name, hunger, thirst, happiness));
  }

  void adoptDogRandom() {
    currentPet = dogPetStore.adoptRandom();
  }

  void adoptCatRandom() {
    currentPet = catPetStore.adoptRandom();
  }
  
  void adoptBirdRandom() {
    currentPet = birdPetStore.adoptRandom();
  }

  void adoptOut() {
    if (currentPet == null) {
      print("You have no pet!");
    }

    print("${currentPet?.name} has been put into adoption.");
    String petName = currentPet?.name ?? "null";
    int petHunger = currentPet?.hunger ?? 0;
    int petThirst = currentPet?.thirst ?? 0;
    int petHappiness = currentPet?.happiness ?? 0;

    switch(currentPet) {
      case Dog():
        final dog = Dog(petName, petHunger, petThirst, petHappiness);
        dogPetStore.add(dog);
      case Cat():
        final cat = Cat(petName, petHunger, petThirst, petHappiness);
        catPetStore.add(cat);
      case Bird():
        final bird = Bird(petName, petHunger, petThirst, petHappiness);
        birdPetStore.add(bird);
      default:
        print("Unknown pet type. Nothing added.");
    }

    currentPet = null;
  }

}
